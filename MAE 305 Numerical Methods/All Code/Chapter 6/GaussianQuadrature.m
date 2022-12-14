%MAE 300 Lab Project
%Aramis Kelkelyan
%Due: 4/22/21
%Gaussian Quadrature
%-------------------------------------------------------
clear; clc;
%Limits of integral (a = lower, b = upper)
a = 2; b = 8;

%Ask for user inputted number of nodes
n = input('Enter number of nodes: ');
sigma = @(x)((b-a)/2.*(x+1)+a); dsigma = (b-a)/2;
f = @(sigma)((5*sigma.^2 - (8*sigma))*dsigma);
I = zeros(1,n);

if n==2
    c = [1,1];
    x = [-0.577350269,0.577350269];
    for ii=1:n
        I(ii)=c(ii)*f(sigma(x(ii)));
    end
    
elseif n==4
    c = [0.347854845,0.652145155,0.652145155,0.347854845];
    x = [-0.861136312,-0.339981044,0.339981044,0.861136312];
    for ii=1:n
        I(ii)=c(ii)*f(sigma(x(ii)));
    end
    
elseif n==6
    c = [0.171324492,0.360761573,0.467913935,0.467913935,0.360761573,0.171324492];
    x = [-0.932469514,-0.661209386,-0.238619186,0.238619186,0.661209386,0.932469514];
    for ii=1:n
        I(ii)=c(ii)*f(sigma(x(ii)));
    end
    
else
    disp('Enter n as 2,4, or 6');
end

fprintf('The area under the curve is: %5.4f\n',sum(I));