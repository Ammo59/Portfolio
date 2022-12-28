% Aramis Kelkelyan
% MAE 375: Homework #7, Chapter 7
% Problem 7-7, in the book
% Date: 11/24/2021
%-----------------------------------------
clear;clc;
%This is an inverted fourbar crank-slider with 3 links given
%the desired output: find the accelerations of points A and Aslip.

%Given values
links = input('Enter lengths of [a, c, d]: ');
a = links(1); c = links(2); d = links(3);
angles = input('Enter initial angles of [theta2, gamma] in degrees: ');
theta2 = angles(1); gamma = angles(2);
omega2 = input('Enter angular velocity (omega) of link 2 in rads/s: ');
alpha2 = input('Enter angular acceleration (alpha) of link 2 in rad/s^2: ');

%Find the parameters using equations 4.25 and 4.26
P = a*sind(theta2)*sind(gamma)+((a*cosd(theta2)-d)*cosd(gamma));
Q = a*sind(theta2)*cosd(gamma)+(a*cosd(theta2)-d)*sind(gamma);
R = -c*sind(gamma); 
T = 2*P; S = R-Q; U = Q+R;

theta4_open = 2.*atan2d((-T+sqrt(T.*T-4*S.*U)),2*S);
theta3_open = theta4_open+gamma;
b1 = (a*sind(theta2)-c*sind(theta4_open))/(sind(theta4_open+gamma));

%Calculate angular velocity of link 4 using equation 6.30
omega4_open = (a*omega2*cosd(theta2-theta3_open))/(b1+c*cosd(gamma));
bdot = (-a*omega2*sind(theta2)+omega4_open*(b1*sind(theta3_open)+c*sind(theta4_open)))/cosd(theta3_open);
omega3 = omega4_open;

%Solve for accelerations using equations 7.26 and 7.27
P1 = a*alpha2*cosd(theta3_open-theta2); 
Q1 = a*omega2^2*sind(theta3_open-theta2);
R1 = c*omega4_open^2*sind(theta4_open-theta3_open);
S1 = 2*bdot*omega3; T1 = b1+c*cosd(theta3_open-theta4_open);
alpha4_open = (P1+Q1+R1-S1)/T1;
K1 = a*omega2^2*(b1*cosd(theta3_open-theta2)+c*cosd(theta4_open-theta2));
L1 = a*alpha2*(b1*sind(theta2-theta3_open)-c*sind(theta4_open-theta2));
M1 = -(omega4_open^2)*(b1^2+c^2+2*b1*c*cosd(theta4_open-theta3_open));
N1 = 2*bdot*c*omega4_open*sind(theta4_open-theta3_open);
bdbldot = -(K1+L1+M1+N1)/T1; %acceleration of slip

AA = a*alpha2*(-sind(theta2)+1j*cosd(theta2))-a*omega2^2*(cosd(theta2)+1j*sind(theta2));
AA1 = norm(AA); thetaAA = atan2d(imag(AA),real(AA));
AB = -c*alpha4_open*(sind(theta4_open)-1j*cosd(theta4_open))-c*omega4_open^2*(cosd(theta4_open)+1j*sind(theta4_open));
AB1 = norm(AB); thetaAB = atan2d(imag(AB),real(AB));

%Print open and crossed configurations
fprintf('Open configuration Point accelerations: AA = %6.3f at angle %6.3f°\n', AA1, thetaAA);
fprintf('Open configuration slip acceleration (bdbldot): Aslip = %6.3f at angle %6.3f°\n', AB1, thetaAB);
% fprintf('Crossed configuration angular accelerations: Alpha3 = %4.3f, Alpha4 = %4.3f\n', alpha3_crossed, alpha4_crossed);
% fprintf('Crossed configuration vectors: AP = %6.3f at angle %6.3f°\n', Ap22, Ap2_ang);
