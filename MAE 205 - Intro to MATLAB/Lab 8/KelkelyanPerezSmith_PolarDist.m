%
% Aramis Kelkelyan, Group Member 1, Anthony Perez, Group Member 2,
% Christian Smith Group Member 3
% MAE 205 Section 11/12
%
% Laboratory 8, Problem 1
%-----------------------------------------------------------------------
clear;clc;

%create anonymouos function PolarDist
PolarDist = @(rA,rB,thetaA,thetaB)(sqrt(rA.^2 + rB.^2 - 2.*rA.*rB.*cos(thetaB - thetaA)));

%a)
%A(3, pi/6) ------(rA, thetaA)
%B(-5, 5*pi/4) ------- (rB, thetaB)

fprintf('The distance between points is: %3.2f\n',PolarDist(3,-5,pi/6,5*pi/4));

%b
%C(-2.5, 18) ------(rC, thetaC) ---theta is in degrees
%D(6.5, 321) ------- (rD, thetaD) ---theta is in degrees

fprintf('The distance between points is: %3.2f\n',PolarDist(-2.5,6.5,(18*pi/180),(321*pi/180)));

%c)
%F(-10, 67) ------(rF, thetaF) ---theta is in degrees
%G(33, 4*pi/3) ------- (rG, thetaG)

fprintf('The distance between points is: %3.2f\n',PolarDist(-10,33,(67*pi/180),4*pi/3));