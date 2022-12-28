% Aramis Kelkelyan
% MAE 375: Homework #6, Chapter 6 
% Problem 7
% Date: 11/4/2021
%-----------------------------------------
clear;clc;
%This is a offset 4-bar crank-slider configuration
%the output: Vslip. VA and VB (link 3)
%Use example 6-7 on pg 326 (lookup pg.353) method in Section 6.7
%Velocity of Slip = Velocity of Pin B

%Given values
links = input('Enter link lengths [2, 3, Offset]: ');
a = links(1); b = links(2); c = links(3);
givens = input('Enter angle in degrees and velocity of [theta 2, omega 2]: ');
theta2 = givens(1); omega2 = givens(2);

%Use equation 4.16a and 4.17 to find theta 3
theta3_open = asind((-a*sind(theta2)-c))/(b);
theta3_crossed = asind((a*sind(theta2)-c)/b)+180;

%Use equation 4.16b to find d
d1 = a*cosd(theta2)-b*cosd(theta3_open);
d2 = a*cosd(theta2)-b*cosd(theta3_crossed);

%Find omega 3
omega3_open = a/b*omega2 *(cosd(theta2)/cosd(theta3_open)); 
omega3_crossed = a/b*omega2 *(cosd(theta2)/cosd(theta3_crossed)); 

%Find linear velocities of points A and B for open & crossed configurations
VA = (a*omega2)*[(-sind(theta2)),cosd(theta2)]; %Equation 6.23a
VA_mag = norm(VA); VA_ang = atan2d(VA(2),VA(1));

VB_open = (-a*omega2*sind(theta2))+(b*omega3_open*sind(theta3_open)); %Equation 6.22b
VB_crossed = (-a*omega2*sind(theta2))+(b*omega3_crossed*sind(theta3_crossed));

%No need to calculate angle
VB_config = [VB_open, VB_crossed];
VB_ang = zeros(1,2);

for ii = 1:2
    if VB_config(ii) > 0
        VB_ang(ii) = 0; %If VB is positive, the angle of VB = 0
    else
        VB_ang(ii) = 180; %If VB is negative, the angle of VB = 180
    end
end

%Print open and crossed configurations
fprintf('Open configuration: omega3 = %4.3f, VA = [%6.3f, %6.3f] at angle %6.3f°, and VB = [%6.3f] at angle %6.3f°\n', omega3_open, VA, VA_ang, VB_open, VB_ang(1));
fprintf('Crossed configuration: omega3 = %4.3f, VA = [%6.3f, %6.3f] at angle %6.3f°, and VB = [%6.3f] at angle %6.3f°\n', omega3_crossed, VA, VA_ang, VB_crossed, VB_ang(2));

