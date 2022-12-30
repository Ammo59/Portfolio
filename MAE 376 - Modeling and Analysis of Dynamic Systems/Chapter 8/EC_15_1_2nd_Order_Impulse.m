%
% Aramis Kelkelyan
% MAE 376: EC 15.1
% Date: 04/11/2022
%-----------------------------------------
clear;clc;clf;

%Impulse Response

n = 5;
d1 = [3, 4, 3];
d2 = [3, 4, 5]; 
sys1 = tf(n,d1);
sys2 = tf(n,d2);
impulse(sys1,sys2)