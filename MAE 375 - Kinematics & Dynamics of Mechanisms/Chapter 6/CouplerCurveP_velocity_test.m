clear; clc;

a =0.785; b=0.356; c=0.950; d=0.544;
thetaAP = char(56);
theta1 = 0;
omega2 = 2*pi*100/60;

theta2 = deg2rad(0:2:360);


L2=a; L3=b; L4=c; L1=d;

k1=d/a; 
k2=d/c; 
k3=(a^2-b^2+c^2+d^2)/(2*a*c);

A = cos(theta2) -k1-k2*cos(theta2)+k3;
B = -2*sin(theta2);
C = k1-(k2+1)*cos(theta2)+k3;

theta4 = 2*atan(-B+sqrt(B.^2-4*A.*C))./(2*A); 2*atan(-B-sqrt(B.^2-4*A.*C))./(2*A);

k4=d/b; 
k5=(c^2-d^2-a^2-b^2)/(2*a*b);

D = cosd(theta2)-k1+k4*cosd(theta2) + k5;
E = -2*sind(theta2);
F = k1+(k4-1)*cosd(theta2)+k5;

theta3 = 2*atand((-E-sqrt(E.^2-4*D.*F))./(2*D)); 2*atand((-E+sqrt(E.^2-4*D.*F))./(2*D));

omega3 = ((a*omega2)/b)*(sin(theta4-theta2)/sin(theta3-theta4));
omega4 = ((a*omega2)/c)*(sin(theta2-theta3)/sin(theta4-theta3));

VA = a*omega2*(-sin(theta2)+cos(theta2));
VBA = b*omega2*(-sin(theta3)+cos(theta3));
VB = c*omega2*(-sin(theta4)+cos(theta4));

AP = 1.09;

VPA = AP*omega3;
VP = VA + VPA;


VPx = VP.*cosd(theta2);
VPy = VP.*sind(theta2);

plot ([VPx],[VPy])
xlabel('x');
ylabel('y');
title('Coupler Curve of P Through Toggle Position');


