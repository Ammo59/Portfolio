%
% Aramis Kelkelyan
% MAE 376: Homework 5
% Problem 9
% Date: 04/21/2022
%-----------------------------------------
clear;clc;

m = 500; %kg
b = 250; %N*s/m
k = 200000; %N/m
g = 9.81; %m/s^2

% Simulink
A = [0 1; -4*k/m -4*b/m];
B = [0; 1/m];
C = [1 0];
D = [];

if isempty(D)
    D = 0;
end

sys = ss(A,B,C,D);
x0 = [0.05; 0];
initial(sys,x0);

% Simscape
t = 0.1;