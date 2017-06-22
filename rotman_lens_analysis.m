% Rotman Lens Design Script
% Pouyan Keshavarzian
% June 2017 MSc Studies

clear all
close all
clc

% Load Constants
constants = load('constants.mat');
% Substrate And Design Parameters
% I use a structure to initialize and then use a class from there to 
% operate on the parameters from there
input = struct('Frequency',5.9e9,'Height', 50, 'Width', 40, ...
    'copper_t', 1.4, 'Sub_epsr', 10.2, 'Sub_lsstan', 0.0023);

micro1 = MicrostripDesign(constants,input);
[Z_0,eps_eff,lambda_g, lambda_g_q, alpha_c, alpha_d] = ...
    calc_values(micro1,constants);
