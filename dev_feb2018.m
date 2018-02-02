close all
clear all
clc

theta = linspace(0,2*pi,5000);
% Load Constants
constants = load('constants.mat');
% Define input fields for the microstrip design
input = struct('Frequency',5.3e9,'Height', 50, 'Width', 40, ...
    'copper_t', 1.4, 'Sub_epsr', 10.2, 'Sub_lsstan', 0.0023);
% create microstrip object instance
micro3 = MicrostripDesign(constants,input);
[Z_0,eps_eff,lambda_g, lambda_g_q, alpha_c, alpha_d] = ...
    calc_values(micro3,constants);

% Define input fields for the rotman design
rotmanparams = struct('Na', 7,'Nb', 5, 'Nd', 3, 'excited_port', 1, 'd', ... 
    0.5, 'alpha', 30, 'theta_t', 25, 'beta', 0.9, 'G', 5, 'W0', 2, ...
    'taper_a', 1);

% calculate parameters for rotman lens
rotman4 = RotmanDesign(rotmanparams, micro3);
[a, b, c, w, xa, ya] = calc_dimensions(rotman4, micro3);
W_W0 = w*rotman4.F;
% calculate array contour based on rotman parameters
ABC_a = [xa(1) ya(1);xa(2) ya(2);xa(3) ya(3)];
[r_a,xcyc_a] = fit_circle_through_3_points(ABC_a);


beam = beam_contour(rotman4);
[xant_yant] = antenna_positions(rotman4, xa, w);
v0 = arrayport_augment(xa, ya, beam.xcyc_t,0.0005/rotman4.F);
figure;

plotbeamcountour(beam.rb,beam.xcyc_b,beam.xbyb);
plotbeamcountour(r_a,xcyc_a,ABC_a);
hold on
scatter(xa,ya);
scatter(xant_yant(:,1),xant_yant(:,2));
legend('Beam Port Phase Centres', 'Beam Port Contour', ...
    'Array Port Phase Centres', 'Antenna Postitions');
xlabel('Normalized x coordinates with respect to F')
ylabel('Normalized y coordinates with respect to F')
title('Array Port and Beam Port Normalized Phase Centres')
hold off


%%
%close all
[xbt_r, ybt_r] = rotated_taper(rotman4, beam);
xbtrybtr = [xbt_r ybt_r];
XYBTR = rotman4.F*xbtrybtr;
% Plot unnormalized 
Rb = rotman4.F*beam.rb;
XCYC_b = rotman4.F*beam.xcyc_b;
XBYB = rotman4.F*beam.xbyb;
XBYB_t = rotman4.F*beam.xbyb_t;

%XtmYtm = rotman4.F*beam.xtmytm;

Xa = rotman4.F*xa';
Ya = rotman4.F*ya';
Xant = rotman4.F*xant_yant(:,1);
Yant = rotman4.F*xant_yant(:,2);

figure;
plotbeamcountour(Rb*1000,XCYC_b*1000,XBYB*1000);
hold on
grid on
scatter(Xa*1000,Ya*1000);
%scatter(Xant*1000,Yant*1000);
scatter(XBYB_t(:,1)*1000,XBYB_t(:,2)*1000);
scatter(XYBTR(:,1)*1000,XYBTR(:,2)*1000);
scatter(v0(1,:)*rotman4.F*1000,v0(2,:)*rotman4.F*1000);

legend('Beam Port Phase Centres', 'Beam Port Contour', ... 
    'Array Port Phase Centres', 'Antenna Positions', 'Tapered Phase Center');
xlabel('X Coordinate of Rotman Lens (mm)')
ylabel('Y Coordinates of Rotman Lens (mm)')
title('Array Port and Beam Port Phase Centres')
hold off

% Create array for coordinates. No dummy ports yet just parallel plate
% region

X = [Xa; XBYB(:,1)]*1000;
Y = [Ya; XBYB(:,2)]*1000;

out = [X,Y];
save('RL_coordinates.mat','X','Y')
save RL_XY_coordinates_in_mm.tab out  -ascii

DATA = dlmread('RL_XY_coordinates_in_mm.tab');
N = size(DATA,1)/2;
X=DATA(:,1);
Y=DATA(:,2);
Z=zeros(N,1);