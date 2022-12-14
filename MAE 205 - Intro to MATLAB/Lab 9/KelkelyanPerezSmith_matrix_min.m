function [min_value, min_index] = KelkelyanPerezSmith_matrix_min(x)
%Finds  the smallest  element(s)  of  a  matrix
% Input x (a vector or matrix, not a scalar)
% Outputs the minimum value (min_value) and the indexes of the minimum
% value(s)(min_index)
%

% Aramis Kelkelyan, Group Member 1, Anthony Perez, Group Member 2,
% Christian Smith Group Member 3
% MAE 205 Section 11/12
%
% Laboratory 9, Problem 1
%-----------------------------------------------------------------------

narginchk(1,1); %Checks input variables
% nargoutchk(2,2);

%Checks if output variables = 2 
if nargout ~= 2 
    error('Must designate two output variables.');
end

%Checks if user input is a vector or matrix , not a scalar
if ~isvector(x) && ~ismatrix(x)
    error('Must enter a vector or matrix of numbers');
end

min_value = x(1); %Sets minimum value to first element in array
min_index = [1 1]; %Sets index value to first element in array

%Create for loop to find min value and min index
for ii=1:size(x,1)

    % iterate over all collumns

    for jj=1:size(x,2)

        % find min element

        if min_value > x(ii,jj)

            min_value = x(ii,jj);
            
            min_index = [ii jj];
            
        elseif min_value == x(ii,jj)

            min_index = [min_index ; ii, jj];
            
        else
            continue;
        end

    end
    
end