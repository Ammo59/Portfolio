%
% Aramis Kelkelyan
% MAE 376: EC 13.1
% Date: 02/23/2022
%-----------------------------------------
clear;clc;clf;

%Use MATLAB to plot the two curves versus 0 <= t <= 2 in the same graph
%Make a comment about the time to reach the stability based on value of tau

t = linspace(0,2,100);
x1 = 4.*exp(-4.*t); x2 = 2.*exp(-2.*t);
plot(t,x1,t,x2);

xlabel('Time (s)');
ylabel('Unit Impulse Response, x(t)');
legend('x_1','x_2');
title('Unit Impulse Response vs Time');
text(0.8,0.25,'\leftarrow x_1');
text(0.8,0.45,'\leftarrow x_2');
text(0.4, 3, 'x_1 = 4*e^{-4t}, \tau = 1/4', 'FontSize', 10');
text(0.4,2.5,'x_2 = 2*e^{-2t}, \tau = 1/2', 'FontSize', 10');
