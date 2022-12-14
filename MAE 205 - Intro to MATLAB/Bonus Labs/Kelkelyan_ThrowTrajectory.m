function [x,y]=Kelkelyan_ThrowTrajectory(velocity,angle)
%Returns the x-position and y-position vectors of the baseball
%User inputs the initial velocity of the baseball and the initial angle of release.
%Using basic equations of ballistic motion:
% x(t) = vx0*t
% y(t) = vy0*t - (1/2)*g*t^2
% total time = 2*vy0/g where g is the gravitational acceleration of the
% earth in m/s^2


%
% Aramis Kelkelyan
% MAE 205 Section 11/12
%
% Bonus Laboratory II Part A
%------------------------------------------------------------------------

narginchk(2,2) %Checks number of input variables
nargoutchk(2,2); %Only two output variables are neccessary

if velocity<0
    error('Velocity must be a positive number');
end

if (angle<0) && (angle>=90)
    error('Angle must be positive');
end 

%Inputs must be scalars in order for the function to be executed
if (~isscalar(velocity)) || (~isscalar(angle))
    error('Inputs must be scalars');
end

g = 9.81; %m/s^2

vx0 = velocity.*cosd(angle);
vy0 = velocity.*sind(angle);
t = 0:0.01:(2*vy0/g);

x = vx0.*t;
y = vy0.*t-(0.5)*g.*(t.^2);

