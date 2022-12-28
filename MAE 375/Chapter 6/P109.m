% Aramis Kelkelyan
% MAE 375: Homework #6, Chapter 6 
% Problem 109
% Date: 11/2/2021
%-----------------------------------------
clear;clc;
%This is a quick-return mechanism 
%the output: VA, VB, Vslip

links = input('Enter lengths of [d, a, e]: ');
d = links(1); a = links(2); e = links(3);
angles = input('Enter initial angles of [theta 1, theta 2] in degrees: ');
theta1i = angles(1); theta2i = angles(2);
omega2 = input('Enter angular velocity (omega) of link 2 in rpm: ');

%Establish axes with O2 at origin
theta2 = theta2i - theta1i - 180;
theta4 = 180 - atand((a*sind(theta2))/(d-a*cosd(theta2)));
%theta 3 = theta 4
b = a*sind(theta2)/sind(theta4); 

%Velocity on link 2 
VA2 = abs(a*omega2); thetaVA2 = theta2 + sign(omega2)*90;

%Angle between VA2 vector and link 4 axis
alpha = thetaVA2 - theta4 + 360;
Vslip = VA2*cosd(alpha); Vtrans = VA2*sind(alpha);

%Angular velocity of Link 4 and VB
omega4 = Vtrans/b; VB = e*omega4;

fprintf('VA = %6.3f at angle %6.3f°, and VB = %6.3f\n', VA2, thetaVA2, VB);

