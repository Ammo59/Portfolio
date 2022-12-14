%
% Aramis Kelkelyan, Group Member 1, Anthony Perez, Group Member 2
% MAE 205 Section 11/12
%
% Laboratory 1, Problem 5
% ---------------------------------------------------------------------

clear; clc;

% Given values
g = 9.81; % m/s^2
v0 =  327; % m/s
alpha = 51 * (pi/180); %converted to radians
t = [2.5, 10.6, 18.7, 23.8, 25.9]; % seconds

% Calculate Cartesian Coordinates
x = v0*cos(alpha)*t ;
y = v0 * sin(alpha) * t - 0.5 * g * t.^2 ;

% Convert Cartesian to Polar Coordinates
r = sqrt(x.^2 + y.^2); % meters
theta = atan2(y,x); % radians