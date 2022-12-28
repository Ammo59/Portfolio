% Aramis Kelkelyan
% MAE 375: Homework #6, Chapter 6 
% Problem 9
% Date: 11/9/2021
%-----------------------------------------
clear;clc;
%This is an inverted 4-bar crank-slider configuration
%the output: Vslip, VA, and VB (link 3)
%Use equations on pg 328 (lookup pg.353) method in Section 6.7
%Velocity of Slip = Velocity of Pin B

%Given values
links = input('Enter link lengths [1, 2, 4]: ');
d = links(1); a = links(2); c = links(3);
givens = input('Enter angles in degrees and velocity of [gamma, theta 2, omega 2]: ');
gamma = givens(1); theta2 = givens(2); omega2 = givens(3);

%Define Substitute Variables
P = a*sind(theta2)*sind(gamma)+(a*cosd(theta2)-d)*cosd(gamma);
Q = -a*sind(theta2)*cosd(gamma)+(a*cosd(theta2)-d)*sind(gamma);
R = -c*sind(gamma);
S = R - Q; T = 2*P; U = Q + R;

%Find link length b, theta 3, and theta 4
theta4_open = 2*atand((-T+sqrt(T^2 - 4*S*U))/(2*S));
theta4_crossed = 2*atand((-T-sqrt(T^2 - 4*S*U))/(2*S)); 

theta3_open = theta4_open + gamma; 
theta3_crossed = theta4_crossed + gamma;

b_open = (a*sind(theta2) - c*sind(theta4_open))/sind(theta3_open);
b_crossed = abs((a*sind(theta2) - c*sind(theta4_crossed))/sind(theta3_crossed));

%Find omega 4
omega4_open = (a*omega2*cosd(theta2-theta3_open))/(b_open+c*cosd(gamma));
omega4_crossed = (a*omega2*cosd(theta2-theta3_crossed))/(b_crossed+c*cosd(gamma));

%Find linear velocities of points A and B for open & crossed configurations
VA = (a*omega2)*[(-sind(theta2)),cosd(theta2)]; %Equation 6.23a
VA_mag = norm(VA); VA_ang = atan2d(VA(2),VA(1));

%Velocity of point B on link 4 using equation 6.31:
VB_open = [(-c*omega4_open*sind(theta4_open)),(c*omega4_open*cosd(theta4_open))];
VB_open_mag = norm(VB_open); VB_open_ang = atan2d(VB_open(2),VB_open(1));

VB_crossed = [(-c*omega4_crossed*sind(theta4_crossed)),(c*omega4_crossed*cosd(theta4_crossed))];
VB_crossed_mag = norm(VB_crossed); VB_crossed_ang = atan2d(VB_crossed(2),VB_crossed(1));

Vslip_open = ((-a*omega2*sind(theta2))+omega4_open*(b_open*sind(theta3_open)+c*sind(theta4_open)))/(cosd(theta3_open));
Vslip_crossed = ((-a*omega2*sind(theta2))+omega4_crossed*(b_crossed*sind(theta3_crossed)+c*sind(theta4_crossed)))/(cosd(theta3_crossed));

%Print open and crossed configurations
fprintf('Open configuration: Vslip = %6.3f and VB = [%6.3f, %6.3f] at angle %6.3f°\n', Vslip_open, VB_open, VB_open_ang);
fprintf('Crossed configuration: Vslip = %6.3f and VB = [%6.3f, %6.3f] at angle %6.3f°\n', Vslip_crossed, VB_crossed, VB_crossed_ang);

