%
% Aramis Kelkelyan
% MAE 476: Final P2
% Date: 12/16/2022
%-----------------------------------------
clear;clc;clf;

% d1 = conv([2.5 1], [10 1]);
% d2 = conv([2 1],[15 1]);

%n = 1; d = conv(d1,d2); %[12750, 6375, 510, 25, 12.5, 1]
n = 0.000147; d = [1, 1.067, 0.3567, 0.0393, 0.00148];
sys = tf(n,d);
grid on;
margin(sys); % or bode(sys)
[Gm, Pm, Wcg, Wcp] = margin(sys);