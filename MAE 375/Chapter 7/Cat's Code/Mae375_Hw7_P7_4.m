%Catherine Martinez
%Homework 7 Problem 7.4 a&b

clc;clear;

%Define given lengths 
a = input('enter a value for Link 2: ');
b = input('enter a value for Link 3: ');
c = input('enter a value for Link 4: ');
d = input('enter a value for Link 1: ');
theta2 = input('enter a value for theta 2: ');
omega2 = input('enter a value for omega 2: ');
alpha2 = input('enter a value for alpha 2: ');
Rpa = input('enter a value for vector of coupler point: ');
delta3 = input('enter a value for delta 3: ');

%Use equation 4.8a to calculate link ratios
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

%Use equation 4.10b to find theta 4 for open and crossed configurations
theta4_open = 2.*atan2d((-B-sqrt(B.*B-4*A.*C)),2*A);
theta4_open = theta4_open-360;
theta4_cross = 2.*atan2d((-B+sqrt(B.*B-4*A.*C)),2*A);

%Using K4 and K5 and equation 4.12, we can solve for parameters in
%order to find theta 3 for open and crossed configurations
D = cosd(theta2)-K1+K4*cosd(theta2)+K5;
E = -2*sind(theta2);
F = K1+((K4-1)*cosd(theta2))+K5;

%Use equation 4.13 to find theta 3 for open and crossed configurations

theta3_open = 2.*atan2d((-E-sqrt(E.*E-4*D.*F)),2*D);
theta3_cross = 2.*atan2d((-E+sqrt(E.*E-4*D.*F)),2*D);
theta3_open = theta3_open-360;

%Using equations 6.18 find the angular velocity of link 3 and link 4
omega3_open = ((a*omega2)/b)*(sind(theta4_open-theta2)/sind(theta3_open-theta4_open));
omega4_open = ((a*omega2)/c)*(sind(theta2-theta3_open)/sind(theta4_open-theta3_open));

%Use equation 6.18 to calculate the angular velocity of link 3 and link 4
%for a crossed configuration
omega3_cross = ((a*omega2)/b)*(sind(theta4_cross-theta2)/sind(theta3_cross-theta4_cross));
omega4_cross = ((a*omega2)/c)*(sind(theta2-theta3_cross)/sind(theta4_cross-theta3_cross));

%Use Euler's identity and use equation 7.13 to find acceleration of A by
%breaking it down to x and y components
Aax = -a*alpha2*sind(theta2)-a*omega2^2*cosd(theta2);
Aay = -a*alpha2*cosd(theta2)-a*omega2^2*sind(theta2);
Aa = sqrt(Aax^2+Aay^2);
thetaAA = atan2d(Aay,Aax);

%Find angular acceleration of links 3 and 4 for open and cross
%configurations using equations 7.12
A1 = c*sind(theta4_open);
B1 = b*sind(theta3_open);
C1 = a*alpha2*sind(theta2)+a*omega2^2*cosd(theta2)+b*omega3_open^2*cosd(theta3_open)-c*omega4_open^2*cosd(theta4_open);
D1 = c*cosd(theta4_open);
E1 = b*cosd(theta3_open);
F1 = a*alpha2*cosd(theta2)-a*omega2^2*sind(theta2)-b*omega3_open^2*sind(theta3_open)+c*omega4_open^2*sind(theta4_open);

alpha3_open =((C1*D1)-(A1*F1))/((A1*E1)-(B1*D1));
alpha4_open =(C1*E1-B1*F1)/(A1*E1-B1*D1);

%cross configurations
A2 = c*sind(theta4_cross);
B2 = b*sind(theta3_cross);
C2 = a*alpha2*sind(theta2)+a*omega2^2*cosd(theta2)+b*omega3_cross^2*cosd(theta3_cross)-c*omega4_cross^2*cosd(theta4_cross);
D2 = c*cosd(theta4_cross);
E2 = b*cosd(theta3_cross);
F2 = a*alpha2*cosd(theta2)-a*omega2^2*sind(theta2)-b*omega3_cross^2*sind(theta3_cross)+c*omega4_cross^2*sind(theta4_cross);

alpha3_cross =(C2*D2-A2*F2)/(A2*E2-B2*D2);
alpha4_cross =(C2*E2-B2*F2)/(A2*E2-B2*D2);

%Find the acceleration of point B for open and cross configurations using
%equation 7.13c
Abx1 = c*(-alpha4_open*sind(theta4_open)-omega4_open^2*cosd(theta4_open));
Aby1 = c*(alpha4_open*cosd(theta4_open)-omega4_open^2*sind(theta4_open));
Ab1 = sqrt(Abx1^2+Aby1^2);
thetaAb1 = atan2d(Aby1,Abx1);

%cross
Abx2 = c*(-alpha4_cross*sind(theta4_cross)-omega4_cross^2*cosd(theta4_cross));
Aby2 = c*(alpha4_cross*cosd(theta4_cross)-omega4_cross^2*sind(theta4_cross));
Ab2 = sqrt(Abx2^2+Aby2^2);
thetaAb2 = atan2d(Aby2,Abx2);

%Find the acceleration of point P for open and cross configurations using
%equation 7.32
%j=1i (imaginary number)
AA = a*alpha2*(-sind(theta2)+1i*cosd(theta2))-a*omega2^2*(cosd(theta2)+1i*sind(theta2)); %equation 7.29c
Apa1 = Rpa*alpha3_open*(-sin(theta3_open+delta3))+1i*cosd(theta3_open+delta3)-Rpa*omega3_open^2*(cosd(theta3_open+delta3)+1i*sind(theta3_open+delta3));
Ap1 = AA + Apa1;
Ap11 = norm(Ap1);
Ap1_ang = angle(Ap1);


Apa2 = Rpa*alpha3_cross*(-sin(theta3_cross+delta3))+1i*cosd(theta3_cross+delta3)-Rpa*omega3_cross^2*(cosd(theta3_cross+delta3)+1i*sind(theta3_cross+delta3));
Ap2 = AA + Apa2;
Ap22 = norm(Ap2);
Ap2_ang = angle(Ap2);