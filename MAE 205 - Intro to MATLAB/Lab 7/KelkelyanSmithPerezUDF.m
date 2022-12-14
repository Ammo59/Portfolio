function [B] = KelkelyanSmithPerezUDF(A)
%KelkelyanSmithPerezUDF transposes matrix A to matrix B
%inputs A (matrix in square brackets)
%outputs B (the transpose of Matrix A)

% Aramis Kelkelyan, Group Member 1, Anthony Perez, Group Member 2,
% Christian Smith Group Member 3
% MAE 205 Section 11/12
%
% Laboratory 7, Problem 3
%-----------------------------------------------------------------------
%Prompt User to input size of a matrix

%Create loop 
B = zeros(size(A,2),size(A,1)); %Pre-allocate
for r = 1 : size(A,1)
    for c = 1: size(A,2)
        B(c,r) = A(r,c);
    end
end
