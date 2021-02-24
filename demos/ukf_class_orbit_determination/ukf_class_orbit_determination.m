%% UKF Class Orbit Determination Demo:


% Chris Gnam - 2020

%% Include all Packages:
clear; matlabrc; clc; close all; rng(1);
SRC = '../../src/';
addpath(genpath([SRC,'environment']));   % Include all environment models
addpath(genpath([SRC,'dynamics']));      % Include all dynamics models
addpath(genpath([SRC,'filtering']));     % Include the filtering tools
addpath(genpath([SRC,'measurement']));   % Include the measurement models
addpath(genpath([SRC,'visualization'])); % Include all the visualization tools

%% Setup The Simulation and Evnrionment:
dt = 60; %(sec) Time Step Size
duration = 86400; %(sec) Duration of the simulation

earth = CelestialBody();

%% Setup the Spacecraft:
vehicle = Spacecraft();

%% Setup the Measurement Model:
% Create three ground stations for collecting range measurements to the
% spacecraft:
gs1 = GroundStation(earth,);
gs2 = GroundStation(earth);
gs3 = GroundStation();

%% Setup the Filter:
% Define the UKF tuning parameters:
alpha
beta
kappa

% Provide initial state estimate:


% Create the Orbit Determination (OD) Filter:
od_filter = UKF(x_hat,P,Q,R,dynamics_model,dynamics_args,...
                              measurement_model,measurement_args,...
                              alpha,beta,kappa);

%% Simulate:
for ii = 1:L-1
    % Move the scenario one time step forward:
    earth.update(dt); % Update the Earth's orientation
    vehicle.propagate(dt,earth); % Propogate the spacecraft around the Earth
    gs1.update_position(earth);  % Update the ground station locations in inertial space
    gs2.update_position(earth);
    gs3.update_position(earth);
    
    % Collect the range measurements from each ground station:
    [range1,avail1] = gs1.range(spacecraft);
    [range2,avail2] = gs2.range(spacecraft);
    [range3,avail3] = gs3.range(spacecraft);
    
    % Format all measurements and availabilities to pass into the filter:
    measurement = [range1; range2; range3];
    measAvails  = [avail1; avail2; avail3];
    
    % Get updated estimate:
    od_filter.estimate(dt, measurement, measAvails);
    
    % Log data for plotting later:
end