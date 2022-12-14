%
% Aramis Kelkelyan
% MAE 305 Section 04
%
% Project
%------------------------------------------------------------------------
% Bisection uses the bisection method to find a root of f(x) = 0
% in the interval [a,b]
clear;clc;
%kmax is the maximum number of iterations (default 20),
kmax = input('Enter number of desired iterations: '); 

% f is an anonymous function representing f(x),
f = input('Enter function handle: (ex: @(x)x^2-5*x+4) ');

% a and b are the endpoints of interval [a,b],
a = input('Enter initial x-value of interval: ');
b = input('Enter endpoint of interval: ');

% tol is the scalar tolerance for convergence
tol = input('Enter desired tolerance: ');

disp('  k         a          b         c      (b-a)/2')

%Conditional statement check for the root of the function
if f(a)*f(b) > 0
    c = 'failure';
    return
end 

for k = 1:kmax
    c = (a+b)/2; % Find the first midpoint
    if f(c) == 0 % Stop if a root has been found
        return
    end
    fprintf('%3i %11.6f%11.6f%11.6f%11.6f\n',k,a,b,c,(b-a)/2)
    if (b-a)/2 < tol % Stop if tolerance is met
        break
    end
    if f(b)*f(c) > 0 % Check sign changes
        b = c; % Adjust the endpoint of interval
    else
        a = c;
    end
end

fprintf('The calculated root from %i iterations is: %8.7f\n', k, c);

%Confirm Root
rt = fzero(f, [a b]);
fprintf('The actual root from fzero is: %8.7f\n', rt);