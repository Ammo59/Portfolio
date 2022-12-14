%
% Aramis Kelkelyan, Group Member 1, Octavio Gutierrez, Group Member 2
% MAE 205 Section 11/12
%
% Laboratory 5, Problem 2
%------------------------------------------------------------------------

% Part a
clear;clc
x = input('Enter number: ');

if (mod(x, 1) == 0)
    number = 'IS an integer';
else
    number = 'is NOT an integer';
end
fprintf('%g %s',x, number);
%------------------------------------
% Part b
clear;clc;
a = input('Enter number: ');

if (mod(a, 1) == 0)
    if (mod(a, 2) == 0)
        int = 'is an EVEN integer';
    else
        int = 'is an ODD integer';
    end
else
    int = 'is NOT an integer';
end
fprintf('%g %s',a, int);
%-------------------------------------
%Part c
clear;clc

month={'Jan','Feb','Mar','Apr','May','June','July','Aug','Sept','Oct','Nov','Dec'};
n = input('month number: ');
if mod(n,1) == 0 && (n>=1) && (n<=12)
    fprintf('Month: %s',month{n})
else
    fprintf('%g is NOT an integer or Month number', n);
end


