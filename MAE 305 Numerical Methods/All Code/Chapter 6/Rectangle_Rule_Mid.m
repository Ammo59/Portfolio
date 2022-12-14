%MAE 300 Lab Project 
%Aramis Kelkelyan
%Due: 4/22/21
%Rectangular Rule, Midpoint
%-------------------------------------------------------

clear; clc;

%Limits of integral (a = lower, b = upper)
a = 2; b = 8;

%Ask for user inputted range of intervals (10,100,1000)
n = input('Enter number of intervals: ');
x = linspace(a,b,n);

%Define function handle and calculate equally spaced data
h = (b-a)/n;
I = @(x) (5*x.^2-(8*x));

%Define loop variable
r = zeros(1,n); r(1) = 2; %Pre-allocate
y = 0;

for ii = 2:n 
    r(ii) = 0.5*(x(ii)+x(ii-1));
    y = y + I(r(ii));
end

fprintf('The area estimated by rectangles is: %5.4f\n',h*y);