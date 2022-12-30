%
% Aramis Kelkelyan
% MAE 376: EC 14.1
% Date: 04/11/2022
%-----------------------------------------
clear;clc;clf;

%Use initial() to plot the free response of the state space model

A = [0 1; -1/2 -1];
C = [1 0]; 
sys = ss(A, [], C, []);
x0 = [1, 1/2];
initial(sys,x0)