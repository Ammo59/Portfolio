%MAE 305 Project 5
%Aramis Kelkelyan
%Due: 05/07/21
%
%----------------------
clear;clc;
h = 0.5; u0 = [0;50];
f = @(t,u) ([u(2);10]); t = (0:0.5:10); 
u = EulerODESystem(f,t,u0);

% (5*t.^2+50*t)

plot(t,u,'k-');
xlabel('t'); ylabel('yEuler');
