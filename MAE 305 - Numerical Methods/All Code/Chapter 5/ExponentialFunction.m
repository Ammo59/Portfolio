%Exponential Function Method
clear
clc
close all
% t = x = Time (sec) | L = y = Length (in)
t = [1, 2, 3, 4, 5, 6, 7, 8, 10, 15];
L = [10, 17, 18, 25, 28, 30, 30, 33, 37, 39];
%Exponential Equation y = ae^bx
C = polyfit(t,log(L),1);
a = exp(C(2));
b = C(1);
f = @(x) a*exp(b*x);
fprintf('Equation of Exponential Function: y = %d*e^%dx',a,b)
disp('Length at 4.5 seconds: ')
f(4.5)
disp('Length at 8.9 seconds: ')
f(8.9)
%Plotting Graph
xx=1:0.1:15;
figure;
plot(xx,f(xx),t,L,'o');
xlabel('Time (seconds)')
ylabel('Length (inches)')