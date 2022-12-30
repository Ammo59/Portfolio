% Aramis Kelkelyan
% MAE 375: Homework #7, Chapter 7
% Problem 7-34, in the book
% Date: 11/24/2021
%-----------------------------------------
clear;clc;
%This is an drum brake mechanism with 6 links given
%the desired output: find angular acceleration of angle alpha 4 
%then find acccelerations of points A and B.

%Given values
links = input('Enter lengths of [a, b, c, d]: ');
a = links(1); b = links(2); c = links(3); d = links(4);
angles = input('Enter initial angles of [theta2, beta] in degrees: '); %beta is coordinate rotation angle (GCS --> LCS)
theta2 = angles(1); beta = angles(2);
omega2 = input('Enter angular velocity (omega) of link 2 in rads/s: ');
alpha2 = input('Enter angular acceleration (alpha) of link 2 in rad/s^2: ');

%Define link coefficients and constants
K1 = d/a; K2 = d/c; K3 = ((a^2-b^2+c^2+d^2)/(2*a*c));
K4 = d/b; K5 = ((c^2-d^2-a^2-b^2)/(2*a*b));
A = cosd(theta2)-K1-K2*cosd(theta2)+K3;
B = -2*sind(theta2); C = K1 - (K2+1)*cosd(theta2)+K3;
D = cosd(theta2)-K1+K4*cosd(theta2)+K5;
E = -2*sind(theta2); F = K1 + (K4-1)*cosd(theta2)+K5;

%Find theta 3 and theta 4
theta4 = 2.*atan2d((-B+sqrt(B.*B-4*A.*C)),2*A);
theta3 = 2.*atan2d((-E+sqrt(E.*E-4*D.*F)),2*D);

%Find omega 3 and 4
omega3 = ((a*omega2)/b)*(sind(theta4-theta2)/sind(theta3-theta4));
omega4 = ((a*omega2)/c)*(sind(theta2-theta3)/sind(theta4-theta3));

%Find acceleration components for point A
Aax = -a*alpha2*sind(theta2)-a*omega2^2*cosd(theta2);
Aay = a*alpha2*cosd(theta2)-a*omega2^2*sind(theta2);
Aa = sqrt(Aax^2+Aay^2); thetaAA = atan2d(Aay,Aax)-beta;

%Find links 3 and 4 angular accelerations for crossed configs, use equation 7.12
A1 = c*sind(theta4); B1 = b*sind(theta3);
C1 = a*alpha2*sind(theta2)+a*omega2^2*cosd(theta2)+b*omega3^2*cosd(theta3)-c*omega4^2*cosd(theta4);
D1 = c*cosd(theta4); E1 = b*cosd(theta3);
F1 = a*alpha2*cosd(theta2)-a*omega2^2*sind(theta2)-b*omega3^2*sind(theta3)+c*omega4^2*sind(theta4);

alpha3 =((C1*D1)-(A1*F1))/((A1*E1)-(B1*D1));
alpha4 =(C1*E1-B1*F1)/(A1*E1-B1*D1);

%Find acceleration components for point B
Abx1 = c*(alpha4*-sind(theta4)-omega4^2*cosd(theta4));
Aby1 = c*(alpha4*cosd(theta4)-omega4^2*sind(theta4));
Ab1 = sqrt(Abx1^2+Aby1^2); thetaAb1 = atan2d(Aby1,Abx1)-beta;

%Print open and crossed configurations
fprintf('Set configuration angular accelerations: Alpha4 = %6.3f\n', alpha4);
fprintf('Set configuration vectors: AA = %6.3f at angle %6.3f° and AB = %6.3f at angle %6.3f°\n', Aa, thetaAA, Ab1, thetaAb1);
% fprintf('Crossed configuration angular accelerations: Alpha3 = %4.3f, Alpha4 = %4.3f\n', alpha3_crossed, alpha4_crossed);
% fprintf('Crossed configuration vectors: AP = %6.3f at angle %6.3f°\n', Ap22, Ap2_ang);
%These secondary fprintf's are incorrect
