%
% Aramis Kelkelyan, Group Member 1, Anthony Perez, Group Member 2,
% Christian Smith Group Member 3
% MAE 205 Section 11/12
%
% Laboratory 7, Problem 1
%-----------------------------------------------------------------------
%% Part a
clear; clc;
x = rand(1,5);
y = 10.*x + 1;
fprintf('x(%d) = %8.4f; y(%d) = %8.4f\n',[1:5;x;1:5;y]);

%% Part b
clear; clc;
b = sin(pi.*([0:8])./4);
fprintf('y(%d) = %16.8f\n',[1:9;b]);

%% Part c
clear;clc;
s = [1:10];
y = (s.^2 + s)./2;
fprintf('Sum of the numbers 1 to %2d : %5d\n',[s;y]);
