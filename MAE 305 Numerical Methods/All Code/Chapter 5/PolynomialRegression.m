%Polynomial Regression Method
clear
clc
close all
% t = x = Time (sec) | L = y = Length (in)
t = [1, 2, 3, 4, 5, 6, 7, 8, 10, 15];
L = [10, 17, 18, 25, 28, 30, 30, 33, 37, 39];
%Polynomial Regression Equation y = a2x^2 + a1x + ao
n = length(t);
%Lines 11-15 are from textbook and didn't work for me
Sumt = sum(t); SumL = sum(L);
Sumt2 = sum(t.^2); Sumt3 = sum(t.^3); Sumt4 = sum(t.^4);
SumtL = sum(t.*L); Sumt2L = sum(t.*t.*L);
A = [n Sumt Sumt2;Sumt Sumt2 Sumt3;Sumt2 Sumt3 Sumt4];
b = [SumL;SumtL;Sumt2L];
polyfit(t,L,2);
a2 = -0.1813;
a1 = 4.8531;
a0 = 6.6877;
fprintf('Equation of Polynomial Regression Function: y = %d*(4.5^2) + %d*4.5 + %d',a2,a1,a0)
disp('Length at 4.5 seconds: ')
Ans = a2*(4.5^2) + a1*4.5 + a0
disp('Length at 8.9 seconds: ')
Ans = a2*(8.9^2) + a1*8.9 + a0
%Plotting Graph
xx = linspace(t(1),t(end));
p = zeros(100,1);
for i = 1:100
    p(i) = a2*xx(i)^2+a1*xx(i)+a0;
end
plot(t,L,'o')
hold on
plot(xx,p)
xlabel('Time (seconds)')
ylabel('Length (inches)')