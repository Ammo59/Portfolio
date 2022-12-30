%
% Aramis Kelkelyan
% MAE 376: Homework 5
% Date: 04/21/2022
%-----------------------------------------
clear;clc;
% simulink;
R1 = 100; %ohms
L = 20; %hertz
R2 = 400; %ohms
Cap = 1/120; %farads
DC = 100; %volts; change volts as neccessary

% For state space
clc;
A = [-R1/L, -1/L; 1/Cap, -1/(R2*Cap)];
B = [1/L;0];
C = [0, 1];
D = 0;
