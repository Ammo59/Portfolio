%
% Aramis Kelkelyan
% MAE 376: Quiz 2
% Problem 
% Date: 02/09/2021
%-----------------------------------------
clear;clc;

syms A B
A = input('Enter D (magnitude) * sin(phi) (phase change): ');
B = input('Enter D (magnitude) * cos(phi) (phase change): ');
wave = expand(sin(A+B));
disp(wave);