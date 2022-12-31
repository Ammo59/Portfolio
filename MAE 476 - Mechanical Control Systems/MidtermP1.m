%
% Aramis Kelkelyan
% MAE 476: Midterm
% Problem 1
% Date: 11/8/2022
%-----------------------------------------
clear;clc;

%Type 0
K = 30;
a = 0.5;

num = [K K*a];
den = [1 6 11 6+K K*a];
sys = tf(num,den);
poles_are=pole(sys);
roots_char_eqn = roots(den);
disp(roots_char_eqn); 

step(sys);
%if there are any POSITIVE roots, then the system is unstable

% Interesting combo --> stable
% K = -3;
% a = -1.5;

% Type 2 --> Stable
% K = 44.15;
% a = 0.5;

% Oddball Stable
% K = 59;
% a = 0.03;

% Type 2 --> Not stable
% K = 30;
% a = 1; % can use 0.999999 in place to make stable

% Interesting combo --> stable, type 1
% K = 10;
% a = 0; % as long as a = 0 --> type 1

% Playing around
% K = -0.000011;
% a = -1000; % as long as a = 0 --> a --> inf