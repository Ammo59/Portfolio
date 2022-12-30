% Aramis Kelkelyan
% MAE 375: Homework #7, Chapter 7
% Problem 7-4, in the book
% Date: 11/24/2021
%-----------------------------------------
clear;clc;
%This is a general 4-bar linkage with all 4 links and coupler length given
%the desired output: find the accelerations of points A and B. Then
%calculate α3 and α4 and the acceleration of point P

%Given values
links = input('Enter lengths of [a, b, c, d, Rpa]: ');
a = links(1); b = links(2); c = links(3); d = links(4); Rpa = links(5);
angles = input('Enter initial angles of [theta2, delta3] in degrees: ');
theta2 = angles(1); delta3 = angles(2);
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
theta4_open = 2.*atan2d((-B-sqrt(B.*B-4*A.*C)),2*A)-360;
theta4_crossed = 2.*atan2d((-B+sqrt(B.*B-4*A.*C)),2*A);
theta3_open = 2.*atan2d((-E-sqrt(E.*E-4*D.*F)),2*D)-360;
theta3_crossed = 2.*atan2d((-E+sqrt(E.*E-4*D.*F)),2*D);

%Find omega 3 and 4
omega3_open = ((a*omega2)/b)*(sind(theta4_open-theta2)/sind(theta3_open-theta4_open));
omega3_crossed = ((a*omega2)/b)*(sind(theta4_crossed-theta2)/sind(theta3_crossed-theta4_crossed));
omega4_open = ((a*omega2)/c)*(sind(theta2-theta3_open)/sind(theta4_open-theta3_open));
omega4_crossed = ((a*omega2)/c)*(sind(theta2-theta3_crossed)/sind(theta4_crossed-theta3_crossed));

%Find acceleration components
Aax = -a*alpha2*sind(theta2)-a*omega2^2*cosd(theta2);
Aay = -a*alpha2*cosd(theta2)-a*omega2^2*sind(theta2);
Aa = sqrt(Aax^2+Aay^2); thetaAA = atan2d(Aay,Aax);

%Find links 3 and 4 angular accelerations for open and crossed configs, use equation 7.12
A1 = c*sind(theta4_open); B1 = b*sind(theta3_open);
C1 = a*alpha2*sind(theta2)+a*omega2^2*cosd(theta2)+b*omega3_open^2*cosd(theta3_open)-c*omega4_open^2*cosd(theta4_open);
D1 = c*cosd(theta4_open); E1 = b*cosd(theta3_open);
F1 = a*alpha2*cosd(theta2)-a*omega2^2*sind(theta2)-b*omega3_open^2*sind(theta3_open)+c*omega4_open^2*sind(theta4_open);

alpha3_open =((C1*D1)-(A1*F1))/((A1*E1)-(B1*D1));
alpha4_open =(C1*E1-B1*F1)/(A1*E1-B1*D1);

%cross configurations
A2 = c*sind(theta4_crossed); B2 = b*sind(theta3_crossed);
C2 = a*alpha2*sind(theta2)+a*omega2^2*cosd(theta2)+b*omega3_crossed^2*cosd(theta3_crossed)-c*omega4_crossed^2*cosd(theta4_crossed);
D2 = c*cosd(theta4_crossed); E2 = b*cosd(theta3_crossed);
F2 = a*alpha2*cosd(theta2)-a*omega2^2*sind(theta2)-b*omega3_crossed^2*sind(theta3_crossed)+c*omega4_crossed^2*sind(theta4_crossed);

alpha3_crossed =(C2*D2-A2*F2)/(A2*E2-B2*D2);
alpha4_crossed =(C2*E2-B2*F2)/(A2*E2-B2*D2);

%Find point B's open and crossed acceleration, use equation 7.13c
Abx1 = c*(-alpha4_open*sind(theta4_open)-omega4_open^2*cosd(theta4_open));
Aby1 = c*(alpha4_open*cosd(theta4_open)-omega4_open^2*sind(theta4_open));
Ab1 = sqrt(Abx1^2+Aby1^2); thetaAb1 = atan2d(Aby1,Abx1);
Abx2 = c*(-alpha4_crossed*sind(theta4_crossed)-omega4_crossed^2*cosd(theta4_crossed));
Aby2 = c*(alpha4_crossed*cosd(theta4_crossed)-omega4_crossed^2*sind(theta4_crossed));
Ab2 = sqrt(Abx2^2+Aby2^2); thetaAb2 = atan2d(Aby2,Abx2);

%Find point P's open and crossed acceleration, use equation 7.32
AA = a*alpha2*(-sind(theta2)+1j*cosd(theta2))-a*(omega2^2)*(cosd(theta2)+1j*sind(theta2)); %equation 7.32
Apa1 = Rpa*alpha3_open*((-sind(theta3_open+delta3))+1j*cosd(theta3_open+delta3))-Rpa*(omega3_open^2)*(cosd(theta3_open+delta3)+1j*sind(theta3_open+delta3));
Ap1 = AA + Apa1; Ap11 = norm(Ap1); Ap1_ang = atan2d(imag(Ap1),real(Ap1));

Apa2 = Rpa*alpha3_crossed*((-sind(theta3_crossed+delta3))+1i*cosd(theta3_crossed+delta3))-Rpa*omega3_crossed^2*(cosd(theta3_crossed+delta3)+1j*sind(theta3_crossed+delta3));
Ap2 = AA + Apa2; Ap22 = norm(Ap2); Ap2_ang = atan2d(imag(Ap2),real(Ap2));

%Print open and crossed configurations
fprintf('Open configuration angular accelerations: Alpha3 = %4.3f, Alpha4 = %4.3f\n', alpha3_open, alpha4_open);
fprintf('Open configuration vectors: AP = %6.3f at angle %6.3f°\n', Ap11, Ap1_ang);
fprintf('Crossed configuration angular accelerations: Alpha3 = %4.3f, Alpha4 = %4.3f\n', alpha3_crossed, alpha4_crossed);
fprintf('Crossed configuration vectors: AP = %6.3f at angle %6.3f°\n', Ap22, Ap2_ang);

