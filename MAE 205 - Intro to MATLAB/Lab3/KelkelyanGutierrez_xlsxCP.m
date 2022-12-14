%
% Aramis Kelkelyan, Group Member 1, Octavio Gutierrez, Group Member 2
% MAE 205 Section 11/12
%
% Laboratory 3, Problem 4
%------------------------------------------------------------------------
clear; clc;

%Place Downloaded File into MATLAB Directory
%Read the excel file
[A,t] = xlsread('GasCoefficients.xlsx',1,'A1:I5');

%Temperature ranges from 600K to 1300K with 100K increments
T = [600:100:1300];

%Calculate the heat capacitances for gases, given T is the temperature in Kelvin (K)
C_pO2 = A(1,2) + A(2,2)*T + A(3,2)*(T.^2)+ A(4,2)*(T.^3); 
C_pCO = A(1,4) + A(2,4)*T + A(3,4)*(T.^2)+ A(4,4)*(T.^3); 
C_pH2O = A(1,6) + A(2,6)*T + A(3,6)*(T.^2)+ A(4,6)*(T.^3); 
C_pNH3 = A(1,7) + A(2,7)*T + A(3,7)*(T.^2)+ A(4,7)*(T.^3); 

%Output in a Table
TableFinal = [T;C_pO2;C_pCO;C_pH2O;C_pNH3];

%Output he data to a text file
file_id = fopen('Lab3CP.txt', 'w');

%Display heat capaciance values for the gases 
fprintf(file_id,'\nHeat Capacitance (Cp) Values T[K]\tCp[J K^-1 mol^-1] for 02,CO,H2O, and NH3\n');

%Display Gas Variables
fprintf(file_id,'T[K]\t\tO2\t\t\tCO\t\t\tH20\t\t\tNH3\n');

%Display temperature values as integers and Cp values up to 3 decimal places
fprintf(file_id,'%5i\t\t%.3f\t\t%.3f\t\t%.3f\t\t%.3f\n',TableFinal);

fclose(file_id);
