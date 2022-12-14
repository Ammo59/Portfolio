%
% Aramis Kelkelyan, Group Member 1, Octavio Gutierrez, Group Member 2
% MAE 205 Section 11/12
%
% Laboratory 4, Problem 1
%------------------------------------------------------------------------
clear; clc;

% Given values
g = 9.81; % units: m/s^2
v0 =  135; % units: m/s
alpha = 43*pi/180; %units in degrees converted to radians
t=linspace(0,10); %units in seconds

% Calculate Cartesian Coordinates
x = v0.*t*cos(alpha);
y = v0.*t*sin(alpha)-(0.5)*g.*(t.^2);

%Plot Graph as figure 9
figure(9);
%Plot y vs. x with green solid line and line width 2
plot(x,y,'g-','LineWidth',2);
%Label x axis
xlabel('Distance (in meters)');
%Label y axis
ylabel('Height (in meters)');
%Title Graph 'Height vs. Distance, include bold faced title and grid lines
title('\bf{Height vs. Distance}'); grid on;

%--------------------------------------------------------%

% Convert Cartesian to Polar Coordinates
r = sqrt(x.^2 + y.^2); % meters
theta = atan2(y,x); % radians

%Plot Graph as figure 12
figure(12);
%Plot y vs. x with yellow dash-dotted line with line width 3
polarplot(theta,r,'y-.','LineWidth',3);
%Title Graph 'Trajectory in Polar Coordinates'
title('{Trajectory in Polar Coordinates}');