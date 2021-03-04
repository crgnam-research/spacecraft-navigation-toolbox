clear; matlabrc; clc; close all;
addpath(genpath('lib/m2docs'))

% Generate all documentation:
data = GenerateDocumentation({'src/'});