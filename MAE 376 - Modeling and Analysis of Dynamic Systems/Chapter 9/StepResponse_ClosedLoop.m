%
% Aramis Kelkelyan
% MAE 376: HW 5
% Problem 10
% Date: 04/22/2022
%-----------------------------------------
clear;clc;clf;

%Design a PD-controller
% sys = tf([1],[1 1 0]);
kp = 4; kd = 1;
sysc = tf([kd kp], [1 1+kd kp]);
clp = feedback(sysc,1);
step(clp);

%
% sys = tf((1),[1 1 0]);
% kp = 4; kd = 1;
% sysc = tf([kd kp], [1 1+kd kp]);
% clp = feedback(sysc*sys,1);
% step(clp);