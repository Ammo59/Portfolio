% Aramis Kelkelyan
% MAE 375: Homework #4, Chapter 4 
% Problem 25
% Date: 10/13/2021
%-----------------------------------------
clear;clc;clf;

%Given values
links = input('Enter lengths of [a, b, c, d, p]: ');
a = links(1); b = links(2); c = links(3); d = links(4); p = links(5);
angles = input('Enter initial angles of [theta 2, alpha, delta] in degrees: ');
theta2_in = angles(1); alpha = angles(2); delta = angles(3);

%Find toggle positions of theta 2
theta2_tog1 = acosd((d^2+(a+b)^2-c^2)/(2*(a+b)*d));
theta2_tog2 = acosd((d^2+a^2-(b+c)^2)/(2*a*d));

%Validate if toggle positions are of real value
if isreal(theta2_tog1) && isreal(theta2_tog2)
    theta2 = theta2_tog1:1:theta2_tog2;
elseif isreal(theta2_tog1)
    theta2_tog = theta2_tog1;
    theta2 = -theta2_tog:1:theta2_tog;
elseif isreal(theta2_tog2)
    theta2_tog = theta2_tog2;
    theta2 = -theta2_tog:1:theta2_tog;
else
    disp('Both toggle angles are imaginary, please try again');
    mustBeReal(theta2_tog1); mustBeReal(theta2_tog2);
end

%Define link coefficients and constants
K1 = d/a; K2 = d/c; K3 = ((a^2-b^2+c^2+d^2)/(2*a*c));
K4 = d/b; K5 = ((c^2-d^2-a^2-b^2)/(2*a*b));
A = cosd(theta2)-K1-K2*cosd(theta2)+K3;
B = -2*sind(theta2); C = K1 - (K2+1)*cosd(theta2)+K3;
D = cosd(theta2)-K1+K4*cosd(theta2)+K5;
E = -2*sind(theta2); F = K1 + (K4-1)*cosd(theta2)+K5;

%Find theta 3 and theta 4
theta3_1 = 2.*atand(0.5*(-E-sqrt(E.*E-4*D.*F))./D);
theta3_2 = 2.*atand(0.5*(-E+sqrt(E.*E-4*D.*F))./D);
theta4_1 = 2.*atand(0.5*(-B-sqrt(B.*B-4*A.*C))./A);
theta4_2 = 2.*atand(0.5*(-B+sqrt(B.*B-4*A.*C))./A);

%Check angle values and replace them within range
theta3_1(theta3_1 > 360) = theta3_1(theta3_1 > 360) - 360;
theta3_1(theta3_1 < 0) = theta3_1(theta3_1 < 0) + 360;

theta3_2(theta3_2 > 360) = theta3_2(theta3_2 > 360) - 360;
theta3_2(theta3_2 < 0) = theta3_2(theta3_2 < 0) + 360;

theta4_1(theta4_1 > 360) = theta4_1(theta4_1 > 360) - 360;
theta4_1(theta4_1 < 0) = theta4_1(theta4_1 < 0) + 360;

theta4_2(theta4_2 > 360) = theta4_2(theta4_2 > 360) - 360;
theta4_2(theta4_2 < 0) = theta4_2(theta4_2 < 0) + 360;

%Find coordinates of coupler point, P
Rpx = a*cosd(theta2)+p*cosd(theta3_1+delta);
Rpy = a*sind(theta2)+p*sind(theta3_1+delta);
LCS = [Rpx; Rpy];
GCS = [Rpx*cosd(alpha)-Rpy*sind(alpha); Rpx*sind(alpha)+ Rpy*cosd(alpha)];
x = GCS(1,:); y = GCS(2,:);

%Graph the ROM of the theta 3 and theta 4
figure(1);
%Plot y vs. x with black solid/dashed line and line width 2
plot(theta2,theta3_1,'k--','LineWidth',2); hold on;
plot(theta2,theta3_2,'k-','LineWidth',2); hold on;
%Label x and y axis
plot(theta2,theta4_1,'r--','LineWidth',2); hold on;
plot(theta2,theta4_2,'r-','LineWidth',2); hold on;
xlabel('Crank angle (in degrees)');
ylabel('Theta 3 and Theta 4 (in degrees)');
legend('Open theta3','Crossed theta3','Open theta4','Crossed theta4', 'Location', 'northwest');
%Title Graph, include bold faced title and grid lines
title('\bf{Displacement of Theta 3 and 4}'); grid on;

%Graph the coordinates of the coupler point
figure(2); legend('off'); hold('off');
%Plot y vs. x with blue solid line and line width 2
plot(x,y,'b-','LineWidth',2);
%Label x and y axis
xlabel('X');
ylabel('Y');
%Title Graph, include bold faced title and grid lines
title('\bf{Coupler Curve of Point P}'); grid on;

