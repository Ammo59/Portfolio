% Aramis Kelkelyan
% MAE 375: Homework #6, Chapter 6 
% Problem 49
% Date: 11/10/2021
%-----------------------------------------
clear;clc;
%This is a coupler curve configuration
%the output: magnitude and direction of coupler point P
%path will be plotted at 2° increments of crank angle
%Use equations on pg 332 (lookup pg.359) method in Section 6.9

%Given values
links = input('Enter lengths of [a, b, c, d, p]: ');
a = links(1); b = links(2); c = links(3); d = links(4); p = links(5);
angles = input('Enter initial angles of [alpha, delta] in degrees: ');
alpha = angles(1); delta = angles(2);
omega2 = input('Enter angular velocity (omega) of link 2 in rpm: ');

%Find toggle positions of theta 2
theta2_in = acosd((a^2+d^2-(b+c)^2)/(2*a*d));
% theta2_tog1 = acosd((a^2+d^2-b^2-c^2)/(2*a*d) + (b*c/(a*d)));
% theta2_tog2 = acosd((a^2+d^2-b^2-c^2)/(2*a*d) - (b*c/(a*d)));

theta2 = -theta2_in:2:theta2_in;
% %Validate if toggle positions are of real value
% if isreal(theta2_tog1) && isreal(theta2_tog2)
%     theta2 = theta2_tog1:1:theta2_tog2;
% elseif isreal(theta2_tog1)
%     theta2_tog = theta2_tog1;
%     theta2 = -theta2_tog:1:theta2_tog;
% elseif isreal(theta2_tog2)
%     theta2_tog = theta2_tog2;
%     theta2 = -theta2_tog:1:theta2_tog;
% else
%     disp('Both toggle angles are imaginary, please try again');
%     mustBeReal(theta2_tog1); mustBeReal(theta2_tog2);
% end

%Define link coefficients and constants
K1 = d/a; K2 = d/c; K3 = ((a^2-b^2+c^2+d^2)/(2*a*c));
K4 = d/b; K5 = ((c^2-d^2-a^2-b^2)/(2*a*b));
A = cosd(theta2)-K1-K2*cosd(theta2)+K3;
B = -2*sind(theta2); C = K1 - (K2+1)*cosd(theta2)+K3;
D = cosd(theta2)-K1+K4*cosd(theta2)+K5;
E = -2*sind(theta2); F = K1 + (K4-1)*cosd(theta2)+K5;

%Find theta 3 and theta 4 (since it is non-grashof, only open)
theta3_open = 2.*atand(0.5*(-E-sqrt(E.*E-4*D.*F))./D);
% theta3_crossed = 2.*atand(0.5*(-E+sqrt(E.*E-4*D.*F))./D);
theta4_open = 2.*atand(0.5*(-B-sqrt(B.*B-4*A.*C))./A);
% theta4_crossed = 2.*atand(0.5*(-B+sqrt(B.*B-4*A.*C))./A);

% %Check angle values and replace them within range
% theta3_open(theta3_open > 360) = theta3_open(theta3_open > 360) - 360;
% theta3_open(theta3_open < 0) = theta3_open(theta3_open < 0) + 360;
% 
% theta3_crossed(theta3_crossed > 360) = theta3_crossed(theta3_crossed > 360) - 360;
% theta3_crossed(theta3_crossed < 0) = theta3_crossed(theta3_crossed < 0) + 360;
% 
% theta4_open(theta4_open > 360) = theta4_open(theta4_open > 360) - 360;
% theta4_open(theta4_open < 0) = theta4_open(theta4_open < 0) + 360;
% 
% theta4_crossed(theta4_crossed > 360) = theta4_crossed(theta4_crossed > 360) - 360;
% theta4_crossed(theta4_crossed < 0) = theta4_crossed(theta4_crossed < 0) + 360;

%Find omega 3 and 4
omega3_open = a/b*omega2 *(sind(theta4_open-theta2)/sind(theta3_open-theta4_open)); 
omega4_open = a/c*omega2 *(sind(theta2-theta3_open)/sind(theta4_open-theta3_open)); 
% omega3_crossed = a/b*omega2 *(sind(theta4_crossed-theta2)/sind(theta3_crossed-theta4_crossed)); 
% omega4_crossed = a/c*omega2 *(sind(theta2-theta3_crossed)/sind(theta4_crossed-theta3_crossed)); 

%Find velocity of coupler point, P
VA = (a*omega2)*((-sind(theta2))+1j*cosd(theta2)); %Equation 6.19
VPA_open = p*omega3_open*(-sind(theta3_open+delta)+1j*cosd(theta3_open+delta));
VP_open = VA + VPA_open; 
VP_mag_open = zeros(1, length(VP_open)); VP_ang_open = zeros(1, length(VP_open));

for ii = 1:length(VP_open)
VP_mag_open(ii) = norm(VP_open(ii)); VP_ang_open(ii) = atand(VP_open(ii));
end

% VPA_crossed = p*omega3_crossed*(-sind(theta3_crossed+delta)+1j*cosd(theta3_crossed+delta));
% VP_crossed = VA + VPA_crossed; VP_mag_crossed = norm(VP_crossed); VP_ang_crossed = atand(VP_crossed);

%Graph the ROM of the theta 3 and theta 4
figure(1);
%Plot y vs. x with magenta solid/dashed line and line width 2
plot(theta2,VP_mag_open,'m--','LineWidth',2); hold on;
%Label x and y axis
xlabel('Crank angle (in degrees)');
ylabel('Velocity of P (in mm/s)');
%Title Graph, include bold faced title and grid lines
title('\bf{Magnitude of Point P}'); grid on;

%Graph the coordinates of the coupler point
figure(2);
%Plot y vs. x with green solid line and line width 2
plot(theta2,VP_ang_open,'g-','LineWidth',2); hold on;
%Label x and y axis
xlabel('Crank angle (in degrees)');
ylabel('Theta of P (in degrees)');
%Title Graph, include bold faced title and grid lines
title('\bf{Direction (angle) of Point P}'); grid on;
