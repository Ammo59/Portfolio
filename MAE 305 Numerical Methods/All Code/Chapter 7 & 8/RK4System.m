function u = RK4System(f,x,u0)
%
% RK4System uses RK4 method to solve a system of first-order
% initial-value problems in the form u' = f(x,u), u(x0) = u0.
%
% u = RK4System(f,x,u0), where
%
% f is an anonymous m-dim. vector function representing f(x,u),
% x is an (n+1)-dim. vector representing the mesh points,
% u0 is an m-dim. vector representing the initial state vector,
%
% u is an m-by-(n+1) matrix, each column the vector of solution
% estimates at a mesh point.
%
u(:,1) = u0; % The first column is set to be the initial vector u0
h = x(2) - x(1); n = length(x);
for ii = 1:n-1
    k1 = f(x(ii),u(:,ii));
    k2 = f(x(ii)+h/2,u(:,ii)+h*k1/2);
    k3 = f(x(ii)+h/2,u(:,ii)+h*k2/2);
    k4 = f(x(ii)+h,u(:,ii)+h*k3);
    u(:,ii+1) = u(:,ii)+h*(k1+2*k2+2*k3+k4)/6;
end