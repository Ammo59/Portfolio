% Aramis Kelkelyan, Group Member 1, Anthony Perez, Group Member 2,
% Christian Smith Group Member 3
% MAE 205 Section 11/12
%
% Laboratory 10
%-----------------------------------------------------------------------
%% 1
clear,clc;
%Using fprintf()and MATLAB's polynomial functions write code that calculates and displays 
%the roots of the polynomial fx = x^4 - 10*x^2 + 21;

fx = [1 0 -10 0 21]; % Polynomial in matrix form

[x_int] = roots(fx); %Set x-intercept values to the roots of the polynomial 

fprintf('The roots of the provided equation are: [');
fprintf('%5.4f ',x_int); %Output to command window
fprintf('\b]\n');
%% 2 
clear,clc; clf;
%Using fprintf(), MATLABs polynomial functions,and fplot()
%write code that calculates and displays solution of the equation:
% 2e^(0.75*x) - sqrt(3*x) = 22
%Plot the function to determine the interval.

f_eqn = @(x)(2*exp(0.75.*x)-1.*sqrt(3.*x)- 22); % Equation in matrix form

fplot(f_eqn, [0, 8]); %Plot the equation and determine the bounds

fprintf('The solution to the equation is: %4.3f\n',fzero(f_eqn,[3,3.5])); %Output to command window

%% 3 
clear,clc;
%Using fprintf() and MATLABs  polynomial  functions to find three  integers  with  
%spacing  of  3  between them (e.g., 8, 11, 14) whose product is 11,960

% Define polynomials as y = x, y = x + 3, and y = x + 6
p1=[1 0]; p2 = [1 3]; p3 = [1 6]; 

%Multiply all polynomials together
p_12 = conv(p1,p2);
p = conv(p_12,p3);

%Substitute fourth value in matrix p 
n = length(p);
p(n) = p(n) - 11960;
r = roots(p);
r = r(~imag(r));
fprintf('The three integers are: %g, %g, and %g\n',r, r+3, r+6);

%% 4
clear,clc;clf;
%Define matrices year and population
year = [1815 1845 1875 1905 1935 1965 1995]; %x 
population = [8.3 19.7 44.4 83.2 127.1 190.9 266.6]; %y

p = polyfit(year,population,2); %Fit them to the best linear line (poly to 2 degrees)

%Estimate value of year 
yearp = @(t)(p(1)*t.^2 + p(2)*t + p(3));

fplot(yearp , [1815 1995], 'g-'); hold on; %plot the function p 

%Plot according to specifications 
plot(year,population,'bo'); grid on;
xlabel('Year');
ylabel('Population');
axis([1815 1995 0 270]);
title('\bf{Population vs Year}');
legend('Population','Quadratic Equation','Location','BEST');

fprintf('The quadratic equation is: %gt^2%+gt%+g\n',p(1),p(2),p(3)); %Output the quadratic equation
fprintf('The estimated population in the 1974 is: %4.1f million\n',yearp(1974)); %Output estimated population


%% 5
clear,clc; clf;
%A 112-inch long beam AB is attached to the wall with a pin at 
%point A and to a 98-inch long cable CD.
%A 425-lb load W is attached to the beam at point B

AB = 112; CD = 98; %in inches
Load = 425; %in pounds

tension = @(d)(Load*AB*CD)./(d.* sqrt(CD^2 - d.^2)); %Create function for tension using d as a variable

fplot(tension, [0 98]); %Plot the function with estimated range 0 - 98 inches

[adopt1, adopt2] = fminbnd(tension, 50, 80); %Using educated guess 

fprintf('The distance d at T minimum is: %4.2f inches\n', adopt1);
fprintf('The minimum tension, T, in the cable is: %4.1f lbs\n',adopt2);

