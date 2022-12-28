%
% Aramis Kelkelyan
% MAE 375: Homework #8, Chapter 11 
% Problem 3
% Date: 12/10/2021
%-----------------------------------------
clear;clc;
%This is a fourbar crank-slider
%input: theta 2&3, omega 2, alpha 2&3, 3 link lengths
%output: forces and torques at shown position
%Assume coefficient of friction (mu) = 0
%Use equations on pg 606 (lookup pg.633) method in Section 11.5

%Given basic link info 
links = input('Enter lengths of [a, b, offset]: ');
a = links(1); b = links(2); c = links(3); %c is the offset
angles = input('Enter initial angles of [theta2, theta3] in degrees: ');
theta2 = angles(1); theta3 = angles(2); theta4 = 0;
omega2 = input('Enter angular velocity (omega) of link 2 in rad/s: ');
omega3 = input('Enter angular velocity (omega) of link 3 in rad/s: ');
omega4 = input('Enter angular velocity (omega) of link 4 in rad/s: ');

%Given positions
pos3 = input('Enter coupler point magnitude and angle [RP3, deltaRP3]: ');
RP3 = pos3(1); deltaRP3 = pos3(2);
cg_pos = input('Enter mass center positions [RCG2, RCG3] for links 2,3, 4: ');
RCG2 = cg_pos(1); RCG3 = cg_pos(2); RCG4 = cg_pos(3);
cg_dir = input('Enter mass center angles [delta2, delta3] for links 2,3: ');
delta2 = cg_dir(1); delta3 = cg_dir(2); 

%Given accelerations
ang_accels = input('Enter angular acceleration [alpha2, alpha3, alpha4] in rad/s^2: ');
alpha2 = ang_accels(1); alpha3 = ang_accels(2); alpha4 = ang_accels(3);
cg_accels = input('Enter center of gravity acceleration [ag2, ag3, ag4] in in/s^2: ');
ag2 = cg_accels(1); ag3 = cg_accels(2); ag4 = cg_accels(3);

cg_accels_dir = input('Enter center of gravity angles [theta_cg2, theta_cg3, theta_cg4] in degrees: ');
theta_ag2 = cg_accels_dir(1); theta_ag3 = cg_accels_dir(2); theta_ag4 = cg_accels_dir(3);
%Mass, Force, Intertia, Torque, and Other 
mass = input('Enter mass of links [2, 3, 4] in blobs: ');
mass2 = mass(1); mass3 = mass(2); mass4 = mass(3);
mu = 0; %friction coefficient

% Inertia = input('Enter Inertia of links [2, 3]: ');
% IG2 = Inertia(1); IG3 = Inertia(2);
width2 = input('Enter width of link 2: ');
width3 = input('Enter width of link 3: ');
IG2 = (mass2/12)*(width2^2+a^2);
IG3 = (mass3/12)*(width3^2+b^2);

FdeltaT = input('Enter Force magnitude, Force angle, and Torque [FP3, deltaFP3, T3] of link 3: ');
FP3 = FdeltaT(1); deltaFP3 = FdeltaT(2); T3 = FdeltaT(3);

%Calculate position vectors
R12x = RCG2*cosd(theta2+180); R12y = RCG2*sind(theta2+180);

R32x = RCG2*cosd(theta2); R32y = RCG2*sind(theta2);

R23x = RCG3*cosd(theta3); R23y = RCG3*sind(theta3);

R43x =(b - RCG3)*cosd(theta3+180); R43y = (b - RCG3)*sind(theta3+180); 

RP3x = RP3*cosd(theta3+180+deltaRP3); RP3y = RP3*sind(theta3+180+deltaRP3);

% ag2x = real(ag2); ag2y = imag(ag2);
% ag3x = real(ag3); ag3y = imag(ag3);
% ag4x = real(ag4);

%Calculate acceleration and force components
ag2x = ag2*cosd(theta_ag2); ag2y = ag2*sind(theta_ag2);
ag3x = ag3*cosd(theta_ag3); ag3y = ag3*sind(theta_ag3);
ag4x = ag4*cosd(theta_ag4); %No y component for crank-slider

FP3x = FP3*cosd(deltaFP3); FP3y = FP3*sind(deltaFP3);

%Perform matrix calc's
C = [1 0 1 0 0 0 0 0
    0 1 0 1 0 0 0 0
    -R12y R12x -R32y R32x 0 0 0 1
    0 0 -1 0 1 0 0 0
    0 0 0 -1 0 1 0 0
    0 0 R23y -R23x -R43y R43x 0 0
    0 0 0 0 -1 0 mu 0
    0 0 0 0 0 -1 1 0];
F = [mass2*ag2x 
    mass2*ag2y
    IG2*alpha2
    mass3*ag3x-FP3x
    mass3*ag3y-FP3y
    IG3*alpha3-RP3x*FP3y+RP3y*FP3x-T3
    mass4*ag4x-FP3x
    -FP3y];
R = C\F;

%Calculate Shaking Force
Fs = [-R(1); -R(2)-R(7)];
Fs_mag = norm(Fs); Fs_ang = atan2d(Fs(2),Fs(1));

fprintf('The eight unknown forces (in lbf) and Torque (lb-in) are as follows: \n');
fprintf('F12x = %5.2f, F12y = %5.2f\n', R(1), R(2));
fprintf('F32x = %5.2f, F32y = %5.2f\n', R(3), R(4));
fprintf('F43x = %5.2f, F43y = %5.2f\n', R(5), R(6));
fprintf('F14y = %5.2f, T12y = %5.2f\n', R(7), R(8));
fprintf('The shaking force and torque are listed below: \n');
fprintf('Fs = %5.2f at angle %5.3f°, Ts = %5.2f\n', Fs_mag, Fs_ang, -R(8));
