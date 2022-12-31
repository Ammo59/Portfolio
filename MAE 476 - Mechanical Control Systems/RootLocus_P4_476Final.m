%
% Aramis Kelkelyan
% MAE 476: Final P4
% Date: 12/18/2022
%-----------------------------------------
clear;clc;clf;

tau_1 = 2; tau_2 = 1;
tau_a = 3; tau_b = 5;
K = 100;
figure(1);

%First TF
subplot(1,3,1);
num1 = [K*tau_a K];
den1 = conv([1 0 0],[tau_1 1]);
sys1L = tf(num1,den1);
rlocus(sys1L);

%Second TF
subplot(1,3,2);
num2 = conv([K*tau_a K], [tau_b 1]);
den2 = [1 0 0 0];
sys2L = tf(num2,den2);
rlocus(sys2L);

%Second TF
subplot(1,3,3);
num3 = [K*tau_a K];
den3 = conv(conv([1 0 0], [tau_1 1]),[tau_2 1]);
sys3L = tf(num3,den3);
rlocus(sys3L);
