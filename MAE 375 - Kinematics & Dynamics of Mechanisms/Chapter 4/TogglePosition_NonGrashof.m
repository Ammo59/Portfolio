% Aramis Kelkelyan
% MAE 375: Homework #4, Chapter 4 
% Problem 21
% Date: 10/10/2021
%-----------------------------------------
clear;clc;clf;

%Given values
links = input('Enter lengths of [a, b, c, d, p]: ');
a = links(1); b = links(2); c = links(3); d = links(4); p = links(5);
angles = input('Enter initial angles of [theta 2, alpha, delta] in degrees: ');
theta2_in = angles(1); alpha = angles(2); delta = angles(3);

%Find toggle positions of theta 2
theta2_tog1 = acosd((a^2+d^2-b^2-c^2)/(2*a*d) + (b*c/(a*d)));
theta2_tog2 = acosd((a^2+d^2-b^2-c^2)/(2*a*d) - (b*c/(a*d)));

%Validate if toggle positions are of real value
if isreal(theta2_tog1) && isreal(theta2_tog2)
    theta2_tog = [theta2_tog1, theta2_tog2];
    theta2 = (min(theta2_tog):0.2:max(theta2_tog));
elseif isreal(theta2_tog1)
    theta2_tog = theta2_tog1;
    theta2 = (-theta2_tog:0.2:theta2_tog);
elseif isreal(theta2_tog2)
    theta2_tog = theta2_tog2;
    theta2 = (-theta2_tog:0.2:theta2_tog);
else
    mustBeReal(theta2_tog1);
    mustBeReal(theta2_tog2);
    disp('Both toggle angles are imaginary, please try again');
end

%Define link coefficients and constants
K1 = d/a; K4 = d/b; K5 = ((c^2-d^2-a^2-b^2)/(2*a*b));
D = cosd(theta2)-K1+K4*cosd(theta2)+K5;
E = -2*sind(theta2);
F = K1 + (K4-1)*cosd(theta2)+K5;

%Find theta 3
theta3_1 = 2.*atand(0.5*(-E-sqrt(E.*E-4*D.*F))./D);
theta3_2 = 2.*atand(0.5*(-E+sqrt(E.*E-4*D.*F))./D);

%Find coordinates of coupler point, P
Rpx = a*cosd(theta2)+p*cosd(theta3_1+delta);
Rpy = a*sind(theta2)+p*sind(theta3_1+delta);
LCS = [Rpx; Rpy];
GCS = [Rpx*cosd(alpha)-Rpy*sind(alpha); Rpx*sind(alpha)+ Rpy*cosd(alpha)];
x = GCS(1,:); y = GCS(2,:);

%Graph the coordinates of the coupler point
figure(2);
%Plot y vs. x with green solid line and line width 2
plot(x,y,'g-','LineWidth',2);
%Label x and y axis
xlabel('X');
ylabel('Y');
%Title Graph, include bold faced title and grid lines
title('\bf{Coupler Curve of Point P}'); grid on;

