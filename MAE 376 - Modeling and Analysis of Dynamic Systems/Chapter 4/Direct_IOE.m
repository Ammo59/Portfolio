%
% Aramis Kelkelyan
% MAE 376: Extra Credit 5.1
% Date: 02/21/2022
%-----------------------------------------
clear;clc;

Num=[0,6/5,4/5,0,2/5];
Den=[1,3/5,7/5,0,1/5];
[A,B,C,D]=tf2ss(Num,Den);
fprintf('A = \n');
a = fliplr(A);
disp(flip(a));
fprintf('\nB = \n');
disp(flip(B));
fprintf('\nC = \n');
disp(flip(C));
fprintf('\nD = \n');
disp(flip(D));
