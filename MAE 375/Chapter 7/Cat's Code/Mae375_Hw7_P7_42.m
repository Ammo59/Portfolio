%Catherine Martinez
%Homework 7 Problem 33
clc;clear;

%Given information
a = .785;
b = .356;
c = .950;
d = .544;
Rpa = 1.09;
delta3 = 0;
omega2 = 20;
alpha2 = 0;

%Calculate toggle position of theta 2
theta2_tog1 = acosd((a^2+d^2-(b+c)^2)/(2*a*d));
theta2 = -theta2_tog1:1:theta2_tog1; 

%Find constant values in order to solve for parameters
K1 = d/a;
K2 = d/c;
K3 = (a^2-b^2+c^2+d^2)/(2*a*c);
K4 =  d/b;
K5 = (c^2-d^2-a^2-b^2)/(2*a*b);

%From equation 4.10a you find the parameters using the link ratios
%calculated beforehand
A = cosd(theta2)-K1-K2*cosd(theta2)+K3;
B = -2*sind(theta2);
C = K1-(K2+1)*cosd(theta2)+K3;
D = cosd(theta2)-K1+K4*cosd(theta2)+K5;
E = -2*sind(theta2);
F = K1+((K4-1)*cosd(theta2))+K5;

%Use equation 4.10b to find theta 3 and 4 for open configurations
theta4_open = 2.*atand(0.5*(-B-sqrt(B.*B-4*A.*C))./A);

theta3_open = 2.*atand(0.5*(-E-sqrt(E.*E-4*D.*F))./D);

omega3_open = ((a*omega2)/b)*(sind(theta4_open-theta2)/sind(theta3_open-theta4_open));
omega4_open = ((a*omega2)/c)*(sind(theta2-theta3_open)/sind(theta4_open-theta3_open));

%Calculate acceleration at point A using equation 7.13a
AA = (a*omega2)*(-sind(theta2)+1i*cosd(theta2))-(a*omega2^2)*(cosd(theta2)+1i*sind(theta2));

%Use equation 7.12 to find angular acceleration of link 3
A1 = c*sind(theta4_open);
B1 = b*sind(theta3_open);
C1 = a*alpha2*sind(theta2)+a*omega2^2*cosd(theta2)+b*omega3_open^2*cosd(theta3_open)-c*omega4_open^2*cosd(theta4_open);
D1 = c*cosd(theta4_open);
E1 = b*cosd(theta3_open);
F1 = a*alpha2*cosd(theta2)-a*omega2^2*sind(theta2)-b*omega3_open^2*sind(theta3_open)+c*omega4_open^2*sind(theta4_open);

alpha3_open =((C1*D1)-(A1*F1))/((A1*E1)-(B1*D1));

Apa = Rpa*alpha3_open*(-sind(theta3_open+delta3)+1i*cosd(theta3_open+delta3))-Rpa*omega3_open^2*(cosd(theta3_open+delta3)+1i*sind(theta3_open+delta3));
Ap = AA+Apa;
Ap_ang = angle(Ap);