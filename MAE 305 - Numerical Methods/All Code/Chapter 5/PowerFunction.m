%Power Function Method
clear
clc
close all
% t = x = Time (sec) | L = y = Length (in)
t = [1, 2, 3, 4, 5, 6, 7, 8, 10, 15];
L = [10, 17, 18, 25, 28, 30, 30, 33, 37, 39];
%Power Function Equation y = ax^b | logy = b*logx + loga
P = polyfit(log(t),log(L),1);
a = exp(P(2));
b = P(1);
xx = 0:.1:16;
yy = a*xx.^b;
fprintf('Equation of Power Function: y = %d*x^%d',a,b)
disp('Length at 4.5 seconds: ')
Ans = a*4.5^b
disp('Length at 8.9 seconds: ')
Ans = a*8.9^b
%Plotting Graph
figure;
plot(t,L,'o',xx,yy);
xlabel('Time (seconds)')
ylabel('Length (inches)')