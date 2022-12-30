%Point Difference formulas
clear;clc;
f = @(x) exp(-x).*sin(x/2);
x = [1.2 1.4 1.6 1.8, 1.9];
y = f(x)
%xi = 1.6 = x(3)
h = x(3)-x(2); %h = x(i)-x(i-1) 
fprintf('h = %.5f\n',h);
%%
%for f'
%two-point back (f(x(i))-f(x(i-1)))/h;
z2b = (f(x(3))-f(x(2)))/h;
fprintf('two-point back = %.5f\n',z2b);
%two point forward (f(x(i+1))-f(x(i)))/h;
z2f = (f(x(4))-f(x(3)))/h;
fprintf('two-point forward = %.5f\n',z2f);
%two point central (f(x(i+1))-f(x(i-1)))/h;
z2c = (f(x(4))-f(x(2)))/h;
fprintf('two-point centra; = %.5f\n',z2c);
%three point back (f(x(i-2))-4*f(x(i-1))+3*f(x(i)))/(2*h);
z3b = (f(x(1))-4*f(x(2))+3*f(x(3)))/(2*h);
fprintf('three-point back; = %.5f\n',z3b);
%three point forward (-3*f(x(i))+4*f(x(i+1))-f(x(i+2)))/(2*h);
z3f = (-3*f(x(3))+4*f(x(4))-f(x(5)))/(2*h);
fprintf('three-point forward = %.5f\n',z3f);
%%
%for f''
%three ppint back
%zp3b = (f(x(1))-2*f(x(2))+f(x(3)))/(h^2);
%fprintf('three-point back; = %.5f\n',zp3b);
%three point for
%zp3f = (f(x(5))-2*f(x(4))+f(x(3)))/(h^2)
%three point central
%zp3c = (f(x(5))-2*f(x(4))+f(x(3)))/(h^2)