%
% Aramis Kelkelyan, Group Member 1, Octavio Gutierrez, Group Member 2
% MAE 205 Section 11/12
%
% Laboratory 5, Problem 3
%------------------------------------------------------------------------
clear, clc;

%Prompt User to Input Initial Positions
x0 = input('The initial position of x before rotation: ');
y0 = input('The initial position of y before rotation: ');
z0 = input('The initial position of z before rotation: ');

%Initial Vector Using Coordinates before rotation is
v0 = [x0;y0;z0];

%Allow user to input axis of rotation
R_axis = input('The axis of rotation (x, y, or z): ','s'); 

%Theta equals the angle used to rotate about the n axis in degrees
theta = input('The angle used to rotate about the n axis in degrees: '); 

%Switch the rotation matrix about the x, y, and z-axis is (using functins to convert radians
%to degrees
switch (R_axis)
    case {'x','X'}
        R_theta = [1 0 0;0 cosd(theta) -sind(theta); 0 sind(theta) cosd(theta)];
    case{'y','Y'}
        R_theta = [cosd(theta) 0 sind(theta); 0 1 0; -sind(theta) 0 cosd(theta)];
    case{'z','Z'}
        R_theta = [cosd(theta) -sind(theta) 0; sind(theta) cosd(theta) 0; 0 0 1];
end

%The rotation is executed through the formula
vR = (R_theta)*v0;

%Display rotated vector
disp(vR);