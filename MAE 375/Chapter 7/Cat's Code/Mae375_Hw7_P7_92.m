%Catherine Martinez
%Homework 7 Problem 7.92
clc;clear;

%Write given information
a = 1;
d = 1.69;
e = 4.76;
theta2 = -96.517;
theta3 = -151.289;
omega2 = 16;
alpha2 = 0;

b = (a*sind(theta2))/sind(theta3);
omega3 = ((a*omega2)/b)*(cosd(theta2-theta3));
bdot = (a*omega2*cosd(theta2)-b*omega3*cosd(theta3))/sind(theta3);

%Find alpha 3
alpha3 = (1/b)*(a*alpha2*cosd(theta2-theta3)+a*omega2^2*sind(theta3-theta2)-2*bdot*omega3);

%Acceleration of point A on link 2
AA2 = a*alpha2*(-sind(theta2)+1i*cosd(theta2))-a*omega2^2*(cosd(theta2)+1i*sind(theta2));

%magnitude of acceleration of point A
AA22 = norm(AA2);

%angle of acceleration
AA2_ang = angle(AA2); %Fix this

%Find the acceleration of points A and B on link 4 using equation 7.13a
theta4 = theta3;
alpha4 = alpha3;
omega4 = omega3;

AA4 = b*alpha4*(-sind(theta4)+1i*cosd(theta4))-b*omega4^2*(cosd(theta4)+1i*sind(theta4));

%magnitude of acceleration of point A
AA44 = norm(AA4);

%angle of acceleration
AA4_ang = angle(AA4); %Fix this

Ab = a*alpha4*(-sind(theta4)+1i*cosd(theta4))-a*omega4^2*(cosd(theta4)+1i*sind(theta4));

%Magnitude and angle
Ab1 = norm(Ab);
Ab_ang = angle(Ab);
