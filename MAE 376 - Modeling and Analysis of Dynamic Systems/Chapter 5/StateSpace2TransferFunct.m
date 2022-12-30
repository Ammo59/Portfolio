%
% Aramis Kelkelyan
% MAE 376: Quiz 6
% Problem X
% Date: 03/02/2022
%-----------------------------------------
clear;clc;

m1 = 290;
m2 = 59;
b1 = 1000;
k1 = 16182;
k2 = 19000;
A = [0 0 1 0; 0 0 0 1; -k1/m1 k1/m1 -b1/m1 b1/m1; k1/m2 -(k1+k2)/m2 b1/m2 -b1/m2];
B = [0 0; 0 0; 1/m1 0; -1/m2 k2/m2];
C = [1 0 0 0; 0 1 0 0];
D = zeros(2,2);
sys_ss = ss(A,B,C,D);
sys_tf = tf(sys_ss)