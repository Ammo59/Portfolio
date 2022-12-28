% Aramis Kelkelyan
% MAE 375: Homework #7, Chapter 7 
% Problem 92
% Date: 11/25/2021
%-----------------------------------------
clear;clc;
%This is a quick return mechanism
%input: theta 2&3, omega 2, alpha 2, 3 link lengths
%output: accelerations of point A and B
%Use equations on pg 381 (lookup pg.408) method in Section 7.5

%Given values
links = input('Enter lengths of [a, c, d]: ');
a = links(1); c = links(2); d = links(3);
angles = input('Enter initial angles of [theta2, theta3] in degrees: ');
theta2 = angles(1); theta3 = angles(2); 
omega2 = input('Enter angular velocity (omega) of link 2 in rad/s: ');
alpha2 = input('Enter angular acceleration (alpha) of link 2 in rad/s^2: ');

%Vector Loop --> R2 = R1 + R3
b = (a*sind(theta2))/sind(theta3);
omega3 = ((a*omega2)/b)*(cosd(theta2-theta3));
bdot = (a*omega2*cosd(theta2)-b*omega3*cosd(theta3))/sind(theta3);

%Find alpha 3 and acceleration of point A (on link 2)
alpha3 = (1/b)*(a*alpha2*cosd(theta2-theta3)+a*omega2^2*sind(theta3-theta2)-2*bdot*omega3);
AA2 = a*alpha2*(-sind(theta2)+1j*cosd(theta2))-a*omega2^2*(cosd(theta2)+1j*sind(theta2));
AA2_mag = norm(AA2); AA2_ang = atan2d(imag(AA2),real(AA2));

%Find the acceleration of points A on link 4
theta4 = theta3; alpha4 = alpha3; omega4 = omega3;
AA4 = b*alpha4*(-sind(theta4)+1j*cosd(theta4))-b*omega4^2*(cosd(theta4)+1j*sind(theta4));
%Line 32 references equation 7.13a
AA4_mag = norm(AA4); AA4_ang = atan2d(imag(AA4),real(AA4));

%Acceleration of Point B on link 4
Ab = a*alpha4*(-sind(theta4)+1j*cosd(theta4))-a*omega4^2*(cosd(theta4)+1j*sind(theta4));
Ab_mag = norm(Ab); Ab_ang = atan2d(imag(Ab),real(Ab));

%Print point acclerations
fprintf('Set configuration vectors: A = %6.3f at angle %6.3f° and B = %6.3f at angle %6.3f°\n', AA4_mag, AA4_ang, Ab_mag, Ab_ang);

