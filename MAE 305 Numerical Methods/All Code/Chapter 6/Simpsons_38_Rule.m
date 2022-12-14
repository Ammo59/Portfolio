%MAE 300 Lab Project
%Aramis Kelkelyan
%Due: 4/22/21
%3/8 Simpson's Rule
%-------------------------------------------------------
clear; clc;
%Limits of integral (a = lower, b = upper)
a = 2; b = 8;

%Ask for user inputted range of intervals (10,100,1000)
n = input('Enter number of intervals: ');
x = linspace(a,b,n+1);

%Define function and calculate equally spaced data
I = @(x)(5*x.^2 -(8*x));
h = (b-a)/n; fofx = zeros(1,n+1);

for ii = 1:n+1
    fofx(ii) = I(x(ii));
end

%split up the points
g = fofx; g_3 = zeros(1,length(g));
g(1) = []; g(end) = []; g_not3 = zeros(1,length(g));

inot3 = 0; %not a 3 multiple
i3 = 0; %is a 3 multiple

for jj = 1:length(g)
    if mod(jj , 3) == 0
        i3 = i3 + 1;
        g_3(i3) = g(jj);
    else
        inot3 = inot3 + 1;
        g_not3(inot3) = g(jj);
    end
end

%evaluate the integral
integral = 3*h/8 * (fofx(1) + fofx(end) + 3 * sum(g_not3) + 2 * sum(g_3));
fprintf('The area estimated by rectangles is: %5.4f\n',integral);