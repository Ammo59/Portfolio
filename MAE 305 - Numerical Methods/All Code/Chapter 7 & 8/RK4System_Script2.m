%MAE 305 Project 5
%Aramis Kelkelyan
%Due: 05/07/21
%
%----------------------
clear;clc;
h = 0.01; u0 = [0;50];
f = @(t,u) ([u(2);10]); t = (0:0.01:10); 
u = RK4System(f,t,u0);

% (5*t.^2+50*t)

plot(t,u,'c-');
xlabel('t'); ylabel('yEuler');
