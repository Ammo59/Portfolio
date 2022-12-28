% Aramis Kelkelyan
% MAE 375: Homework #5, Chapter 5 
% Problem 11
% Date: 10/25/2021
%-----------------------------------------
clear;clc;
%This is a three position motion generation problem
%Include fixed pivots
%Use Example 5-3 on pg 257-261 (lookup pg.284-288) 

%Given values
coordO2 = input('Enter coordinates for [O2x, O2y]: ');
RO2 = [coordO2(1), coordO2(2)];
coordO4 = input('Enter coordinates for [O4x, O4y]: ');
RO4 = [coordO4(1), coordO4(2)];
coordP1 = input('Enter coordinates for [P1x, P1y]: ');
RP1 = [coordP1(1), coordP1(2)];
coordP2 = input('Enter coordinates for [P2x, P2y]: ');
RP2 = [coordP2(1), coordP2(2)];
coordP3 = input('Enter coordinates for [P3x, P3y]: ');
RP3 = [coordP3(1), coordP3(2)];
angles = input('Enter angles [thetaP1, thetaP2, thetaP3] in degrees: ');
thetaP1 = angles(1); thetaP2 = angles(2); thetaP3 = angles(3);

%Determine Position Vectors with Respect to Fixed Pivot O2
R2O2 = [RP2(1)-RO2(1), RP2(2)-RO2(2)];
R3O2 = [RP3(1)-RO2(1), RP3(2)-RO2(2)];

%Find alpha 2&3, zeta 1&2&3
Zeta_1 = atan2d(-RO2(2),-RO2(1));
Alpha_2 = thetaP2 - thetaP1; Zeta_2 = atan2d(R2O2(2),R2O2(1));
Alpha_3 = thetaP3 - thetaP1; Zeta_3 = atan2d(R3O2(2),R3O2(1));

%Use vector loop constants to solve for Beta 2&3
C1 = norm(R3O2)*cosd(Alpha_2+Zeta_3) - norm(R2O2)*cosd(Alpha_3+Zeta_2);
C2 = norm(R3O2)*sind(Alpha_2+Zeta_3) - norm(R2O2)*sind(Alpha_3+Zeta_2);
C3 = norm(RO2)*cosd(Alpha_3+Zeta_1) - norm(R3O2)*cosd(Zeta_3);
C4 = -norm(RO2)*sind(Alpha_3+Zeta_1) + norm(R3O2)*sind(Zeta_3);
C5 = norm(RO2)*cosd(Alpha_2+Zeta_1) - norm(R2O2)*cosd(Zeta_2);
C6 = -norm(RO2)*sind(Alpha_2+Zeta_1) + norm(R2O2)*sind(Zeta_2);

A1 = -C3^2-C4^2; A2 = C3*C6-C4*C5; A3 = -C4*C6-C3*C5;
A4 = C2*C3+C1*C4; A5 = C4*C5-C3*C6; A6 = C1*C3-C2*C4;

K1 = A2*A4+A3*A6; K2 = A3*A4+A5*A6;
K3 = (A1^2-A2^2-A3^2-A4^2-A6^2)/2;

Beta_3_open = 2*atand((K2+sqrt(K1^2+K2^2-K3^2))/(K1+K3));
Beta_3_crossed = 2*atand((K2-sqrt(K1^2+K2^2-K3^2))/(K1+K3));

if round(abs(Beta_3_open)) == round(abs(Alpha_3))
    Beta_3 = Beta_3_crossed;
elseif round(abs(Beta_3_crossed)) == round(abs(Alpha_3))
    Beta_3 = Beta_3_open;
else
    Beta_3 = [Beta_3_open, Beta_3_crossed];
    disp('Beta 3 has two values, modify code');
end

Beta_2_open = acosd((A5*sind(Beta_3)+A3*cosd(Beta_3)+A6)/A1);
Beta_2_crossed = asind((A3*sind(Beta_3)+A2*cosd(Beta_3)+A4)/A1);

if round(abs(Beta_2_open)) == round(abs(Beta_2_crossed))
    Beta_2 = Beta_2_open;
else
    Beta_2 = [Beta_2_open, Beta_2_crossed];
    disp('Beta 2 has two values, modify code');
end

%Check value, do not cancel negatives. 
%They are necessary to determine the quadrant of Beta 2
% Beta_2_test = atand(-(A3*sind(Beta_3)+A2*cosd(Beta_3)+A4)/-(A5*sind(Beta_3)+A3*cosd(Beta_3)+A6));
% if Beta_2_test == Beta_2_open
%     Beta_2 = Beta_2_open;
% elseif Beta_2_test == Beta_2_crossed
%     Beta_2 = Beta_2_crossed;    
% else
%     error('Beta 2 contains an incorrect calculation');
% end

%Repeat steps for O4
R2O4 = [RP2(1)-RO4(1), RP2(2)-RO4(2)];
R3O4 = [RP3(1)-RO4(1), RP3(2)-RO4(2)];

%Find alpha 2&3, zeta 1&2&3
Zeta_1 = atan2d(-RO4(2),-RO4(1));
Zeta_2 = atan2d(R2O4(2),R2O4(1));
Zeta_3 = atan2d(R3O4(2),R3O4(1));

%Use vector loop constants to solve for Gamma 2&3
C1 = norm(R3O4)*cosd(Alpha_2+Zeta_3) - norm(R2O4)*cosd(Alpha_3+Zeta_2);
C2 = norm(R3O4)*sind(Alpha_2+Zeta_3) - norm(R2O4)*sind(Alpha_3+Zeta_2);
C3 = norm(RO4)*cosd(Alpha_3+Zeta_1) - norm(R3O4)*cosd(Zeta_3);
C4 = -norm(RO4)*sind(Alpha_3+Zeta_1) + norm(R3O4)*sind(Zeta_3);
C5 = norm(RO4)*cosd(Alpha_2+Zeta_1) - norm(R2O4)*cosd(Zeta_2);
C6 = -norm(RO4)*sind(Alpha_2+Zeta_1) + norm(R2O4)*sind(Zeta_2);

A1 = -C3^2-C4^2; A2 = C3*C6-C4*C5; A3 = -C4*C6-C3*C5;
A4 = C2*C3+C1*C4; A5 = C4*C5-C3*C6; A6 = C1*C3-C2*C4;

K1 = A2*A4+A3*A6; K2 = A3*A4+A5*A6;
K3 = (A1^2-A2^2-A3^2-A4^2-A6^2)/2;

Gamma_3_open = 2*atand((K2+sqrt(K1^2+K2^2-K3^2))/(K1+K3));
Gamma_3_crossed = 2*atand((K2-sqrt(K1^2+K2^2-K3^2))/(K1+K3));

if round(abs(Gamma_3_open)) == round(abs(Alpha_3))
    Gamma_3 = Gamma_3_crossed;
elseif round(abs(Gamma_3_crossed)) == round(abs(Alpha_3))
    Gamma_3 = Gamma_3_open;
else
    Gamma_3 = [Gamma_3_open, Gamma_3_crossed];
    disp('Gamma 3 has two values, modify code');
end

Gamma_2_open = acosd((A5*sind(Gamma_3)+A3*cosd(Gamma_3)+A6)/A1);
Gamma_2_crossed = asind((A3*sind(Gamma_3)+A2*cosd(Gamma_3)+A4)/A1);

%Check value, do not cancel negatives. 
%They are necessary to determine the quadrant of Gamma 2
% Gamma_2_test = atand(-(A3*sind(Gamma_3)+A2*cosd(Gamma_3)+A4)/-(A5*sind(Gamma_3)+A3*cosd(Gamma_3)+A6));
% 
% if Gamma_2_test == Gamma_2_open
%     Gamma_2 = Gamma_2_test;
% elseif Gamma_2_test == Gamma_2_crossed
%     Gamma_2 = Gamma_2_test;    
% else
%     error('Gamma 2 contains an incorrect calculation');
% end

%Gamma 2 is not in the first quadrant
if (Gamma_2_open < 0) && (Gamma_2_crossed > 0)
    Gamma_2 = Gamma_2_open;
elseif (Gamma_2_open > 0) && (Gamma_2_crossed < 0)
    Gamma_2 = Gamma_2_crossed;
else
    Gamma_2 = [Beta_2_open, Beta_2_crossed];
    disp('Gamma 2 has two values, modify code');
end

%Use method of Section 5.7 to synthesize the linkage
P21 = RP2 - RP1; P31 = RP3 - RP1;
Delta_2 = atan2d(P21(2),P21(1));
Delta_3 = atan2d(P31(2),P31(1));

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
w = norm([W1x, W1y]);
z = norm([Z1x, Z1y]);

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
u = norm([U1x,U1y]);
s = norm([S1x, S1y]);

%Solve for Links 1 (Vector G) and 3 (Vector V) using vectors
V1x = Z1x - S1x; V1y = Z1y - S1y;
v = norm([V1x, V1y]);

G1x = W1x + V1x - U1x; G1y = W1y + V1y - U1y;
g = norm([G1x, G1y]);

%Check location of fixed pivots with respect to global frame
O2x = -Z1x-W1x; O2y = -Z1y-W1y;
O4x = -S1x-U1x; O4y = -S1y-U1y;

if round(O2x) ~= round(RO2(1)) || round(O2y) ~= round(RO2(2))
    disp('Fixed Point O2 has incorrect coordinates');
end
    
if round(O4x) ~= round(RO4(1)) || round(O4y) ~= round(RO4(2))
    disp('Fixed Point O4 has incorrect coordinates');
end

%Find coupler point P, fixed pivots, and rotation angle w.r.t line O2O4
Rp = z; psi = atan2d(S1y,S1x); phi = atan2d(Z1y,Z1x); 
theta3 = atan2d(z*sind(phi)-s*sind(psi),z*cosd(phi)-s*cosd(psi));
delta_p = phi-theta3;

%Output Design Summary table
fprintf('\nDesign Results\n');
fprintf('Link 1:\t\t   %5.3f\n',g');
fprintf('Link 2:\t\t   %5.3f\n',w');
fprintf('Link 3:\t\t   %5.3f\n',v')
fprintf('Link 4:\t\t   %5.3f\n',u');
fprintf('Coupler:\t   %5.3f \t %6.3f°\n',Rp,delta_p');


