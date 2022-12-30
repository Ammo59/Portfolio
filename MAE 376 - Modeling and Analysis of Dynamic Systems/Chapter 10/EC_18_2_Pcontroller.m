%
% Aramis Kelkelyan
% MAE 376: EC 18.2
% Date: 04/20/2022
%-----------------------------------------
clear;clc;clf;

%Design a P-controller
sys = tf((1),[1,2]);
kp = 14.5512; Ti = 0.0643;
sysc = tf([kp*Ti kp], [Ti,0]);
clp = feedback(sysc*sys,1);
step(clp);
