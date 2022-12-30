%
% Aramis Kelkelyan
% MAE 376: EC 20.2
% Date: 04/11/2022
%-----------------------------------------
clear;clc;clf;
% Final Prep

K = input('Enter K values here in vector form []: ');
%Example:  K = [0, 1, 3.8582, 4];
x = length(K);

for ii = 1:x

    n = ii;
    %Create open loop graph
    figure(n);
    num = [1 5];
    den = conv(conv(conv([1 0], [1 4]), [1 2 2]) , [1 2]);
    olp = tf(num, den);
    step(K(ii)*olp);
    title(['Open-Loop Step Response for K= ', num2str(K(ii))])
    
    %Create closed loop graph
    figure(n+x); %may need to be changed depending on # of K's in matrix
    clp = feedback(K(ii)*olp, 1);
    step(clp);
    title(['Close-Loop Step Response for K= ', num2str(K(ii))]);

end


%% Janani's code
clear;clc;
k = 30;
figure(1);
olp = tf([1 1], conv(conv([1, 3],[1, 2, 2]),[1,2]));
step(k*olp);
title(['Open-Loop Step Response for K= ',num2str(k)])
figure(2);
clp = feedback(k*olp,1);
step(clp);
title(['Close-Loop Step Response for K= ',num2str(k)])