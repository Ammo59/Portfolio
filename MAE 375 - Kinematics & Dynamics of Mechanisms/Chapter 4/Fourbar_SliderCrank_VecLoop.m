% Aramis Kelkelyan
% MAE 375: Quiz 1 
% Problem 2
% Date: 10/07/2021
%-----------------------------------------
clear;clc;

%Given values
row = input('Enter lengths of [a, b, c, d]: ');
a = row(1); b = row(2); c = row(3); d = row(4);
theta4 = 90;

%Find link ratios K1 through K3
K1 = a^2-b^2+c^2+d^2;
K2 = -2*a*c;
K3 = -2*a*d;

%Define variables from link ratios
A = K1-K3;
B = 2*K2;
C = K1+K3;

theta2_open = 2*atan2d((-B+sqrt(B^2-4*A*C)),(2*A));
theta2_crossed = 2*atand((-B-sqrt(B^2-4*A*C))/(2*A));

theta3_open = asind(-(a*sind(theta2_open)-c)/b)+180;
theta3_crossed = acosd((a*sind(theta2_crossed)-c)/b)+180;

%Print open and crossed configurations
fprintf('The open configuration has values for theta 2 at %5.2f° and theta 3 at %5.2f°\n', theta2_open, theta3_open);
fprintf('The crossed configuration has values for theta 2 at %5.2f° and theta 3 at %5.2f°\n', theta2_crossed, theta3_crossed);
