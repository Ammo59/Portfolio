% Aramis Kelkelyan
% MAE 375: Homework #6, Chapter 6 
% Problem 5
% Date: 11/2/2021
%-----------------------------------------
clear;clc;
%This is a general 4-bar linkage configuration
%the output: omega 3&4 and the velocity of coupler (link 3)
%Use example 6-7 on pg 324 (lookup pg.350) method in Section 6.7

%Given values
links = input('Enter link and vector lengths [1, 2, 3, 4, Rpa]: ');
d = links(1); a = links(2); b = links(3); c = links(4); Rpa = links(5);
angles = input('Enter initial angles/velocity of [theta 2, omega 2, delta 3] in degrees and rad/s: ');
theta2 = angles(1); omega2 = angles(2); delta3 = angles(3);

%Use Fourbar_Vecloop Code to find Theta 3 and 4 
%Find link ratios K1 through K3
K1 = d/a;
K2 = d/c;
K3 = (a^2-b^2+c^2+d^2)/(2*a*c);

%Use link ratios to find intermediate parameters A, B, C
A = cosd(theta2)-K1-K2*cosd(theta2)+K3;
B = -1*2*sind(theta2);
C = K1-(K2+1)*cosd(theta2)+K3;

%Use equation 4.10b to find theta 4
theta4_open = 2.*atand(0.5*(-B-sqrt(B*B-4*A*C))/A);
theta4_crossed = 2.*atand(0.5*(-B+sqrt(B*B-4*A*C))/A);

%Use equation 4.11b to find the ratios K4 and K5.
K4 = d/b;
K5 = (c*c-d*d-a*a-b*b)/(2*a*b);

%Use link ratios to find intermediate parameters D, E, F
D = cosd(theta2)-K1+K4*cosd(theta2)+K5;
E = -2*sind(theta2);
F = K1+(K4-1)*cosd(theta2)+K5;

%Use equation 4.13 to find theta 3
theta3_open = 2.*atand(0.5*(-E-sqrt(E*E-4*D*F))/D);
theta3_crossed = 2.*atand(0.5*(-E+sqrt(E*E-4*D*F))/D);

%Find omega 3 and 4
omega3_open = a/b*omega2 *(sind(theta4_open-theta2)/sind(theta3_open-theta4_open)); 
omega4_open = a/c*omega2 *(sind(theta2-theta3_open)/sind(theta4_open-theta3_open)); 
omega3_crossed = a/b*omega2 *(sind(theta4_crossed-theta2)/sind(theta3_crossed-theta4_crossed)); 
omega4_crossed = a/c*omega2 *(sind(theta2-theta3_crossed)/sind(theta4_crossed-theta3_crossed)); 

%Find linear velocities of points A and B for open & crossed configurations
%Point A is the joint between links 2 and 3
%Point B is the joint between links 3 and 4

VAx = a*omega2*(-sind(theta2)); VAy = a*omega2*(cosd(theta2));
VA_mag = norm(VAx,VAy); VA_ang = atan2d(VAy,VAx);

VABx_open = b*omega3_open*(-sind(theta3_open)); VABy_open = b*omega3_open*(cosd(theta3_open));
VAB_open_mag = norm(VABx_open,VABy_open); VAB_open_ang = atan2d(VABy_open,VABx_open);

VABx_crossed = b*omega3_crossed*(-sind(theta3_crossed)); VABy_crossed = b*omega3_crossed*(cosd(theta3_crossed));
VAB_crossed_mag = norm(VABx_crossed,VABy_crossed); VAB_crossed_ang = atan2d(VABy_crossed,VABx_crossed);

VBx_open = c*omega4_open*(-sind(theta4_open)); VBy_open = c*omega4_open*(cosd(theta4_open));
VB_open_mag = norm(VBx_open,VBy_open); VB_open_ang = atan2d(VBy_open,VBx_open);

VBx_crossed = c*omega4_crossed*(-sind(theta4_crossed)); VBy_crossed = c*omega4_crossed*(cosd(theta4_crossed));
VB_crossed_mag = norm(VBx_crossed,VBy_crossed); VB_crossed_ang = atan2d(VBy_crossed,VBx_crossed);

%Find Velocity of P, use section 6.9
%VP = VA + VP/A
VPAx_open = Rpa*omega3_open*(-sind(theta3_open+delta3)); 
VPAy_open = Rpa*omega3_open*(cosd(theta3_open+delta3)); 
VP_open = [VAx,VAy] + [VPAx_open,VPAy_open];
VP_open_mag = norm(VP_open); VP_open_ang = atan2d(VP_open(2),VP_open(1));

VPAx_crossed = Rpa*omega3_crossed*(-sind(theta3_crossed+delta3));
VPAy_crossed = Rpa*omega3_crossed*(cosd(theta3_crossed+delta3));
VP_crossed = [VAx,VAy] + [VPAx_crossed,VPAy_crossed];
VP_crossed_mag = norm(VP_crossed); VP_crossed_ang = atan2d(VP_crossed(2),VP_crossed(1));

%Print open and crossed configurations
fprintf('Open configuration: omega3 = %4.3f, omega4 = %4.3f, and Vp at [%6.3f, %6.3f] at angle %6.3f°\n', omega3_open, omega4_open, VP_open, VP_open_ang);
fprintf('Crossed configuration: omega3 = %4.3f, omega4 = %4.3f, and Vp at [%6.3f, %6.3f] at angle %6.3f°\n', omega3_crossed, omega4_crossed, VP_crossed, VP_crossed_ang);
