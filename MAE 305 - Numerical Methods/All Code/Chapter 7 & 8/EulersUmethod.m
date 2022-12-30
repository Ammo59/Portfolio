clear;clc;
u0 = [0;50];
u(:,1) = u0; % The first column is set to be the initial vector u0
h = .1; n = 6;
f = @(u)([u(2);10]); %replace the second part with y" equation, or u3
for ii = 1:n-1
    p(:,ii) = f(u(:,ii));
    u(:,ii+1) = u(:,ii)+h*f(u(:,ii));
end
p
u