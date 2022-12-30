%
% Aramis Kelkelyan
% MAE 376: Homework 4
% Problem C
% Date: 03/12/2022
%-----------------------------------------
% simulink;
clear;clc;
R1 = 100; %ohms
L = 20; %hertz
R2 = 400; %ohms
C = 1/120; %farads
DC = 100; %volts; change volts as neccessary

%% For state space
clc;
A = [-R1/L, -1/L; 1/C, -1/(R2*C)];
B = [1/L;0];
C = [0, 1];
D = 0;
