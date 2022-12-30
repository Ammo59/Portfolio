%
% Aramis Kelkelyan
% MAE 376: EC 19.2
% Date: 04/25/2022
%-----------------------------------------
clear;clc;clf;

for ii = 1:3

    n = ii;
    figure(n);
    K = [10, 50, 100];
    olp = tf([1 1], conv([1 -1 0], [1 6]));
    step(K(ii)*olp);
    clp = feedback(K(ii)*olp, 1);
    step(clp);

end