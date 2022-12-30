%
% Aramis Kelkelyan
% MAE 376: EC 15.3
% Date: 04/11/2022
%-----------------------------------------
clear;clc;clf;

%Plot Dynamic System with Lsim command

A = [0 0 1 0; 0 0 0 1; -3/2 1 -1/4 1/4; 2 -2 1/2 -1/2];
B = [0 0; 0 0; 1/2 0; 0 1]; B1 = B(:,1); B2 = B(:,2);
C = [1 0 0 0]; % the second row is avoided [0 1 0 0]; to avoid multiple graphs 
D = [];
sys1 = ss(A, B1, C, D);
sys2 = ss(A, B2, C, D);
sys = ss(A, B, C, D);
x0 = [0 0 1 0];
t = 0:0.01:10;
u = [exp(-t/3); sin(t/2)];

figure(1);
lsim(sys1, u(1,:), t, x0)

figure(2);
lsim(sys2, u(2,:), t, x0)

figure(3);
lsim(sys, u, t, x0)

%See pdf for comments

