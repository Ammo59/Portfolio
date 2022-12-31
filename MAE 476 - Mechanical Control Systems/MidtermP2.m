%
% Aramis Kelkelyan
% MAE 476: Midterm
% Problem 2
% Date: 11/8/2022
%-----------------------------------------
clear;clc;

% part f)
kp = 7;
sys = tf([kp],[1 5+kp]);
clp = feedback(sys,1);
figure(1);
step(clp);

% part g)
kI = 0; kp2 = 7;
sys = tf(12, [1 12]);
clp = feedback(sys,2);
figure(2);
step(clp);
