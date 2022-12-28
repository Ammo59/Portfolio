% Aramis Kelkelyan
% MAE 375: Homework #5, Chapter 5 
% Problem 8
% Date: 10/21/2021
%-----------------------------------------
clear;clc;
%This is a two position motion generation problem because
%the output is specified as a complex motion of coupler (link 3)
%Use 2nd example on pg 239 (lookup pg.266) method in Section 5.4

%Given values, with respect to P1 as origin
coord1 = input('Enter coordinates for [P1x, P1y], assuming P1 as origin: ');
R1 = [coord1(1), coord1(2)];
coord2 = input('Enter coordinates for [P2x, P2y], assuming P1 as origin: ');
R2 = [coord2(1), coord2(2)];
angles = input('Enter angles [thetaP1, thetaP2] in degrees: ');
thetaP1 = angles(1); thetaP2 = angles(2);
WZ = input('Enter values for [z, Phi, Beta 2]: ');
z = WZ(1); Phi = WZ(2); Beta_2 = WZ(3);
US = input('Enter values for [s, Psi, Gamma 2]: ');
s = US(1); Psi = US(2); Gamma_2 = US(3);

%Find vector P21, alpha 2 and delta 2
P21 = R2 - R1;
Alpha_2 = thetaP2 - thetaP1; Delta_2 = atan2d(P21(2),P21(1));

%Solve for initial (WZ) dyad
Z1x = z*cosd(Phi); Z1y = z*sind(Phi);
A = cosd(Beta_2)-1; B = sind(Beta_2); C = cosd(Alpha_2)-1;
D = sind(Alpha_2); E = norm(P21)*cosd(Delta_2); F = norm(P21)*sind(Delta_2);
W1x = (A*(-C*Z1x + D*Z1y + E) + B*(-C*Z1y - D*Z1x + F))/(-2*A);
W1y = (A*(-C*Z1y - D*Z1x + F) + B*(C*Z1x - D*Z1y - E))/(-2*A);
w = norm([W1x, W1y]);
theta = atan2d(W1y, W1x);

%Solve for initial (US) dyad
S1x = s*cosd(Psi); S1y = s*sind(Psi);
A = cosd(Gamma_2)-1; B = sind(Gamma_2); C = cosd(Alpha_2)-1;
D = sind(Alpha_2); E = norm(P21)*cosd(Delta_2); F = norm(P21)*sind(Delta_2);
U1x = (A*(-C*S1x + D*S1y + E) + B*(-C*S1y - D*S1x + F))/(-2*A);
U1y = (A*(-C*S1y - D*S1x + F) + B*(C*S1x - D*S1y - E))/(-2*A);
u = norm([U1x,U1y]);
s = norm([S1x, S1y]);
sigma = atan2d(U1y, U1x);

%Solve for Links 1 (Vector G) and 3 (Vector V) using vectors
V1x = z*cosd(Phi) - s*cosd(Psi);
V1y = z*sind(Phi) - s*sind(Psi);
theta3 = atan2d(V1y,V1x);
v = norm([V1x, V1y]);

G1x = w*cosd(theta)+v*cosd(theta3)-u*cosd(sigma);
G1y = w*sind(theta)+v*sind(theta3)-u*sind(sigma);
theta1 = atan2d(G1y,G1x);
g = norm([G1x, G1y]);

%Find theta 2's initial and final values with respect to Link 1 (Vector G)
theta2_i = theta - theta1;
theta2_f = theta2_i + Beta_2;

%Find coupler point P, fixed pivots, and rotation angle w.r.t line O2O4
delta_p = Phi - theta3; Rp = z;
rho_1 = 0;
O2x = norm(R1)*cosd(rho_1)-z*cosd(Phi)-w*cosd(theta);
O2y = norm(R1)*sind(rho_1)-z*sind(Phi)-w*sind(theta);
O4x = norm(R1)*cosd(rho_1)-s*cosd(Psi)-u*cosd(sigma);
O4y = norm(R1)*sind(rho_1)-s*sind(Psi)-u*sind(sigma);
theta_rotation = atan2d((O4y-O2y),(O4x-O2x));

%Output Design Summary table
fprintf('\nDesign Results\n');
fprintf('Link 1:\t\t   %5.3f \t %6.3f°\n',g,theta1');
fprintf('Link 2:\t\t   %5.3f \t %6.3f°\n',w,theta');
fprintf('Link 3:\t\t   %5.3f \t %6.3f°\n',v,theta3')
fprintf('Link 4:\t\t   %5.3f \t %6.3f°\n',u,sigma');
fprintf('Coupler:\t   %5.3f \t %6.3f°\n',Rp,delta_p');
fprintf('Crank Angles: %5.3f \t %6.3f°\n',theta2_i,theta2_f');


