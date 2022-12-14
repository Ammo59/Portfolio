%Midterm 1 Review
%
%
clear; clc;

%Given values
v0 = 327; % units in m/s
alpha = 51; %units in degrees
t = [2.5 10.6 18.7 23.8 25.9]; %units in seconds
g = 9.81; %units in m/s^2

%Position functions of time
x = (v0)*cosd(alpha)*t; %units in meters
y = (v0)*sind(alpha)*t - 0.5*g*t.^2 ; %units in meters

%Polar coordinates of the projectile
r = sqrt(x.^2 + y.^2); %units in meters
theta = atan2(y,x); %units in degrees

%-------------------------------------------
%Given matrices
R = [15 -12 9 -6; -3 0 -1 4; 7 -10 13 -16];
S = [-1; 3; -5; 3; -1];
T = [4 -2 0 -2 4];

%Create a 4x2 matrix A where the first column in A is the first four
%elements of T and the second column is the second row of R
A = [T(1:4);R(2,1:end)];

%Create a 3x3 matrix B where the first row of B is the first three elements
%of T, the second row of B is the fourth column of R, and the 3rd row of B
%is the last three elements of S
B = [T(1:3);R(1:end,4)';S(3:end)'];

%Create a 2x3 matrix C where the first row of C is comprised of the odd
%elements of T and the second row of C contains the 1st 3 elements of S
C = [T(1:2:end);S(1:3)'];

%Compute without MATLAB
E = R(1:2:end,1);
F = T(3:end) * R(:,2);
G = R(2:2:end, 4) * T(1:2:end);
H = R(2:end, 2:3) * R(1:2:end, 1:2);
%--------------------------------------------

clear;clc;
%Coefficient values
a = 19.875; % J/(K*mol)
b = 0.05021; % J/(K^2*mol)
c = 1.27 * 10^(-5); % J/(K^3*mol)
d = -1.10 * 10^(-8); % J/(K^4*mol)

%Prompt user to input minimum temperature in Kelvin from 300 to 1800K
T_min = input('Minimum temperature in Kelvin is');

%Prompt user to input maximum temperature in Kelvin from 300 to 1800K above
%minimum value
T_max = input('Maximum temperature in Kelvin is');

T = [T_min:25:T_max]; %Temperature range in Kelvin

C_p = a + b*T + c*T.^2 + d*T.^3 ; %Heat capacitance equation

disp(C_p)
%---------------------------------------
clear, clc;

%Prompt User to Input Initial Positions
x0 = input('The initial position of x before rotation: ');
y0 = input('The initial position of y before rotation: ');
z0 = input('The initial position of z before rotation: ');

%Initial Vector Using Coordinates before rotation is
v0 = [x0;y0;z0];

%Thetha equals the angle used to rotate about the n axis in degrees
theta = input('The angle used to rotate about the n axis in degrees: '); 

%The rotation matrix about the y-axis is (using functins to convert radians
%to degrees
Ry_theta = [cosd(theta) 0 sind(theta); 0 1 0; -sind(theta) 0 cosd(theta)];

%The rotation is executed through the formula
vR = (Ry_theta)*v0 ;

%Display the coordinates of the rotated vector
disp('Coordinates of rotated vector: ');
disp(vR);
%------------------------------------------------------------------

linspace(-3, 19, 39);
[-3:0.57894736842105263157894736842105:19];

fprintf('\nThe Value of tan(25) is %4.3f \n',tand(25));

student = {'Aramis Kelkelyan';'Mechanical Engineering'; 'BSME';'2023'};
degree_earned = student{3};

%------------------------------------------------

%Coefficients of Hydrogen gas are:
a=29.088; %A units are given in in Joules per Kelvin*mol J/(K*mol))
b=(-1.92)*10^(-3); %B units are given in J/((K^2)*mol))
c=((4.00)*(10)^(-6)); %C units are given in J/((K^3)*mol))
d=((-8.70)*(10)^(-10)); %D units are given in J/((K^4)*mol))

%Temperature in Kelvin
T = linspace(908.22,1265.92,7); %7 total temperatures including endpoints
Cp = a + b*T + c*T.^2 + d*T.^3; %Hydrogen Capacitance Equation 

%Create a table of temperatures
tbl1 = [T, Cp];

%Display results using fprintf
fprintf('Heat Capacitance (Cp) Values for H2\n');
fprintf('\nT[K]\t\tCp [J K^-1 mol^-1]\n');
fprintf('\n%6.2f\t\t%8.6f\n',tbl1);

%---------------------------------------------------
clear; clc;

%Place Downloaded Excel File into MATLAB Directory
%Read the excel file
[A,t] = xlsread('GasCoefficients.xlsx',1,'A1:I5');

%Temperature ranges from 600K to 1300K with 100K increments
T = [600:100:1300];

%Calculate the heat capacitances for gases, given T is the temperature in Kelvin (K)
C_pO2 = A(1,2) + A(2,2)*T + A(3,2)*(T.^2)+ A(4,2)*(T.^3); 
C_pCO = A(1,4) + A(2,4)*T + A(3,4)*(T.^2)+ A(4,4)*(T.^3); 
C_pH2O = A(1,6) + A(2,6)*T + A(3,6)*(T.^2)+ A(4,6)*(T.^3); 
C_pNH3 = A(1,7) + A(2,7)*T + A(3,7)*(T.^2)+ A(4,7)*(T.^3); 

%Output in a Table
TableFinal = [T;C_pO2;C_pCO;C_pH2O;C_pNH3];

%Output he data to a text file
file_id = fopen('Lab3CP.txt', 'w');

%Display heat capaciance values for the gases 
fprintf(file_id,'\nHeat Capacitance (Cp) Values T[K]\tCp[J K^-1 mol^-1] for 02,CO,H2O, and NH3\n');

%Display Gas Variables
fprintf(file_id,'T[K]\t\tO2\t\t\tCO\t\t\tH20\t\t\tNH3\n');

%Display temperature values as integers and Cp values up to 3 decimal places
fprintf(file_id,'%5i\t\t%.3f\t\t%.3f\t\t%.3f\t\t%.3f\n',TableFinal);

fclose(file_id);
%---------------------------------------------------
clear; clc;

%Given values
v0 = 135; % units in m/s
alpha = 43; %units in degrees
t = [0:0.001:10]; %units in seconds
g = 9.81; %units in m/s^2

%Position functions of time
x = (v0)*cosd(alpha)*t; %units in meters
y = (v0)*sind(alpha)*t - 0.5*g*t.^2 ; %units in meters

%Polar coordinates of the projectile
r = sqrt(x.^2 + y.^2); %units in meters
theta = atan2(y,x); %units in degrees

%Open figure and plot smooth trajectory of projectile
figure(9);
plot(x,y,'LineStyle','-','Color','g','LineWidth',2);

grid on;

%Label Axes
xlabel('Distance (in meters)');
ylabel('Height (in meters)');
title('\bf{Height Vs. Distance in Cartesian Coordinates}');

figure(12);
polarplot(theta,r,'y-.','LineWidth',3);
title('{Trajectory in Polar Coordinates}');
----------------------------------------------------------------

%Taylor Series Expansion #2
clear;clc;clf;

%Define variables
x = [-pi:0.001:pi]; 
y = sin(x);

%Open figure 4
figure(4);
plot(x,y,'-k','LineWidth',1) %Plot function sin(x) with given characteristics
hold on;

%Define and plot sin(x) Taylor Series to 3 terms
fx1 = x - (x.^3)/factorial(3) + (x.^5)/factorial(5);
plot(x,fx1,'--m','LineWidth',2);
hold on;

%Define and plot sin(x) Taylor Series to 4 terms
fx2 = x - (x.^3)/factorial(3) + (x.^5)/factorial(5) - (x.^7)/factorial(7);
plot(x,fx2,'r:','LineWidth',2);
hold on;

%Format graph
title('\bf{sin(x) and Taylor Series sin(x) from -\pi\leqx\leq\pi}');
legend('y','Series of 3 terms','Series of 4 terms','Location','SE');
xlabel('x');
ylabel('f(x)');
axis([-pi pi -1 1]);

grid on;
%------------------------------------------------------------

%Plot as Figure 6
figure(6);

%Define Variables
x = [0:0.001:2*pi];
y = sin(x);
fx5 = x - (x.^3)/factorial(3) + (x.^5)/factorial(5) - (x.^7)/factorial(7) + (x.^9)/factorial(9);
fx6 = x - (x.^3)/factorial(3) + (x.^5)/factorial(5) - (x.^7)/factorial(7) + (x.^9)/factorial(9) - (x.^11)/factorial(11);

%Subplot sin(x) and format the graph
subplot(3,1,1);
plot(x,y,'-k','LineWidth',3);
title('\bf{sin(x) and the Taylor Series sin(x) from 0\leqx\leq2\pi}')
ylabel('sin(x)');
axis([0 2*pi -4 4]);

%Subplot Taylor series of 5 terms and format the graph
subplot(3,1,2);
plot(x,fx5,'c-.','LineWidth',3);
ylabel('5 series terms');
axis([0 2*pi -4 4]);

%Subplot Taylor series of 6 terms and format the graph
subplot(3,1,3);
plot(x,fx6,'b:','LineWidth',3);
xlabel('x');
ylabel('6 series terms');
axis([0 2*pi -4 4]);
grid on;




