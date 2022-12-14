%
%
%
% Practice for the Final
clear;clc;

minT = input('Input the minimum temperature: ');

maxT = input('Input the maximum temperature: ');

T = 300:25:1800;

a = 19.875; b = 0.05021; c = 1.27 * 10^(-5); d = -1.1 * 10^(-8);

C_p = a + b.*T + c.*T.^2 + d.*T.^3;

disp(C_p);
%% -----------------------
clear;clc;clf;
%Initial Gauge Length
[B,t] = xlsread('Tension_Test_Data.xlsx',1,'A1:O2');

L = [B(1,1),B(1,2),B(1,3),B(1,4),B(1,5),B(1,6),B(1,7),B(1,8),B(1,9),B(1,10),B(1,11),B(1,12),B(1,13),B(1,14)]; %units in mm
F = [B(2,1),B(2,2),B(2,3),B(2,4),B(2,5),B(2,6),B(2,7),B(2,8),B(2,9),B(2,10),B(2,11),B(2,12),B(2,13),B(2,14)]; %units in Newtons

L0 = 25.4;
A0 = pi.*((5.75)/1000)^2;

%Engineering Stress / Strain
eng_stress = F/A0;
eng_strain = (L - L0)/L0;

%True Stress / Strain
true_stress = (F/A0) .* (L/L0);
true_strain = log(L/L0);

%Graph two plots in same figure
figure(2);
plot(true_strain,true_stress,'b-.', 'LineWidth', 2); hold on; grid on;
plot(eng_strain, eng_stress, 'k:', 'LineWidth', 2); 

title('\bf True vs Engineering Stress-Strain Curves') %Title curves with boldface
legend('True Curve','Engineering Curve','Location','SE')
xlabel('Strain');
ylabel('Stress');
table = [F;eng_stress;eng_strain;true_stress;true_strain];

file_id = fopen('Kelkelyan_StressStrain.txt','w');
fprintf('Table of Aluminum Stress/Strain Test\n');
fprintf('Force [N]\tEng. Stress [Pa]\tEng. Strain\tTrue Stress [Pa]\tTrue Strain\t\n');
fprintf('%5i\t\t%3.2E\t\t%5.4f\t\t%3.2E\t\t%5.4f\n',table);
fclose(file_id);
