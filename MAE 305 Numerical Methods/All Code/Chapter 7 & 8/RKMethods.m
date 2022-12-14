clear;clc;
%ctrl r to comment sections, crtl t to uncomment them
f = @(x,y) -2*x-y;
x0 = 0; y0 = -1;
x(1) = x0; y(1) = y0; h = .1; n = 4; % n = y+1
%% 
%RK2 Methods
%Eulers
% for i = 1:n-1
%  k1 = f(x(i),y(i));
%  k2 = f(x(i)+h/2,y(i)+(h*k1)/2);
%  y(i+1) = y(i)+h*k2;
%  x(i+1) = x(i)+h;
%  fprintf('k1=%.5f\n',k1) 
%  fprintf('k2=%.5f\n',k2)
%  fprintf('x(i+1)=%.5f\n',x(i+1))
%  fprintf('y(i+1)=%.5f\n\n',y(i+1)); 
% end

%Heuns Method
% for i = 1:n-1
%  k1 = f(x(i),y(i));
%  p(i) = x(i)+h;
%  o(i) = y(i)+h*k1;
%  k2 = f(x(i)+h,y(i)+h*k1);
%  y(i+1) = y(i)+h*(k1+k2)/2;
%  x(i+1) = x(i)+h;
%  fprintf('k1=%.5f\n',k1);
%  fprintf('k2=(x(i)+h/2,y(i)+(h*k1)/2)=f(%.5f,%.5f)\n',p(i),o(i);
%  fprintf('k2=%.5f\n',k2);
%  fprintf('x(i+1)=%.5f\n',x(i+1));
%  fprintf('y(i+1)=%.5f\n\n',y(i+1)); 
% end

%Classic RK2
% for i = 1:n-1
%  k1 = f(x(i),y(i));
%  k2 = f(x(i)+(3*h/4),y(i)+(3*(h*k1)/4));
%  y(i+1) = y(i)+h*(k1+2*k2)/3;
%  x(i+1) = x(i)+h;
%  fprintf('k1=%.5f\n',k1) 
%  fprintf('k2=%.5f\n',k2)
%  fprintf('x(i+1)=%.5f\n',x(i+1))
%  fprintf('y(i+1)=%.5f\n\n',y(i+1)); 
% end
%% 
%RK3 Methods

%Heuns Method
% for i = 1:n-1
%  k1 = f(x(i),y(i));
%  k2 = f(x(i)+h/3,y(i)+(h*k1/3));
%  k3 = f(x(i)+(2*h)/3,y(i)+(2*h*k2)/3);
%  y(i+1) = y(i)+h*(k1+3*k3)/4;
%  x(i+1) = x(i)+h;
%  fprintf('k1=%.5f\n',k1) 
%  fprintf('k2=%.5f\n',k2)
%  fprintf('k3=%.5f\n',k3)
%  fprintf('x(i+1)=%.5f\n',x(i+1))
%  fprintf('y(i+1)=%.5f\n\n',y(i+1)); 
% end

%Classical RK3 Method
% for i = 1:n-1
%  k1 = f(x(i),y(i));
%  k2 = f(x(i)+h/2,y(i)+(h*k1/2));
%  k3 = f(x(i)+h,y(i)-k1*h+2*h*k2);
%  y(i+1) = y(i)+h*(k1+4*k2+k3)/6;
%  x(i+1) = x(i)+h;
%  fprintf('k1=%.5f\n',k1) 
%  fprintf('k2=%.5f\n',k2)
%  fprintf('k3=%.5f\n',k3)
%  fprintf('x(i+1)=%.5f\n',x(i+1))
%  fprintf('y(i+1)=%.5f\n\n',y(i+1)); 
% end

%%
%Classical RK4 method
% for i = 1:n-1
%  k1 = f(x(i),y(i));
%  k2 = f(x(i)+h/2,y(i)+h*k1/2);
%  k3 = f(x(i)+h/2,y(i)+h*k2/2);
%  k4 = f(x(i)+h,y(i)+h*k3);
%  y(i+1) = y(i)+h*(k1+2*k2+2*k3+k4)/6;
%  x(i+1) = x(i)+h;
%  fprintf('k1=%.5f\n',k1) 
%  fprintf('k2=%.5f\n',k2)
%  fprintf('k3=%.5f\n',k3)
%  fprintf('x(i+1)=%.5f\n',x(i+1))
%  fprintf('y(i+1)=%.5f\n\n',y(i+1));
% end
