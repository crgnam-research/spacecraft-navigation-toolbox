%% UKF Class Orbit Determination Demo:


% Chris Gnam - 2021

%% Include all Packages:
clear; matlabrc; clc; close all; rng(1);
addpath(genpath('../../src')); % Include all source code
addpath(genpath('../../lib')); % Include all 3rd party libraries
addpath(genpath('data'));  % include the data specific to this project
addpath(genpath('ukf_models')) % include the ukf models

%% Setup The Simulation Time:
dt = 1*60; %(sec) Time Step Size
duration = 2*86400; %(sec) Duration of the simulation
tspan = dt:dt:duration;

jd = 2.4593e+06;
time = Time('julianday',jd,dt);

%% DO STUFF WITH ME:
% Define the rotation model of the earth:
load('CIP2006.mat')
earth_rotation_model = @(x) Attitude('rotmat',eci2ecef(x,CIP2006));

%% Create the Earth Model:
% Define the gravity field of the earth: (use only 20x20 of egm96):
load('egm')
radius = 6371000;
earth_gravity  = GravityField(radius,mu,Cnm(1:20,1:20),Snm(1:20,1:20));

% Calculate the angular rate of the earth:
w_earth = [0; 0; 2*pi/(23*3600+56*60+4)];

% Define the display model for the earth (used for visualizations):
display_model = @() drawPlanet(radius,'earth');

% Define the simple model used for certain computations:
simple_model = Sphere([0;0;0],radius);

% Create the earth object:
earth = CelestialBody(earth_gravity,'AngularRate',w_earth,'DisplayModel',display_model,'SimpleModel',simple_model);

%% Setup the Spacecraft:
% Define the spacecraft orbit:
semi_major   = 20000000;
eccentricity = 0.3;
inclination  = deg2rad(56);
arg_of_peri  = deg2rad(0);
right_ascen  = deg2rad(0);
mean_anom    = deg2rad(0);
[r,v] = kep2rv(semi_major,eccentricity,inclination,arg_of_peri,right_ascen,mean_anom,mu);

% Create the spacecraft object:
satellite = Spacecraft(r,v,tspan,'Integrator','rk4');

%% Setup the Measurement Model:
% Define the 3 locations of the ground stations in an earth fixed frame:
gs_ecef1 = 1000*wgs842ecef([ 35.2824, -116.7846, 1]);
gs_ecef2 = 1000*wgs842ecef([ 40.4294,   -4.2488, 2]);
gs_ecef3 = 1000*wgs842ecef([-35.4025,  148.9829, 1]);

% Measurement noise standard deviations:
range_std   = 10; %(m) Standard deviation of a range measurement
doppler_std = 1;  %(Hz) Standard deviation of a doppler measurement

% Create three ground stations for collecting range measurements to the
% spacecraft:
frequency = 400e6; %(Hz) Frequency of the communications link
gs1 = GroundStation(earth,gs_ecef1,'Frequency',frequency,'RangeNoise',range_std,'DopplerNoise',doppler_std);
gs2 = GroundStation(earth,gs_ecef2,'Frequency',frequency,'RangeNoise',range_std,'DopplerNoise',doppler_std);
gs3 = GroundStation(earth,gs_ecef3,'Frequency',frequency,'RangeNoise',range_std,'DopplerNoise',doppler_std);

%% Setup the Filter:
% Define the UKF tuning parameters:
alpha = 1e-2;
beta  = 200;
kappa = 4;

% Provide initial state estimate:
x_hat = [satellite.position + 100*randn(3,1);
         satellite.velocity + 10*randn(3,1)];
     
% Initial Estimation Covariance:
P = diag([1e3 1e3 1e3 1e2 1e2 1e2]);

% Process Noise Covariance:
Q = diag([1e-6 1e-6 1e-6 1e-6 1e-6 1e-6]);

% Measurement Noise Covariance:
R = diag([range_std^2 range_std^2 range_std^2 doppler_std^2 doppler_std^2 doppler_std^2]);

% Create the gravity field model which will be used by the UKF:
ukf_gravity  = GravityField(radius,mu,Cnm(1:3,1:3),Snm(1:3,1:3));

% UKF Model Arguments:
dynamics_args    = {earth.attitude,ukf_gravity};
measurement_args = {earth.angularRate,gs1,gs2,gs3};

% Create the Orbit Determination (OD) Filter:
od_filter = UKF(x_hat,P,Q,R, alpha,beta,kappa, tspan,...
                @ukf_orbit_model,dynamics_args,...
                @ukf_measurement_model,measurement_args);

%% Simulate:
for ii = 1:length(tspan)
    % Update the time:
    time.update(dt);
    
    % Update all of the included celestial bodies: ========================
    new_attitude = earth_rotation_model(time.jd);
    earth.updateAttitude(new_attitude); % Update the Earth's orientation
    
    % Update the ground stations now that Earth has been updated:
    gs1.update();
    gs2.update();
    gs3.update();
    
    
    % Propogate the spacecraft: ===========================================
    satellite.propagateOrbit(dt, earth); 
    
    
    % Collect the measurements from each ground station: ==================
    [range1,range_avail1] = gs1.range(satellite);
    [range2,range_avail2] = gs2.range(satellite);
    [range3,range_avail3] = gs3.range(satellite);
    [doppler1,doppler_avail1] = gs1.doppler(satellite);
    [doppler2,doppler_avail2] = gs2.doppler(satellite);
    [doppler3,doppler_avail3] = gs3.doppler(satellite);
    

    % Format measurements and availabilities for the filter: ==============
    measurement = [range1; range2; range3; doppler1; doppler2; doppler3];
    measAvails  = [range_avail1; range_avail2; range_avail3;
                   doppler_avail1; doppler_avail2; doppler_avail3];
    measurement = measurement(measAvails);
    

    % Get updated estimate: ===============================================
    dynamics_args    = {earth.attitude,ukf_gravity};
    measurement_args = {earth.angularRate,gs1,gs2,gs3};
    od_filter.update_args(dynamics_args,measurement_args);
    od_filter.estimate(dt, measurement, measAvails);
    

    % Logging: ============================================================
    od_filter.log(ii);
    satellite.log(ii); 
    
    
    % Show Visualization: =================================================
%     earth.draw();
%     satellite.draw('.r','MarkerSize',20);
%     satellite.drawTraj('r','LineWidth',1);
%     gs1.draw('.m','MarkerSize',20)
%     gs2.draw('.m','MarkerSize',20)
%     gs3.draw('.m','MarkerSize',20)
%     gs1.drawLink(satellite,'g','LineWidth',1)
%     gs2.drawLink(satellite,'g','LineWidth',1)
%     gs3.drawLink(satellite,'g','LineWidth',1)
%     drawnow
end

%% Display and Save the Results:
t_plt = tspan/3600;

figure(1)
h = drawResiduals(3,1,t_plt,...
                  od_filter.x_hat_log(1:3,:),...
                  satellite.position_log,...
                  od_filter.sig3_log(1:3,:),'b','LineWidth',1);
h{1}.YLim = [-1 1]*mean(od_filter.sig3_log(1,:));
h{2}.YLim = [-1 1]*mean(od_filter.sig3_log(2,:));
h{3}.YLim = [-1 1]*mean(od_filter.sig3_log(3,:));
h{1}.Title.String = 'Position Errors';
h{1}.YLabel.String = 'r_x (m)';
h{2}.YLabel.String = 'r_y (m)';
h{3}.YLabel.String = 'r_z (m)';
h{3}.XLabel.String = 'Time (hours)';
              
figure(2)
h = drawResiduals(3,1,tspan,...
                  od_filter.x_hat_log(4:6,:),...
                  satellite.velocity_log,...
                  od_filter.sig3_log(4:6,:),'b','LineWidth',1);
h{1}.YLim = [-1 1]*mean(od_filter.sig3_log(4,:));
h{2}.YLim = [-1 1]*mean(od_filter.sig3_log(5,:));
h{3}.YLim = [-1 1]*mean(od_filter.sig3_log(6,:));
h{1}.Title.String = 'Velocity Errors';
h{1}.YLabel.String = 'v_x (m/s)';
h{2}.YLabel.String = 'v_y (m/s)';
h{3}.YLabel.String = 'v_z (m/s)';
h{3}.XLabel.String = 'Time (hours)';