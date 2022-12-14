%
% Aramis Kelkelyan, Group Member 1, Anthony Perez, Group Member 2,
% Christian Smith Group Member 3
% MAE 205 Section 11/12
%
% Laboratory 7, Problem 2
%-----------------------------------------------------------------------
clear;clc;
%Prompt User to input size of a matrix
A = input('Enter matrix of any size [row,col]: ');
%Create loop 
while ~isempty(A) 
    B = zeros(size(A,2),size(A,1)); %Pre-allocate
    for r = 1 : size(A,1)
        for c = 1: size(A,2)
            B(c,r) = A(r,c);
        end
    end
    disp(B)
    A = input('Enter new matrix of any size [row,col]: '); %Allow user to re-input matrix values
end