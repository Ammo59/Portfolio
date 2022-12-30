clear;clc;

j = sqrt(-1);

%Given values
a = input('Enter length of a: ');
b = input('Enter length of b: ');
c = input('Enter length of c: ');
d = input('Enter length of d: ');
gamma = input('Enter angle of gamma: ');
theta2 = input('Enter angle of theta 2: ');

%Define values of constants for finding theta 4
P = asin(theta2)*sin(gamma)+(a*cos(theta2)-d)*cos(gamma);
Q = -asin(theta2)*cos(gamma)+(a*cos(theta2)-d)*sin(gamma);
R = -c*sin(gamma);
S = R-Q;
T = 2*P;
U = Q+R;
%Open circuit calculations
theta4_1 = 2*atand(0.5*(-T+sqrt(T^2-4*S*U))/S)
theta4_2 = 2*atand(0.5*(-T-sqrt(T^2-4*S*U))/S)
theta3_1 = gamma+theta4_1
theta3_2 = gamma+theta4_2
%Crossed Circuit Calculations
b1 = (a*sind(theta2)-c*sind(theta4_1))/sind(theta3_1)
b2 = (a*sind(theta2)-c*sind(theta4_2))/sind(theta3_2)
