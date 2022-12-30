%MAE 305 Project 5
%Aramis Kelkelyan
%Due: 05/07/21
%
%----------------------
clear;clc;clf;

h = 0.5; y0 = 0;
f = @(t,y)(-10*t + 50); t = (0:0.5:10); 
yEuler = EulerODE(f,t,y0);

plot(t,yEuler,'b-','Linewidth',2);
xlabel('t'); ylabel('y');