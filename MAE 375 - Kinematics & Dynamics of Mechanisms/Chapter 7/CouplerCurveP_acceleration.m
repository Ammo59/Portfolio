% Aramis Kelkelyan
% MAE 375: Homework #7, Chapter 7 
% Problem 42
% Date: 11/25/2021
%-----------------------------------------
clear;clc;
%This is a coupler curve configuration
%the output: magnitude and direction of coupler point P acceleration
%path will be plotted at 2° increments of crank angle
%Use equations on pg 381 (lookup pg.408) method in Section 7.5

%Given values
links = input('Enter lengths of [a, b, c, d, Rpa]: ');
a = links(1); b = links(2); c = links(3); d = links(4); Rpa = links(5);
angles = input('Enter initial angles of [delta] in degrees: ');
delta3 = angles(1); %beta = angles(2); 
omega2 = input('Enter angular velocity (omega) of link 2 in rpm: ');
alpha2 = input('Enter angular acceleration (alpha) of link 2 in rad/s^2: ');

%Calculate toggle position of theta 2
theta2_tog1 = acosd((a^2+d^2-(b+c)^2)/(2*a*d));
theta2 = -theta2_tog1:2:theta2_tog1; 

%Define link coefficients and constants
K1 = d/a; K2 = d/c; K3 = (a^2-b^2+c^2+d^2)/(2*a*c);
K4 =  d/b; K5 = (c^2-d^2-a^2-b^2)/(2*a*b);
A = cosd(theta2)-K1-K2*cosd(theta2)+K3; B = -2*sind(theta2);
C = K1-(K2+1)*cosd(theta2)+K3;
D = cosd(theta2)-K1+K4*cosd(theta2)+K5;
E = -2*sind(theta2); F = K1+((K4-1)*cosd(theta2))+K5;

%Find theta 3 and theta 4 (eq. 4.12)
theta4_open = 2.*atan2d(real(-B-sqrt(B.*B-4*A.*C)),2*A);
theta3_open = 2.*atan2d(real(-E-sqrt(E.*E-4*D.*F)),2*D);
% theta4_crossed = 2.*atan2d((-B+sqrt(B.*B-4*A.*C)),2*A);
% theta3_crossed = 2.*atan2d((-E+sqrt(E.*E-4*D.*F)),2*D);

%Find omega 3 and 4 (eq 6.18)
omega3_open = ((a*omega2)/b)*(sind(theta4_open-theta2)/sind(theta3_open-theta4_open));
omega4_open = ((a*omega2)/c)*(sind(theta2-theta3_open)/sind(theta4_open-theta3_open));
% omega3_crossed = a/b*omega2 *(sind(theta4_crossed-theta2)/sind(theta3_crossed-theta4_crossed)); 
% omega4_crossed = a/c*omega2 *(sind(theta2-theta3_crossed)/sind(theta4_crossed-theta3_crossed)); 

%Calculate acceleration at point A using equation 7.13a
AA = (a*alpha2)*(-sind(theta2)+1j*cosd(theta2))-(a*omega2^2)*(cosd(theta2)+1j*sind(theta2));

%Use equation 7.12 to find angular acceleration of link 3
A1 = c*sind(theta4_open); B1 = b*sind(theta3_open);
C1 = a*alpha2*sind(theta2)+a*omega2^2*cosd(theta2)+b*omega3_open^2*cosd(theta3_open)-c*omega4_open^2*cosd(theta4_open);
D1 = c*cosd(theta4_open); E1 = b*cosd(theta3_open);
F1 = a*alpha2*cosd(theta2)-a*omega2^2*sind(theta2)-b*omega3_open^2*sind(theta3_open)+c*omega4_open^2*sind(theta4_open);

alpha3_open =((C1.*D1)-(A1.*F1))./((A1.*E1)-(B1.*D1));

Apa_open = Rpa*alpha3_open.*(-sind(theta3_open+delta3)+1j*cosd(theta3_open+delta3))-Rpa*omega3_open^2.*(cosd(theta3_open+delta3)+1j*sind(theta3_open+delta3));
Ap_open = AA+Apa_open; Ap_open_mag = norm(Ap_open); Ap_ang_open = atan2d(imag(Ap_open),real(Ap_open));

%Graph the ROM of the theta 3 and theta 4
figure(1); subplot(2,1,1);
%Plot y vs. x with magenta solid/dashed line and line width 2
plot(theta2,Ap_open,'m--','LineWidth',2);
%Label x and y axis
xlabel('Crank angle (in degrees)');
ylabel('Acceleration of P (in in/s^2)');
%Title Graph, include bold faced title and grid lines
title('\bf{Acceleration of Point P vs. Theta 2}'); grid on;

%Graph the coordinates of the coupler point
subplot(2,1,2);
%Plot y vs. x with green solid line and line width 2
plot(theta2,Ap_ang_open,'g-','LineWidth',2);
%Label x and y axis
xlabel('Crank angle (in degrees)');
ylabel('Theta of P (in degrees)');
%Title Graph, include bold faced title and grid lines
title('\bf{Direction of Point P Acceleration}'); grid on;
