%
%
%
%
clear; clc
x = input('Enter a real number for x: ');
y = input('Enter a real number for y: ');

if (x < 0)
    if (y < 0)
        f = x.^2 + y.^2;
    else
        f = x + y
    end
else
    if (y < 0)
        f = x + y.^3;
    else
        f = x.^3 + y;
    end

%-----------------------------
clear; clc
x = input('Enter a real number for x: ');
y = input('Enter a real number for y: ');

if (x < 0) && (y < 0)
    f = x.^2 + y.^2;
elseif (x < 0) && (y >= 0)
    f = x + y;
elseif (x >= 0) && (y < 0)
    f = x + y.^3;
else
    f = x.^3 + y;
end