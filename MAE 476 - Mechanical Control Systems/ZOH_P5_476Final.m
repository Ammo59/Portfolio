%
% Aramis Kelkelyan
% MAE 476: Final P4
% Date: 12/18/2022
%-----------------------------------------
clear;clc;

G = tf(1,[0.5 1 0]);
T = 1;
Gd = c2d(G,T, 'zoh');
alpha = exp(-2*T);

Dc = tf(1,[1 2]); 
sysDd = c2d(Dc,T,'zoh');
