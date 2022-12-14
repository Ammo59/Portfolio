%
% Aramis Kelkelyan
% MAE 205 Section 11/12
%
% Bonus Laboratory I
%------------------------------------------------------------------------
clear; clc; clf;

%Read Data from file
[B, t] = xlsread('Tension_Test_Data.xlsx',1,'A1:O2');

r = 5.75; %units in milimeters (mm)
L0 = 25.4; %units in mm

%Since A0 has a round cross section...
A0 = pi.*(r/1000)^2; %units in meters (m)^2

%Define Force and Length from Excel Sheet
L = [B(1,1),B(1,2),B(1,3),B(1,4),B(1,5),B(1,6),B(1,7),B(1,8),B(1,9),B(1,10),B(1,11),B(1,12),B(1,13),B(1,14)]; %units in mm
F = [B(2,1),B(2,2),B(2,3),B(2,4),B(2,5),B(2,6),B(2,7),B(2,8),B(2,9),B(2,10),B(2,11),B(2,12),B(2,13),B(2,14)]; %units in Newtons

%Calculate engineering stress and engineering strain
sigma_e = F/A0 ; % units in Pascal
epsilon_e = (L-L0)/L0;

%Calculate true stress and true strain
sigma_t = (F/A0).*(L/L0); % units in Pascal
epsilon_t = log(L/L0);

%Create a table with the values and save it to a .txt file
tbl = [F;sigma_e;epsilon_e;sigma_t;epsilon_t];
fid = fopen('Kelkelyan_StressStrain.txt','w');

%Output and format table with fprintf
fprintf('Table of Aluminum Stress/Strain Test\n');
fprintf('Force [N]\tEng. Stress [Pa]\tEng. Strain\tTrue Stress [Pa]\tTrue Strain\t\n');
fprintf('%5i\t\t%3.2E\t\t%5.4f\t\t%3.2E\t\t%5.4f\n',tbl);

fclose(fid); %Close file

%Plot both curves in one figure
figure(2); %Open figure 2
plot(epsilon_t,sigma_t,'b:','LineWidth',2); hold on; %Plot first curve true strain vs. true stress with blue color and dotted line
plot(epsilon_e,sigma_e,'r--','LineWidth',2); %Plot second curve eng. strain vs. eng. stress with blue color and dotted line

%Format Graph by labeling axes, creating a legend, titling it, and enabling grid 

title('\bf True vs Engineering Stress-Strain Curves') %Title curves with boldface
legend('True Curve','Engineering Curve','Location','SE')
xlabel('Strain') %x-axis label
ylabel('Stress (in Pascal)') %y-axis label
hold off;
grid on;

