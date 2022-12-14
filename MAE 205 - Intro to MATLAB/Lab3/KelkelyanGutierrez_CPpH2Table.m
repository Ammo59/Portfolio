%
% Aramis Kelkelyan, Group Member 1, Octavio Gutierrez, Group Member 2
% MAE 205 Section 11/12
%
% Laboratory 3, Problem 3
%------------------------------------------------------------------------
clear; clc;

%Given a,b,c, and d are the coefficients of the cubic function 

a=29.088; %A units are given in in Joules per Kelvin*mol J/(K*mol))
b=(-1.92)*10^(-3); %B units are given in J/((K^2)*mol))
c=((4.00)*(10)^(-6)); %C units are given in J/((K^3)*mol))
d=((-8.70)*(10)^(-10)); %D units are given in J/((K^4)*mol))

%Temperature's of a specific gas range from 908.22 Kelvin to 1265.92 Kelvin 
%calculate temperatures
T = linspace(908.22, 1265.92,7);

%Using the Heat capacitance equation:
C_p = a + b*T + c*(T.^2)+ d*(T.^3); %Given T is the temperature in Kelvin (K)

%Output in a Table
TableC = [T ; C_p];

%Displays temperature values up to 2 decimal places
%Displays heat capaciance values for H_2 up to 6 decimal places
fprintf('\nHeat Capacitance (Cp) Values for H2\n')
fprintf('\nT[K]\t\tCp[J K^-1 mol^-1]\n');
fprintf('\n%6.2f\t\t%8.6f\n',TableC);

