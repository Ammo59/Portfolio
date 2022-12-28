% Aramis Kelkelyan
% MAE 375: Homework #3, Chapter 4 
% Problem 12 A-F
% Date: 9/30/2021
%-----------------------------------------
clear;clc;

%Given values
row = input('Enter lengths of [d, a, c]: ');
d = row(1); a = row(2); c = row(3);
gamma = input('Enter angle of gamma in degrees: ');
theta2 = input('Enter angle of theta 2 in degrees: ');

%Define Substitute Variables
P = a*sind(theta2)*sind(gamma)+(a*cosd(theta2)-d)*cosd(gamma);
Q = -a*sind(theta2)*cosd(gamma)+(a*cosd(theta2)-d)*sind(gamma);
R = -c*sind(gamma);
S = R - Q;
T = 2*P;
U = Q + R;

%Find link length b, theta 3, and theta 4
theta4_open = 2*atand((-T+sqrt(T^2 - 4*S*U))/(2*S));
theta4_crossed = 2*atand((-T-sqrt(T^2 - 4*S*U))/(2*S)); 

theta3_open = theta4_open + gamma; 
theta3_crossed = theta4_crossed + gamma - 180;

b_open = (a*sind(theta2) - c*sind(theta4_open))/sind(theta3_open);
b_crossed = (a*sind(theta2) - c*sind(theta4_crossed))/sind(theta3_crossed);

%Calculate Vector Rb
Rb_open = [d,0] + c.*[cosd(theta4_open),sind(theta4_open)];
Rb_crossed = [d,0] + c.*[cosd(theta4_crossed),sind(theta4_crossed)];

%Output all values
fprintf('Open configuration values: theta 4 = %5.2f°, theta 3 = %5.3f°, Rb = %5.2f at angle %5.2f°\n', theta4_open, theta3_open, norm(Rb_open), atand(Rb_open(2)/Rb_open(1)));
fprintf('Crossed configuration values: theta 4 = %5.2f°, theta 3 = %5.3f°, Rb = %5.2f at angle %5.2f°\n', theta4_crossed, theta3_crossed, norm(Rb_crossed),atand(Rb_crossed(2)/Rb_crossed(1)));
