%
% Aramis Kelkelyan
% MAE 375: Homework #8, Chapter 11 
% Problem 37
% Date: 12/11/2021
%-----------------------------------------
clear;clc;
%This is a fourbar nongrashof tripe rocker
%input: theta 2, omega 2, alpha 2, 4 link lengths + Rpa
%input cont: cross sections (width x thickness), vertical force at P
%output: pin forces and torques needed to drive crank at shown position
%Use equations on pg 614 (lookup pg.641) method in Section 11.4 & 11.10
%This is solved using the energy method

%NOTE TO SELF: EDIT WITH DELTA'S IF TIME PERMITS

%Given basic link info 
links = input('Enter lengths of [a, b, c, d, p]: ');
a = links(1); b = links(2); c = links(3); d = links(4); Rpa = links(5);
angles = input('Enter initial angles of [theta2, delta3] in degrees: ');
theta2 = angles(1); delta3 = angles(2); %delta 3 is coupler point angle
omega2 = input('Enter angular velocity (omega) of link 2 in rad/s: ');
alpha2 = input('Enter angular acceleration (alpha) of link 2 in rad/s^2: ');

%Coupler point force, torque, cross sections, and other info
Force = input('Enter applied Force (in Newtons) [Fpx, Fpy] on Point P: ');
FPx = Force(1); FPy = Force(2);
diam = input('Enter diameter of cross section in mm: ')/1000;
spec_weight = input('Enter specific weight of materials in kg/m^3 [gamma_steel, gamma_alum]: ');
gamma_steel = spec_weight(1); gamma_alum = spec_weight(2);
%specific weight of steel = 8303.97 kg/m^3 and aluminum 2767.99 kg/m^3
Torque = input('Enter Torque at Points [3, 4]: ');
T3 = Torque(1); T4 = Torque(2);

%Define link coefficients and constants
K1 = d/a; K2 = d/c; K3 = ((a^2-b^2+c^2+d^2)/(2*a*c));
K4 = d/b; K5 = ((c^2-d^2-a^2-b^2)/(2*a*b));
A = cosd(theta2)-K1-K2*cosd(theta2)+K3;
B = -2*sind(theta2); C = K1 - (K2+1)*cosd(theta2)+K3;
D = cosd(theta2)-K1+K4*cosd(theta2)+K5;
E = -2*sind(theta2); F = K1 + (K4-1)*cosd(theta2)+K5;

%Find theta 3 and theta 4
theta4 = 2.*atan2d((-B-sqrt(B.*B-4*A.*C)),2*A)+360;
theta3 = 2.*atan2d((-E-sqrt(E.*E-4*D.*F)),2*D)+360;

%Find omega 3 and 4
omega3 = ((a*omega2)/b)*(sind(theta4-theta2)/sind(theta3-theta4));
omega4 = ((a*omega2)/c)*(sind(theta2-theta3)/sind(theta4-theta3));

%Find links 3 and 4 angular accelerations for open and crossed configs, use equation 7.12
A1 = c*sind(theta4); B1 = b*sind(theta3);
C1 = a*alpha2*sind(theta2)+a*omega2^2*cosd(theta2)+b*omega3^2*cosd(theta3)-c*omega4^2*cosd(theta4);
D1 = c*cosd(theta4); E1 = b*cosd(theta3);
F1 = a*alpha2*cosd(theta2)-a*omega2^2*sind(theta2)-b*omega3^2*sind(theta3)+c*omega4^2*sind(theta4);

alpha3 =((C1*D1)-(A1*F1))/((A1*E1)-(B1*D1));
alpha4 =(C1*E1-B1*F1)/(A1*E1-B1*D1);

%Determine distance to Center of Gravity on the Local Rotating Coordinate System
RCG2 = 0.5*a; RCG3 = 0.5*b; RCG4 = 0.5*c;

%Calculate mass and moment of Inertia
surfarea = pi/4*(diam)^2; %cross-section of circular link
mass2 = surfarea*a*(gamma_steel);
mass3 = surfarea*b*(gamma_steel);
mass4 = surfarea*c*(gamma_steel);

IG2 = (mass2/12)*(3/4*diam^2+a^2);
IG3 = (mass3/12)*(3/4*diam^2+b^2);
IG4 = (mass4/12)*(3/4*diam^2+c^2);

%Calculate velocity components
vg2 = RCG2*omega2*(-sind(theta2)+1j*cosd(theta2));
vg2x = real(vg2); vg2y = imag(vg2);

vA = a*omega2*(-sind(theta2)+1j*cosd(theta2));
vcga3 = RCG3*omega3*(-sind(theta3)+1j*cosd(theta3));
vg3 = vA + vcga3;
vg3x = real(vg3); vg3y = imag(vg3);

vPA = Rpa*omega3*(-sind(theta3+delta3)+1j*cosd(theta3+delta3));
vP = vA + vPA;
vPx = real(vP); vPy = imag(vP);

vg4 = RCG4*omega4*(-sind(theta4)+1j*cosd(theta4));
vg4x = real(vg4); vg4y = imag(vg4);

%Calculate acceleration and force components
ag2 = RCG2*alpha2*(-sind(theta2)+1j*cosd(theta2))-a*omega2^2*(cosd(theta2)+1j*sind(theta2));
ag2x = real(ag2); ag2y = imag(ag2);
Aa = a*alpha2*(-sind(theta2)+1j*cosd(theta2))-a*omega2^2*(cosd(theta2)+1j*sind(theta2));

acg3 = RCG3*alpha3*(-sind(theta3)+1j*cosd(theta3))-RCG3*omega3^2*(cosd(theta3)+1j*sind(theta3));
ag3 = Aa + acg3;
ag3x = real(ag3); ag3y = imag(ag3);

ag4 = RCG4*alpha4*(-sind(theta4)+1j*cosd(theta4))-c*omega4^2*(cosd(theta4)+1j*sind(theta4));
ag4x = real(ag4); ag4y = imag(ag4);

%Perform energy method
c1=ag2x*vg2x+ag2y*vg2y;
c2=ag3x*vg3x+ag3y*vg3y;
c3=ag4x*vg4x+ag4y*vg4y;
c4=IG2*alpha2*omega2+IG3*alpha3*omega3+IG4*alpha4*omega4;
c5=-FPx*vPx-FPy*vPy;

T12=(mass2*c1+mass3*c2+mass4*c3+c4+c5)/omega2;

fprintf('The torque applied to the crank at this instance is: %5.2f N-m\n', T12);

