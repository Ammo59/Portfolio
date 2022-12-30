%
% Aramis Kelkelyan
% MAE 376: Quiz 2
% Problem 
% Date: 02/09/2021
%-----------------------------------------
clear;clc;

syms t
g=t*heaviside(t)-t*heaviside(t-2);
G=disp(laplace(g));