%
% Aramis Kelkelyan
% MAE 376: EC 19.3
% Date: 05/02/2022
%-----------------------------------------
%Frequency Response Function
%% A
clear;clc;clf;

zeta = linspace(0.6,10,7);
omega_n = 5;

for ii = 1:length(zeta)
    num = omega_n*omega_n;
    den = [1, 2*zeta(ii)*omega_n, omega_n*omega_n];
    sys = tf(num,den);
    bode(sys);
    hold on;
end

hold off;
legend('\zeta = 0.6', '\zeta = 2.167', '\zeta = 3.733', '\zeta = 5.3', '\zeta = 6.867', '\zeta = 8.433', '\zeta = 10');
%Smaller damping allows for higher resonant peaks

%% B
clear;clc;clf;

zeta = 0.6;
omega_n = linspace(5,20,7);
for ii = 1:length(omega_n)
    num = omega_n(ii)*omega_n(ii);
    den = [1, 2*zeta*omega_n(ii), omega_n(ii)*omega_n(ii)];
    sys = tf(num,den);
    bode(sys);
    hold on;
end

hold off;
legend('\omega_{n} = 5', '\omega_n = 7.5', '\omega_n = 10', '\omega_n = 12.5', '\omega_n = 15', '\omega_n = 17.5', '\omega_n = 20');
%Bandwidth decreases as natural frequency increases
