%
% Aramis Kelkelyan
% MAE 376: Practice Classwork
% Date: 04/20/2022
%-----------------------------------------
clear;clc;clf;

%Time-Domain Performance Specs
sys = tf([5], [1 12 5]);
kp = 19; %found from Lecture 18, Slide 16
clp = feedback(kp*sys,1);
step(clp);