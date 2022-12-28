%
% Aramis Kelkelyan
% MAE 375: Homework #8, Chapter 11 
% Problem 10
% Date: 12/11/2021
%-----------------------------------------
clear;clc;
%This is a fourbar triple-rocker
%input: theta 2, omega 2, alpha 2, 4 link lengths + Rpa
%input cont: cross sections (width x thickness), horizontal force at P
%output: pin forces and torques needed to drive crank at shown position
%Use equations on pg 606 (lookup pg.633) method in Section 11.5

%Given basic link info 
links = input('Enter lengths of [a, b, c, d, p]: ');
a = links(1); b = links(2); c = links(3); d = links(4); Rpa = links(5);
angles = input('Enter initial angles of [theta2, delta3] in degrees: ');
theta2 = angles(1); delta3 = angles(2); %delta 3 is coupler point angle
omega2 = input('Enter angular velocity (omega) of link 2 in rad/s: ');
alpha2 = input('Enter angular acceleration (alpha) of link 2 in rad/s^2: ');

%Coupler point force, torque, cross sections, and other info
Force = input('Enter applied Force (in Newtons) [Fpx, Fpy] on Point P: ');
FP3x = Force(1); FP3y = Force(2);
cross_sec = input('Enter [width2, thick2, thick3, width4, thick4] in mm: ');
width2 = cross_sec(1)/1000; width4 = cross_sec(4)/1000;
thick2 = cross_sec(2)/1000; thick3= cross_sec(3)/1000; thick4 = cross_sec(5)/1000;
mat_gamma = input('Enter specific weight of materials in kg/m^3 [gamma_steel, gamma_alum]: ');
gamma_steel = mat_gamma(1); gamma_alum = mat_gamma(2);
%specific weight of steel = 8303.97 kg/m^3 and aluminum 2767.99 kg/m^3
Torque = input('Enter Torque at Points [3, 4]: ');
T3 = Torque(1); T4 = Torque(2);

%Position, Velocity and Acceleration Analysis
%Use Fourbar_Vecloop Code to find Theta, Omega, and Alpha 3 and 4 

%Define link coefficients and constants
K1 = d/a; K2 = d/c; K3 = ((a^2-b^2+c^2+d^2)/(2*a*c));
K4 = d/b; K5 = ((c^2-d^2-a^2-b^2)/(2*a*b));
A = cosd(theta2)-K1-K2*cosd(theta2)+K3;
B = -2*sind(theta2); C = K1 - (K2+1)*cosd(theta2)+K3;
D = cosd(theta2)-K1+K4*cosd(theta2)+K5;
E = -2*sind(theta2); F = K1 + (K4-1)*cosd(theta2)+K5;

%Find theta 3 and theta 4
theta4 = 2.*atan2d((-B-sqrt(B.*B-4*A.*C)),2*A)-360;
% theta4_crossed = 2.*atan2d((-B+sqrt(B.*B-4*A.*C)),2*A);
theta3 = 2.*atan2d((-E-sqrt(E.*E-4*D.*F)),2*D)-360;
% theta3_crossed = 2.*atan2d((-E+sqrt(E.*E-4*D.*F)),2*D);

%Find omega 3 and 4
omega3 = ((a*omega2)/b)*(sind(theta4-theta2)/sind(theta3-theta4));
% omega3_crossed = ((a*omega2)/b)*(sind(theta4_crossed-theta2)/sind(theta3_crossed-theta4_crossed));
omega4 = ((a*omega2)/c)*(sind(theta2-theta3)/sind(theta4-theta3));
% omega4_crossed = ((a*omega2)/c)*(sind(theta2-theta3_crossed)/sind(theta4_crossed-theta3_crossed));

%Find links 3 and 4 angular accelerations for open and crossed configs, use equation 7.12
A1 = c*sind(theta4); B1 = b*sind(theta3);
C1 = a*alpha2*sind(theta2)+a*omega2^2*cosd(theta2)+b*omega3^2*cosd(theta3)-c*omega4^2*cosd(theta4);
D1 = c*cosd(theta4); E1 = b*cosd(theta3);
F1 = a*alpha2*cosd(theta2)-a*omega2^2*sind(theta2)-b*omega3^2*sind(theta3)+c*omega4^2*sind(theta4);

alpha3 =((C1*D1)-(A1*F1))/((A1*E1)-(B1*D1));
alpha4 =(C1*E1-B1*F1)/(A1*E1-B1*D1);

%cross configurations
% A2 = c*sind(theta4_crossed); B2 = b*sind(theta3_crossed);
% C2 = a*alpha2*sind(theta2)+a*omega2^2*cosd(theta2)+b*omega3_crossed^2*cosd(theta3_crossed)-c*omega4_crossed^2*cosd(theta4_crossed);
% D2 = c*cosd(theta4_crossed); E2 = b*cosd(theta3_crossed);
% F2 = a*alpha2*cosd(theta2)-a*omega2^2*sind(theta2)-b*omega3_crossed^2*sind(theta3_crossed)+c*omega4_crossed^2*sind(theta4_crossed);
% 
% alpha3_crossed =(C2*D2-A2*F2)/(A2*E2-B2*D2);
% alpha4_crossed =(C2*E2-B2*F2)/(A2*E2-B2*D2);

%Determine distance to Center of Gravity on the Local Rotating Coordinate System
RCG2 = 0.5*a; RCG4 = 0.5*c;
RCG3x = (Rpa*cosd(delta3)+b)/3; RCG3y = (Rpa*sind(delta3))/3;
RCG3 = sqrt((RCG3x^2+RCG3y^2)); deltaRP3 = atan2d(RCG3y, RCG3x);

%Calculate mass and moment of Inertia
mass2 = width2*thick2*a*(gamma_steel);
mass3 = (1/2)*b*(Rpa*sind(delta3))*thick3*(gamma_alum);
mass4 = width4*thick4*c*(gamma_steel);

IG2 = (mass2/12)*(width2^2+a^2);
IG3 = (mass3/6)*(b^2+(Rpa*sind(delta3))^2);
IG4 = (mass4/12)*(width4^2+c^2);

%Calculate position vectors
R12x = RCG2*cosd(theta2+180); R12y = RCG2*sind(theta2+180);

R32x = RCG2*cosd(theta2); R32y = RCG2*sind(theta2);

R23x = RCG3*cosd(deltaRP3+theta3+180); R23y = RCG3*sind(deltaRP3+theta3+180);

R43x = b*cosd(theta3) - RCG3*cosd(theta3+deltaRP3); R43y = b*sind(theta3) - RCG3*sind(theta3+deltaRP3); 

R34x = RCG4*cosd(theta4); R34y = RCG4*sind(theta4);

R14x = RCG4*cosd(theta4+180); R14y = RCG4*sind(theta4+180);

RP3x = Rpa*cosd(theta3+delta3)-abs(R23x); RP3y = Rpa*sind(theta3+delta3)-abs(R23y);

%Calculate acceleration and force components
ag2 = RCG2*alpha2*(-sind(theta2)+1j*cosd(theta2))-a*omega2^2*(cosd(theta2)+1j*sind(theta2));
ag2x = real(ag2); ag2y = imag(ag2);
Aa = a*alpha2*(-sind(theta2)+1j*cosd(theta2))-a*omega2^2*(cosd(theta2)+1j*sind(theta2));

acg3 = RCG3*alpha3*(-sind(theta3+deltaRP3)+1j*cosd(theta3+deltaRP3))-RCG3*omega3^2*(cosd(theta3+deltaRP3)+1j*sind(theta3+deltaRP3));
ag3 = Aa + acg3;
ag3x = real(ag3); ag3y = imag(ag3);

ag4 = RCG4*alpha4*(-sind(theta4)+1j*cosd(theta4))-c*omega4^2*(cosd(theta4)+1j*sind(theta4));
ag4x = real(ag4); ag4y = imag(ag4);

%Calculate directional forces if necessary --> already given.

%Perform matrix calc's
C = [1 0 1 0 0 0 0 0 0
    0 1 0 1 0 0 0 0 0
    -R12y R12x -R32y R32x 0 0 0 0 1
    0 0 -1 0 1 0 0 0 0
    0 0 0 -1 0 1 0 0 0
    0 0 R23y -R23x -R43y R43x 0 0 0
    0 0 0 0 -1 0 1 0 0
    0 0 0 0 0 -1 0 1 0
    0 0 0 0 R34y -R34x -R14y R14x 0];
F = [mass2*ag2x 
    mass2*ag2y
    IG2*alpha2
    mass3*ag3x-FP3x
    mass3*ag3y-FP3y
    IG3*alpha3-RP3x*FP3y+RP3y*FP3x-T3
    mass4*ag4x
    mass4*ag4y
    IG4*alpha4-T4];
R = C\F;

fprintf('The eight unknown forces are as follows: \n');
fprintf('F12x = %5.2f N, F12y = %5.2f N\n', R(1), R(2));
fprintf('F32x = %5.2f N, F32y = %5.2f N\n', R(3), R(4));
fprintf('F43x = %5.2f N, F43y = %5.2f N\n', R(5), R(6));
fprintf('F14x = %5.2f N, F14y = %5.2f N\n', R(7), R(8));
fprintf('The torque applied to the crank at this instance is: %5.2f N-m\n', R(9));

