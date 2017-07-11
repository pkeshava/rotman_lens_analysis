% Microstrip and Rotman Lens Design Script
% Pouyan Keshavarzian
% June 2017 MSc Studies

clear all
close all
clc

% Load Constants
constants = load('constants.mat');
% Define input fields for the microstrip design
input = struct('Frequency',5.9e9,'Height', 50, 'Width', 40, ...
    'copper_t', 1.4, 'Sub_epsr', 10.2, 'Sub_lsstan', 0.0023);

micro1 = MicrostripDesign(constants,input);
[Z_0,eps_eff,lambda_g, lambda_g_q, alpha_c, alpha_d] = ...
    calc_values(micro1,constants);

%% Lens Design
% Largely based on Hansen 1991

% first compute rotman lens dimensions at design frequency
f = input.Frequency;
lambda_0 = constants.c/input.Frequency; 
N = 3;
d = 0.5*lambda_0;
alpha = 30*pi/180;
psi = 30*pi/180;
gamma = sin(psi)/sin(alpha);
f1 = 2*lambda_g;

zeta_max = (N-1)*gamma*d/(2*f1);

Beta = 0.9;
f2 = Beta*f1;
C = cos(alpha);
S = sin(alpha);
zeta_0 = 2*sqrt(1-Beta*C)*sqrt(1-(1-Beta*C)/S^2)/S;


% for now just pick a zeta value that is between min and max

zeta = (zeta_0+zeta_max)/2;

% I THINK since Beta has the guided wavelength embedded inside of it 
% the calculations should be fine from here 

a = 1 - (1-Beta)^2/(1-Beta*C)^2-zeta^2/Beta^2;
b = -2 +2*zeta^2/Beta +2*(1-Beta)/(1-Beta*C) - zeta^2*S^2*(1-Beta)...
    /((1-Beta*C)^2);
c = -zeta^2 + zeta^2*S^2/(1-Beta*C)-zeta^4*S^4/(4*(1-Beta)^2);
%%

a0 = sqrt((1-sin(alpha)^2/eps_eff));
b0 = sin(alpha);

eta = N/f2;
g = f1/f2;



% Beta = f2/f1;
% gamma = sin(psi)/sin(alpha);
% zeta = y3*gamma/f1;
