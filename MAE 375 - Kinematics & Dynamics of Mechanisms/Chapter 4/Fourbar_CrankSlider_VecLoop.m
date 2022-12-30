% Aramis Kelkelyan
% MAE 375: Homework #3, Chapter 4 
% Problem 10 A-D
% Date: 9/30/2021
%-----------------------------------------
clear;clc;

%Given values
row = input('Enter lengths of [a, b, offset]: ');
a = row(1); b = row(2); c = row(3);
theta2 = input('Enter angle of theta 2 in degrees: ');

%Convert theta 2 to radians
theta2rad = deg2rad(theta2);

%Use equation 4.16a and 4.17 to find theta 3
theta3_open = asin((a*sin(theta2rad) - c)/b);
theta3_crossed = asin((-a*sin(theta2rad) + c)/b) + pi;

%Use equation 4.16b to find d
d_open = a*cos(theta2rad) - b*cos(theta3_open);
d_crossed = a*cos(theta2rad) - b*cos(theta3_crossed);

if d_open < 0
    %Print reveresed open and crossed configurations
    fprintf('The open configuration has values for d at %5.2f and theta 3 at %5.2f°\n', d_crossed, rad2deg(theta3_crossed));
    fprintf('The crossed configuration has values for d at %5.2f and theta 3 at %5.2f°\n', d_open, rad2deg(theta3_open));
    
else
    %Print open and crossed configurations
    fprintf('The open configuration has values for d at %5.2f and theta 3 at %5.2f°\n', d_open, rad2deg(theta3_open));
    fprintf('The crossed configuration has values for d at %5.2f and theta 3 at %5.2f°\n', d_crossed, rad2deg(theta3_crossed));

end
