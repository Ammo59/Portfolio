%Lagrange Interpolation Polynomials Method
clear
clc
close all
% t = x = Time (sec) | L = y = Length (in)
x = [1, 2, 3, 4, 5, 6, 7, 8, 10, 15];
y = [10, 17, 18, 25, 28, 30, 30, 33, 37, 39];
%Lagrange Interpolation Polynomials Equation p2x = L1x*y1 + L2x*y2 + L3x*y3
n = length(x) - 1;
x1 = 4.5;
x2 = 8.9;
X1 = 0;
X2 = 0;
for i=1:n+1
    px = 1;
    for j=1:n+1
        if j~=i
            px = px*(x1 - x(j))/(x(i) - x(j));
        end
    end
    X1 = X1 + y(i)*px;
end
for i=1:n+1
    px2 = 1;
    for j=1:n+1
        if j~=i
            px2 = px2*(x2 - x(j))/(x(i) - x(j));
        end
    end
    X2 = X2 + y(i)*px2;
end
yp1 = X1;
yp2 = X2;
fprintf('Equation of Lagrange Interpolation: p1(x) = y(i)*%d',px)
fprintf('Equation of Lagrange Interpolation: p2(x) = y(i)*%d',px2)
disp('Length at 4.5 seconds: ')
Ans = X1
disp('Length at 8.9 seconds: ')
Ans = X2
%Plotting Graph
xg = linspace(x(1),x(end));
plot(x,y,'-o',4.5,X1,'X',8.9,X2,'X')
hold on
xlabel('Time (seconds)')
ylabel('Length (inches)')