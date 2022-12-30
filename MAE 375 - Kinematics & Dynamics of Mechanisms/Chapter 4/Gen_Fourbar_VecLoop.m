% Aramis Kelkelyan
% MAE 375: Homework #3, Chapter 4 
% Problem 7 A-H
% Date: 9/28/2021
%-----------------------------------------
clear;clc;
%Given 4 links and a set angle of theta 2, determine theta 3 and 4
%Output: both open and crossed configurations

%Given values
row = input('Enter lengths of [a, b, c, d]: ');
a = row(1); b = row(2); c = row(3); d = row(4);
theta2 = input('Enter angle of theta 2 in degrees: ');

%Define Grashof condition
condition = Grashof(a,b,c,d);

%Find link ratios K1 through K3
K1 = d/a; K2 = d/c;
K3 = (a^2-b^2+c^2+d^2)/(2*a*c);

%Use link ratios to find intermediate parameters A, B, C
A = cosd(theta2)-K1-K2*cosd(theta2)+K3;
B = -1*2*sind(theta2);
C = K1-(K2+1)*cosd(theta2)+K3;

%Use equation 4.11b to find the ratios K4 and K5.
K4 = d/b;
K5 = (c*c-d*d-a*a-b*b)/(2*a*b);

%Use link ratios to find intermediate parameters D, E, F
D = cosd(theta2)-K1+K4*cosd(theta2)+K5;
E = -2*sind(theta2);
F = K1+(K4-1)*cosd(theta2)+K5;

%Find theta 3 and theta 4
if strcmp('Grashof', condition) || strcmp('Special Grashof', condition) && length(theta2)==1
    %When theta 2 is a set angle value
    %Use equation 4.10b to find theta 4
    theta4_open = 2.*atan2d(-B-sqrt(B*B-4*A*C),2*A);
    theta4_crossed = 2.*atan2d(-B+sqrt(B*B-4*A*C),2*A);
    %Use equation 4.13 to find theta 3
    theta3_open = 2.*atan2d(-E-sqrt(E*E-4*D*F),2*D);
    theta3_crossed = 2.*atan2d(-E+sqrt(E*E-4*D*F),2*D);
elseif strcmp('Grashof', condition) || strcmp('Special Grashof', condition)
    %When condition is grashof, and theta is a range of values
    %Use open formula to simplify code
    theta4_open = 2.*atan2d(-B-sqrt(B*B-4*A*C),2*A);
    theta3_open = 2.*atan2d(-E-sqrt(E*E-4*D*F),2*D);
else
    %Use equation 4.10b to find theta 4
    theta4_open = 2.*atan2d(-B-sqrt(B*B-4*A*C),2*A);
    theta4_crossed = 2.*atan2d(-B+sqrt(B*B-4*A*C),2*A);
    %Use equation 4.13 to find theta 3
    theta3_open = 2.*atan2d(-E-sqrt(E*E-4*D*F),2*D);
    theta3_crossed = 2.*atan2d(-E+sqrt(E*E-4*D*F),2*D);
end

%Check angle values and replace them within range
theta3_open(theta3_open > 360) = theta3_open(theta3_open > 360) - 360;
theta3_open(theta3_open < 0) = theta3_open(theta3_open < 0) + 360;
theta4_open(theta4_open > 360) = theta4_open(theta4_open > 360) - 360;
theta4_open(theta4_open < 0) = theta4_open(theta4_open < 0) + 360;

if exist('theta3_crossed', 'var') && exist('theta4_crossed', 'var')
    
    theta3_crossed(theta3_crossed > 360) = theta3_crossed(theta3_crossed > 360) - 360;
    theta3_crossed(theta3_crossed < 0) = theta3_crossed(theta3_crossed < 0) + 360;
    
    theta4_crossed(theta4_crossed > 360) = theta4_crossed(theta4_crossed > 360) - 360;
    theta4_crossed(theta4_crossed < 0) = theta4_crossed(theta4_crossed < 0) + 360;
end

%Print open and crossed configurations
fprintf('The open configuration has values for theta 4 at %5.2f° and theta 3 at %5.2f°\n', theta4_open, theta3_open);
fprintf('The crossed configuration has values for theta 4 at %5.2f° and theta 3 at %5.2f°\n', theta4_crossed, theta3_crossed);
