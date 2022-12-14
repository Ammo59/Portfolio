%
% Aramis Kelkelyan, Group Member 1, Octavio Gutierrez, Group Member 2
% MAE 205 Section 11/12
%
% Laboratory 2, Problem 4
%-----------------------------------------------------------------------

clear, clc;

%Prompt User to Input Initial Positions
x0 = input('The initial position of x before rotation: ');
y0 = input('The initial position of y before rotation: ');
z0 = input('The initial position of z before rotation: ');

%Initial Vector Using Coordinates before rotation is
v0 = [x0;y0;z0];

%Thetha equals the angle used to rotate about the n axis in degrees
theta = input('The angle used to rotate about the n axis in degrees: '); 

%The rotation matrix about the y-axis is (using functins to convert radians
%to degrees
Ry_theta = [cosd(theta) 0 sind(theta); 0 1 0; -sind(theta) 0 cosd(theta)];

%The rotation is executed through the formula
vR = (Ry_theta)*v0 ;

%Display the coordinates of the rotated vector
disp('Coordinates of rotated vector: ');
disp(vR);
