%
% Aramis Kelkelyan, Group Member 1, Octavio Gutierrez, Group Member 2
% MAE 205 Section 11/12
%
% Laboratory 4, Problem 1
%------------------------------------------------------------------------
clear; clc;

%Part a)
%Given variables
x = linspace(-pi,pi);
y = sin(x);

%Plot Graph as figure 4
figure(4);

%Set Axis Limits
axis([-pi pi -1 1]);

%Plot sin(x) vs x
plot(x,y,'k','LineWidth',1);hold on;

%Plot the First 3 terms of sin(x) Taylor Expansion
fx1 = x - (x.^3)/factorial(3) + (x.^5)/factorial(5); 

plot(x,fx1,'m--','LineWidth',2);

%Plot the First 4 terms of sin(x) Taylor Expansion
fx2 = x - (x.^3)/factorial(3) + (x.^5)/factorial(5) - (x.^7)/factorial(7); 
plot(x, fx2,'r:','LineWidth',2); hold off;

%Title for Figure 4 "sin(x) and Taylor Series sin(x) from -pi \leq x \leq pi"
title('\bf{sin(x) and Taylor Series sin(x) from -\pi \leq x \leq \pi}'); 

%Create axis labels
xlabel('x');
ylabel('f(x)');

%Create Legend and add Grid Lines
legend('sin(x)','sin(x) series of 3 terms','sin(x) series of 4 terms','Location','SE'); grid on;

%Part b)
%Given variables
x2 = linspace(0,2*pi);
y2 = sin(x2);

%Plot Graph as figure 6
figure(6);

%Create 3 seperate subplots arranged in a single column
subplot(3,1,1);

%Plot sin(x)
plot(x2, y2,'k','LineWidth',3);

%Title top-most plot "sin(x) and the Taylor Series sin(x) from 0 \leq x
%\leq 2*pi"
title('\bf{sin(x) and the Taylor Series sin(x) from 0 \leq x \leq 2\pi}');

%Create axis labels
xlabel('x');
ylabel('sin(x)');

%Set Axis Limits
axis([0 2*pi -3 3]);

%Add Grid
grid on;

%Plot the First 5 terms of sin(x) Taylor Expansion
fx5 = x2 - ((x2).^3)/factorial(3) + ((x2).^5)/factorial(5) - ((x2).^7)/factorial(7) + ((x2).^9)/factorial(9);

%Create Subplot
subplot(3,1,2);
plot(x2, fx5,'c-.','LineWidth',3); 

%Add Grid
grid on;

%Create axis labels
xlabel('x');
ylabel('sin(x) series of 5 terms');

%Set Axis Limits
axis([0 2*pi -3 3]);

%Plot the First 6 terms of sin(x) Taylor Expansion
fx6 = x2 - ((x2).^3)/factorial(3) + ((x2).^5)/factorial(5) - ((x2).^7)/factorial(7) + ((x2).^9)/factorial(9) - ((x2).^11)/factorial(11); 

%Create Subplot
subplot(3,1,3);
plot(x2, fx6,'b:','LineWidth',3); 

%Set Axis Limits
axis([0 2*pi -3 3]);

%Create axis labels
xlabel('x');
ylabel('sin(x) series of 6 terms');

%Add Grid Lines
grid on;
