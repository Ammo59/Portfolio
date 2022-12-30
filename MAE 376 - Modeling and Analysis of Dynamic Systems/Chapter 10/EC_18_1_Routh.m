%
% Aramis Kelkelyan
% MAE 376: EC 18.1
% Date: 04/18/2022
%-----------------------------------------
clear;clc;

K = input('Enter value for K: '); %guess from hand calcs --> K > 1.97
den = [1 2 K-4 8 4 K+3];
disp(roots(den));

% %From lecture
% num = [];
% den = [];
% sys = tf(num,den);
% poles_are = pole(sys);
% root_of_char_eqn = roots(den);
% disp(poles_are);
% disp(roots_of_char_eqn);