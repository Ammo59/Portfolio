% Aramis Kelkelyan
% MAE 375: Homework #5, Chapter 5 
% Problem 10
% Date: 10/21/2021
%-----------------------------------------
clear;clc;
%This is a three position motion generation problem
%Disregard the fixed pivots
%Use 2nd on pg 239 (lookup pg.266) method in Section 5.4

%Given values
coord1 = input('Enter coordinates for [P1x, P1y]: ');
R1 = [coord1(1), coord1(2)];
coord2 = input('Enter coordinates for [P2x, P2y]: ');
R2 = [coord2(1), coord2(2)];
coord3 = input('Enter coordinates for [P3x, P3y]: ');
R3 = [coord3(1), coord3(2)];
angles = input('Enter angles [thetaP1, thetaP2, thetaP3] in degrees: ');
thetaP1 = angles(1); thetaP2 = angles(2); thetaP3 = angles(3);
WZ = input('Enter values for [Beta 2, Beta 3]: ');
Beta_2 = WZ(1); Beta_3 = WZ(2);
US = input('Enter values for [Gamma 2, Gamma 3]: ');
Gamma_2 = US(1); Gamma_3 = US(2);

%Find vector P21, alpha 2&3, delta 2&3
P21 = R2 - R1; P31 = R3 - R1;
Alpha_2 = thetaP2 - thetaP1; Delta_2 = atan2d(P21(2),P21(1));
Alpha_3 = thetaP3 - thetaP1; Delta_3 = atan2d(P31(2),P31(1));

%Solve for initial (WZ) dyad
A = cosd(Beta_2)-1; B = sind(Beta_2); C = cosd(Alpha_2)-1;
D = sind(Alpha_2); E = norm(P21)*cosd(Delta_2); F = cosd(Beta_3)-1;
G = sind(Beta_3); H = cosd(Alpha_3)-1; K = sind(Alpha_3);
L = norm(P31)*cosd(Delta_3); M = norm(P21)*sind(Delta_2); N = norm(P31)*sind(Delta_3);

%Solve WZ inverse matrix
AA = [A -B C -D; F -G H -K; B A D C; G F K H];
CC = [E; L; M; N];
BB = AA\CC;
W1x = BB(1); W1y = BB(2); Z1x = BB(3); Z1y = BB(4);
w = norm([W1x, W1y]); theta = atan2d(W1y, W1x);
z = norm([Z1x, Z1y]); Phi = atan2d(Z1y, Z1x);

%Solve for initial (US) dyad
A = cosd(Gamma_2)-1; B = sind(Gamma_2); C = cosd(Alpha_2)-1;
D = sind(Alpha_2); E = norm(P21)*cosd(Delta_2); F = cosd(Gamma_3)-1;
G = sind(Gamma_3); H = cosd(Alpha_3)-1; K = sind(Alpha_3);
L = norm(P31)*cosd(Delta_3); M = norm(P21)*sind(Delta_2); N = norm(P31)*sind(Delta_3);

%Solve US inverse matrix
AA = [A -B C -D; F -G H -K; B A D C; G F K H];
%BB = [U1x; U1y; S1x; S1y];
CC = [E; L; M; N];
BB = AA\CC;
U1x = BB(1); U1y = BB(2); S1x = BB(3); S1y = BB(4);
u = norm([U1x,U1y]); sigma = atan2d(U1y, U1x);
s = norm([S1x, S1y]); Psi = atan2d(S1y, S1x);

%Solve for Links 1 (Vector G) and 3 (Vector V) using vectors
V1x = Z1x - S1x; V1y = Z1y - S1y;
theta3 = atan2d(V1y,V1x); v = norm([V1x, V1y]);

G1x = W1x + V1x - U1x; G1y = W1y + V1y - U1y;
theta1 = atan2d(G1y,G1x); g = norm([G1x, G1y]);

%Find theta 2's initial and final values with respect to Link 1 (Vector G)
theta2_i = theta - theta1; theta2_f = theta2_i + Beta_3;

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
Grashof(g,w,v,u);

