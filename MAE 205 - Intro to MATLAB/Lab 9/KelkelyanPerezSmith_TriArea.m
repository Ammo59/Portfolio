function [area] = KelkelyanPerezSmith_TriArea(A,B,C)
%calculates the area of the triangle 
%A, B, and C are vectors containing the XY or XYZ coordinates of the vertices of the triangle
%The inputs must be 2D or 3D vectors
%"|| ||" is the magnitude of the vector
%AB is the distance vector from point A to point B 
%AC is the distance vector from point A to point C. 
%e.g. A = [23]or A = [1 2 0]
%
% Area = (1/2)*||AB x AC||

narginchk(3,3) %Checks number of input variables

%Only one output variable is neccessary
if nargout ~= 1
    error('Must have only one ouput variable');
end

%Checks to see if vectors are of equal length (same dimensions)
if ~(length(A) == length(B)) || ~(length(A) == length(C))
    error('Dimensions must be the same for all three vectors');
end

%Checks to see if vector is in 2D or 3D
if ((length(A) ~= 2 && length(A) ~= 3) && (length(B) ~= 2 && length(B) ~= 3) && (length(C) ~= 2 && length(C) ~= 3))
    error('Points must be in 2D or 3D');
end

VecDist = @(vertex1,vertex2) ((vertex2 - vertex1)); %returns the distance vector between two points given by vertex1 and vertex2

AB = VecDist(A,B); %First Vector
AC = VecDist(A,C); %Second Vector
ABAC = VecCross(AB,AC); %Cross product of two vectors

area = (1/2)*sqrt(sum(ABAC.^2)); %Computes area of cross product

function [crossprod] = VecCross(vec1,vec2) 
%computes the cross product of two vectors given by vec1and vec2

if length(vec1) == 2
    vec1(3) = 0;
    vec2(3) = 0;
end

crossprod = [(vec1(2)*vec2(3) - vec2(2)*vec1(3)),(vec1(3)*vec2(1) - vec2(3)*vec1(1)),(vec1(1)*vec2(2) - vec2(1)*vec1(2))];