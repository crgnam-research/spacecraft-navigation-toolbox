%% Generating a Gravity Field from a Shape Model:
% Chris Gnam - 2021

%% Include all Packages:
clear; matlabrc; clc; close all; rng(1);
addpath(genpath('../../src')); % Include all source code
addpath(genpath('../../lib')); % Include all 3rd party libraries
addpath(genpath('data'));  % include the data specific to this project

% Load in a bennu shape model:
mass = 78e9; %(kg) Mass of bennu
bennu = ShapeModel('bennu.obj','Mass',mass);

% Densely pack the shape model with spheres:
sphere_radius = 20; %(m)
spheres = bennu.packSpheres(sphere_radius);

% Create a gravity field using finite element method:
gravField = GravityField('FiniteSphere',spheres);

%% Generate a spherical harmonic model:
% Define the size of the spherical harmonic potential to be fit:
N = 10;
M = 10;
[~,radii] = normr(bennu.vertices);
ref_radius = mean(radii);
truthType = 'FiniteSphere';

% Options for the optimzation routine:
options = optimoptions('fmincon','Display','iter',...
                       'FiniteDifferenceStepSize', 1e-16,...
                       'OptimalityTolerance',1e-12,...
                       'StepTolerance',1e-16,...
                       'MaxFunctionEvaluations',1e6);
                        
% Fit the gravity field:
gravField.generateSphHarm(N,M,ref_radius,truthType,options);

%% Evaluate and Compare the Two Fields:
num_long = 360/5;
num_lat  = 180/5;
rho      = 500;
[longitude,latitude,positions] = generateGridMap(num_long,num_lat,rho);

% Evaluate the finite sphere model:
[acce1_fs,accel_mag_fs] = gravField.batchAcceleration(positions,eye(3),'FiniteSphere');

% Evaluate the spherical harmonic model:
[acce1_sh,accel_mag_sh] = gravField.batchAcceleration(positions,eye(3),'SphHarm');

% Plot the results:
longitude = rad2deg(longitude);
latitude  = rad2deg(latitude);
figure()
    surf(longitude,latitude,accel_mag_fs,'EdgeColor','none'); axis equal
    c = colorbar;
    c.Label.String = 'Gravitational Acceleration (m/s^2)';
    vals = caxis;
    view([0 90])
    title('Finite Sphere Model')
    xlabel('Longitude (deg)')
    ylabel('Latitude (deg)')
    
figure()
    surf(longitude,latitude,accel_mag_sh,'EdgeColor','none'); axis equal
    c = colorbar;
    c.Label.String = 'Gravitational Acceleration (m/s^2)';
    caxis(vals);
    view([0 90])
    title('Spherical Harmonic Model')
    xlabel('Longitude (deg)')
    ylabel('Latitude (deg)')
    
figure()
    surf(longitude,latitude,accel_mag_sh - accel_mag_fs,'EdgeColor','none'); axis equal
    c = colorbar;
    c.Label.String = 'Gravitational Acceleration (m/s^2)';
    caxis([0 vals(2)/100]);
    view([0 90])
    title('Difference')
    xlabel('Longitude (deg)')
    ylabel('Latitude (deg)')
