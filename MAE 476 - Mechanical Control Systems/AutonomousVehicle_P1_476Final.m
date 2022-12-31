%
% Aramis Kelkelyan
% MAE 476: Final P1
% Date: 12/16/2022
%-----------------------------------------
clear;clc;clf;
b1 = conv([1 0.1], [1 0.5]);
b2 = conv(b1, [1 2 300]);

a1 = conv(conv([1 0],[1 -0.4]),[1 0.7]);
a2 = conv(conv(a1, [1 30]),[1 30]);
a3 = conv(a2, [1 1.5 361]);

%Check root locus graphs
%Change numerator and denominator as neccessary
num = b2;
den = a3;
sysL = tf(num,den);
rlocus(sysL);

%To find the breakaway points...
c1 = conv(num,diff(den)) - conv(den,diff(num));
brk_in_away = roots(c1); %manually eliminate the points that do not fit the root locus
%also eliminate points not on real axis

%% Part B
figure(2);
num2 = conv(num, [4000 4000*250]);
sys2 = tf(num2, den);
disp(roots(num2));
rlocus(sys2);
