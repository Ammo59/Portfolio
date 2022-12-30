%
% Aramis Kelkelyan
% MAE 376: Classwork 1
% Date: 02/23/2022
%-----------------------------------------
clear;clc;

keq = 120000; %N/m 
m = 1000; %kg
omega = 3.5; %rad/s
z0 = 0.01; %m
b = 2000; %N-s/m

A = [0 0 1 0; 0 0 0 1; -keq/m keq/m -b/m b/m; 0 0 0 0]; B = [0; 0; 1; 0];
C = [1 0 0 0; 0 1 0 0]; D = [0; 0];

[n1,d1]=ss2tf(A,B,C,D,1);
[n2,d2]=ss2tf(A,B,C,D,1);
fprintf('n1 = \n');
disp(n1);
fprintf('d1 = \n');
disp(d1);
fprintf('n2 = \n');
disp(n2);
fprintf('d2 = \n');
disp(d2);
