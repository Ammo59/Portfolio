%
% Aramis Kelkelyan, Group Member 1, Octavio Gutierrez, Group Member 2
% MAE 205 Section 11/12
%
% Laboratory 6, Problem 3
%------------------------------------------------------------------------
%%
clear;clc;
% Find the smallest odd int (1) that is divisible by 9
% whose square root is greater than the user inputed integer

u = input('Input any positive integer: ');
n = 9;

while ~((sqrt(n))>u)
    n = n+18;
end
%Output the integer and calculated output number
fprintf('The smallest odd integer divisible by 9 and square root greater than %i is: %i', u, n);
fprintf('\n');