function [keq] = KelkelyanPerezSmith_kEquivalent(k,type)
% Accepts a vector k and outputs k equivalent
% The function accepts a vector k containing the stiffness coefficients of
% each spring in the group and a type
%
% Outputs equivalent spring stiffness
%

% Aramis Kelkelyan, Group Member 1, Anthony Perez, Group Member 2,
% Christian Smith Group Member 3
% MAE 205 Section 11/12
%
% Laboratory 8, Problem 2
%-----------------------------------------------------------------------

narginchk(1,2);

if nargin == 1 
    warning('Type not entered. Defaulting to type two');
    type = 2;
end

if ~isvector(k)
    error('Must be a vector to calculate equivalent spring stiffness');
end

if isempty(type)
   warning('Type cannot be empty, defaulting 2 (series)');
   type = 2;
end

if type ~= 1 && type ~= 2
    warning('Type entered incorrectly, defaulting to series');
    type = 2;
end

if type == 1
    keq = sum(k);
else
    keq = sum(1./k).^(-1);
end