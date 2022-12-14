 %% (a) for loop |y = 10*x + 1
clear;clc;
 x = rand(1,5);
 y = zeros(size(x)); % Avoid warnings!
 
 for ii= 1:5
     y(ii) = 10*x(ii) + 1;
     fprintf('x(%d) = %8.4f; y(%d) = %8.4f\n',ii,x(ii),ii,y(ii));
 end
% ---------------------------------------------------------------
 % Solution (a)
clear;clc;
 x = rand(1,5);
 y = 10.*x + 1;
 fprintf('x(%i) = %8.4g; y(%i) = %8.4g\n',[1:5;x;1:5;y]);
 
 %% (b) for-loop|y = sin(pi*x/4) over  [0,2*pi]
 
 for jj= 1:9
     y(jj) = sin(pi*(jj-1)/4);
     fprintf('y(%d) = %16.8f\n',jj,y(jj));
 end
 %-----------------------------------------
 %Solution (b)
clear;clc;
jj = 1:9
y(jj) = sin(pi*(jj-1)/4);
fprintf('y(%d) = %16.8f\n',[jj;y]);
%% (c) for-loop |Cumulative summation
clear;clc;
s =0;
y = zeros(1,10);
for k = 1:10
    s = s + k;
    y(k) = s;
    fprintf('Sum of the numbers 1 to %2d : %5d\n',k, y(k));
end
%------------------------------
%Solution (c)
clear;clc;
k = [1:10];
y(k) = (k.^2 + k)/2;
fprintf('Sum of the numbers 1 to %2d : %5d\n',[k;y]);