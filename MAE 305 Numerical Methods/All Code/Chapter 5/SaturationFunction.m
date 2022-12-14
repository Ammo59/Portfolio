%Saturation Function Method
clear
clc
close all
% t = x = Time (sec) | L = y = Length (in)
t = [1, 2, 3, 4, 5, 6, 7, 8, 10, 15];
L = [10, 17, 18, 25, 28, 30, 30, 33, 37, 39];
%Saturation Function Equation y = x/(ax+b) | 1/y = b(1/x)+a
P = polyfit(1./t,1./L,1);
a = 1/(P(2));
b = P(1)/P(2);
xx = 0:.1:16;
yy = a*xx./(b+xx);
fprintf('Equation of Saturation Function: y = %d*x/((%d)+x)',a,b)
disp('Length at 4.5 seconds: ')
Ans = a*4.5/(b+4.5)
disp('Length at 8.9 seconds: ')
Ans = a*8.9/(b+8.9)
%Plotting Graph
figure;
plot(t,L,'o',xx,yy);
xlabel('Time (seconds)')
ylabel('Length (inches)')