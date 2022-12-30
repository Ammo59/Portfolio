%
% Aramis Kelkelyan
% MAE 376: EC 15.2
% Date: 04/11/2022
%-----------------------------------------
clear;clc;clf;

%Step Function

n = 15;
d = [3, 0.5, 1];
sys = tf(n,d);
step(sys);

%At t = 75s, the amplitude response has a steady - state value of 15
