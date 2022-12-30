%
% Aramis Kelkelyan
% MAE 376: Classwork 2
% Date: 02/23/2022
%-----------------------------------------
clear;clc;

Num1 = 1; Den1 = [1,4];
Num2 = [1, 1]; Den2 = [1,4,4];
% Num1 = 5; Den1 = [2,1];
% Num2 = [3,4,1]; Den2 = [5,2,1];
sysG1 = tf(Num1,Den1);
sysG2 = tf(Num2,Den2);
sysEq1 = parallel(sysG1, sysG2);
fprintf('sysEq1 = \n');
disp(sysEq1);
sysEq2 = series(sysG1, sysG2);
fprintf('sysEq2 = \n');
disp(sysEq2);