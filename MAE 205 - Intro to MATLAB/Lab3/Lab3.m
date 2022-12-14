%-------
%
% Lab 3 Problem 4
%
% Catherine Martinez,Moussa Coulibaly, Freddy Campbell
%-------
%
clc; clear;
[coeff,text] = xlsread('GasCoefficients',1,'A1:I5');

T = [300:100:1000];
CpO2= coeff(1,1)+ coeff(2,1)*T+ coeff(3,1)*T.^2+ coeff(4,1)*T.^3;
CpCO= coeff(1,4)+ coeff(2,4)*T+ coeff(3,4)*T.^2+ coeff(4,4)*T.^3;
CpCO2= coeff(1,5)+ coeff(2,5)*T+ coeff(3,5)*T.^2+ coeff(4,5)*T.^3;
CpCH4= coeff(1,8)+ coeff(2,8)*T+ coeff(3,8)*T.^2+ coeff(4,8)*T.^3;

out_table = [T; CpO2; CpCO; CpCO2; CpCH4];
fid1 = fopen('Lab3Cp.txt','w');
fprintf('Heat Capacitance Values of Four Gases\n\n');
fprintf('T[k]\t\tO2\t\t\tCO\t\t\tCO2\t\t\tCH4\t\n');
fprintf('%4i\t\t%6.4f\t\t%6.4f\t\t%6.4f\t\t%6.4f\t\n',out_table)
fclose(fid1);