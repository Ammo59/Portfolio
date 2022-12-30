
% Aramis Kelkelyan
% MAE 376: EC 19.2.2
% Date: 04/20/2022
%-----------------------------------------
clear;clc;clf;

%Unity negative feedback system
K = 1;
n = K; d = [1,6,8,0];
sys = tf(n,d);
grid on;
margin(sys);
[Gm,Pm,Omega_cg,Omega_cp] = margin(sys);