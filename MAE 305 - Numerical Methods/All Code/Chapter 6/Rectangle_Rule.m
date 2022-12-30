%MAE 300 Lab Project 
%Aramis Kelkelyan
%Due: 4/22/21
%Rectangular Rule, Left EndPoints
%-------------------------------------------------------

clear; clc;

%Limits of integral (a = lower, b = upper)
a = 2; b = 8;

%Ask for user inputted range of intervals (10,100,1000)
n = input('Enter number of intervals: ');
x = linspace(a,b,n);

%Define function and calculate equally spaced data
h = (b-a)/n;
I = 5*x.^2-(8*x);

%Define loop variable
y = 0;

for ii = 1:n 
    y = y + I(ii);
end

fprintf('The area estimated by rectangles is: %5.4f\n',y*h);
