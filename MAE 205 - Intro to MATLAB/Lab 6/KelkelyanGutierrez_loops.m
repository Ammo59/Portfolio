%
% Aramis Kelkelyan, Group Member 1, Octavio Gutierrez, Group Member 2
% MAE 205 Section 11/12
%
% Laboratory 6, Problem 2
%------------------------------------------------------------------------

%%
clear;clc;
%Part a)

n = input('Enter integer number: ');
out = 1;

%Create conditional statements to check if that number is an integer
if (mod(n, 1) ~= 0)
    fprintf('%g is NOT an integer',n); %Output the number as not an integer
%Calculate and display the factorial
else
    for ii = 1:n
            out = out * ii;
    end
    fprintf('The Factorial of %i is %i\n',n, out);
end
    
%%
clear;clc;
%Part b)

n = input('Enter number of terms (integer): ');

%Create conditional statements to check if that number is an integer
if (mod(n, 1) ~= 0)
    fprintf('%g is NOT an integer',n); %Output the number as not an integer

%Create loop statement that calculates and displays the n odd terms
else
    out = zeros(1,n);
    for (ii = 1:n)
        out(ii) = 2*ii - 1;
    end
    fprintf('The odd integers are: ');
    fprintf('%i ',out);
    fprintf('\nSum of first %i odd integers is: %i\n',n, sum(out));
end

%%
clear;clc;
%Part c)

n = input('Enter number of terms (integer): ');

%Create conditional statements to check if that number is an integer
if (mod(n, 1) ~= 0)
    fprintf('%g is NOT an integer',n); %Output the number as not an integer

%Create loop statement that calculates and displays n terms of Fibonacci
%series
else 
    out = [0,1];
    for ii = 3:n
        out(ii) = out(ii-1) + out(ii-2);
    end
    fprintf('The Fibonacci series up to %i terms are: \n', n);
    fprintf('%i ',out);
    fprintf('\n');
end 
%%
clear;clc;
temp = -38:8:-20;
out = zeros(size(temp));
for jj = 1:length(temp)
    out(jj)=abs(temp(jj));
end