%Newton Divided-Difference Interpolating Polynomials Method
clear
clc
close all
% t = x = Time (sec) | L = y = Length (in)
x = [2 3 5]; y = [4 9 25];
% x = [1, 2, 3, 4, 5, 6, 7, 8, 10, 15];
% y = [10, 17, 18, 25, 28, 30, 30, 33, 37, 39];
%Newton Divided-Difference Interpolating Equation
n = length(x);
%x0 = 4.5;
x0 = 4;
 for i = 1:n
    D(i,1) = y(i);
 end
 for i = 2:n
    for j = 2:i
       D(i,j)=(D(i,j-1)-D(i-1,j-1))/(x(i)-x(i-j+1));
    end
 end
 fx0 = D(n,n);
 for i = n-1:-1:1
    fx0 = fx0*(x0-x(i)) + D(i,i);
 end
fprintf('Newtons iterated value: %11.8f \n', fx0)
fprintf('Equation of Lagrange Interpolation: p2(x) = p1(x) + a3(x-x1)(x-x2)')
%disp('Length at 4.5 seconds: ')
disp('Length at 8.9 seconds: ')
Ans = fx0
%Plotting Graph
xg = linspace(x(1),x(end));
plot(x,y,'-o',4.5,fx0,'X',8.9,49.29,'X')
hold on
xlabel('Time (seconds)')
ylabel('Length (inches)')