%Catherine Martinez
%Homework 7 Problem 7.7 a&b

clc;clear;

%Define given lengths 
a = input('enter a value for Link 2: ');
c = input('enter a value for Link 4: ');
d = input('enter a value for Link 1: ');
gamma = input('enter a value for gamma: ');
theta2 = input('enter a value for theta 2: ');
omega2 = input('enter a value for omega 2: ');
alpha2 = input('enter a value for alpha 2: ');

%Find the parameters using equations 4.25 and 4.26
P = a*sind(theta2)*sind(gamma)+((a*cosd(theta2)-d)*cosd(gamma));
Q = a*sind(theta2)*cosd(gamma)+(a*cosd(theta2)-d)*sind(gamma);
R = -c*sind(gamma);
T = 2*P;
S = R-Q;
U = Q+R;

theta4_open = 2.*atan2d((-T+sqrt(T.*T-4*S.*U)),2*S);
theta3_open = theta4_open+gamma;

b1 = (a*sind(theta2)-c*sind(theta4_open))/(sind(theta4_open+gamma));

%Calculate angular velocity of link 4 using equation 6.30
omega4_open = (a*omega2*cosd(theta2-theta3_open))/(b1+c*cosd(gamma));

bdot = (-a*omega2*sind(theta2)+omega4_open*(b1*sind(theta3_open)+c*sind(theta4_open)))/cosd(theta3_open);
omega3 = omega4_open;

%Solve for accelerations using equations 7.26 and 7.27
P1 = a*alpha2*cosd(theta3_open-theta2);
Q1 = a*omega2^2*sind(theta3_open-theta2);
R1 = c*omega4_open^2*sind(theta4_open-theta3_open);
S1 = 2*bdot*omega3;
T1 = b1+c*cosd(theta3_open-theta4_open);
alpha4 = (P1+Q1+R1-S1)/T1;
K1 = a*omega2^2*(b1*cosd(theta3_open-theta2_open)+c*cosd(theta4_open-theta2));
L1 = a*alpha2*(b1*sind(theta2-theta3_open)-c*sind(theta4_open-theta2));
M1 = -omega4_open^2*(b1^2+c^2+2*b*c*cosd(theta4_open-theta2));
N1 = 2*bdot*c*omega4_open*sind(theta4_open-theta3_open);
bddot = (-K1+L1+M1+N1)/T1;

AA = a*alpha2*(-sind(theta2)+1i*cosd(theta2))-a*omega2^2*(cosd(theta2)+1i*sind(theta2));
AA1 = abs(AA);
thetaAA = angle(AA);
AB = -c*alpha4_open*(sind(theta4_open)+1i*cosd(theta4_open))-c*omega4_open^2*(cosd(theta4_open)+1i*sind(theta4_open));
AB1 = abs(AB);
thetaAB = angle(AB);