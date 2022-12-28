clear; clc;
a=40; b=120; 
offset=-20;
theta_2=60;
theta3_1=asind(-1*((a*sind(theta_2)-offset)/b))+180
theta3_2=asind(((a*sind(theta_2)-offset)/b))
d_1=a*cosd(theta_2)-b*cosd(theta3_1) 
d_2=a*cosd(theta_2)-b*cosd(theta3_2)