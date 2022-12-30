% Aramis Kelkelyan
% MAE 375: Quiz 2
% Problem 7-33, in the book
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

