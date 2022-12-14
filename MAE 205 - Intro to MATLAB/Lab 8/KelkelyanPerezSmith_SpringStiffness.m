% Aramis Kelkelyan, Group Member 1, Anthony Perez, Group Member 2,
% Christian Smith Group Member 3
% MAE 205 Section 11/12
%
% Laboratory 8, Problem 3
%-----------------------------------------------------------------------
clear;clc;
%Prompt User to input size of a matrix
k = input('Enter stiffness coeffiecients in a vector: ');

%Create loop 
while ~isempty(k)
    type = input('Enter connection type 1 (parallel) or 2 (series): ');
    keq = KelkelyanPerezSmith_kEquivalent(k,type); %Call on user-made function
    if type == 1  
        fprintf('The equivalent PARALLEL spring stiffness is: %5.2f N/mm\n',keq);
    else
        fprintf('The equivalent SERIES spring stiffness is: %5.2f N/mm\n',keq);
    end
    k = input('Enter new vector of stiffness coeffiecients: '); %Allow user to re-input vector values
end

%a) 1475 N/mm
%b) 121.14 N/mm
%c) 275.61 N/mm