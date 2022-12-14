%%%MAE 300 CH. 1, CH.2, and CH.3 REVIEW

%%%CHAPTER 1

%%MATRIX OPERATIONS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Transpose/Transpose Properties

%det(A)=transpose(A)
%The determinant of a lower triangular, upper triangular, or diagonal
%matrix is the product of the diagonal entries
%If any rows or columns of A are linearly dependent, then abs(A)=0

A=[1 2 3; 4 5 6; 7 8 9];
B=[2 4 6; 8 10 12; 14 16 18];

transpose(A);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Determinant/Determinant Properties


det(A);
det(A)*det(B);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Inverse/Inverse Properties

%inv(inv(A))=A
%inv(AB)=(inv(A))*(inv(B))
%inv(transpose(A))= (transpose(A))inv
%inv(A)=1/abs(A)
%Inverse of a symmetrical matrix is symmetric
%Inverse of a diagonal matrix is diagonal whose entries are the reciprocals
%of the entries of the original matrix

inv(A);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%ITERATIVE METHOD/LOOP

A1=ones(4,6);
ncols=2;
nrows=3;

for c = 1:ncols
    for r = 1:nrows
        
        if r == c
            A1(r,c) = 2;
        elseif abs(r-c) == 1
            A1(r,c) = -1;
        else
            A1(r,c) = 0;
        end
        
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%CHAPTER 2

%%BUILT-IN MATLAB FUNCTIONS


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Help; brings up help database and library of all commands

%Rounding commands; round(a), fix(a), ceil(a), floor(a)

a=2.4365;
b=2*10^3;

round(a);
fix(a);
ceil(a);
floor(a);

%Format options; changes display type/output type

format long
%format short
%format short e (a+b)
%format long e (a+b)
%format bank (a+b)


%Creating vectors

%Five columns, one row

v=[1 4 6 7 10];

%OR

%One column, five rows

v=[1; 4; 6; 7; 10];

%Length of a vector

length(v);

%Size of a vector

size(v);

%Transposing a vector

v';

%Retrieving any component of a vector; ex. third component

v(3);


%Linspace; creates vectors with equally spaced elements

%linspace(x1,x2,n); start point, end point, and total number of points

x=linspace(1,5,6);


%Matrices

%Semicolon seperates rows

A=[1 2 3; 4 5 6; 7 8 9];


%Finding rows within matrices
%2nd row of A
%(Row, Column)

Row_2_of_A=A(2,:);

%Speciality Matrices

%Zeros

A=zeros(3,2);

%Identity

%4x4

I=eye(4);

%Replacing columns and rows within an existing matrix

v1=[0 0 0];
A_new=A;
A_new(:,2)=v1;

%Size of matrix

size(A)


A_transpose=A.';


%Slash operators

%The backslash (\) operator aids in solving a linear system of algebraic
%equations Ax=b, whose solution vector is obtained by x=inv(A)*b

A2=[1 -1 2; 2 0 3; 1 -2 1]; b=[2;8;-3];
x=A\b;


%Raising values by powers
%.^

X1=2
X2=2.^2

%Diagonal matrices and diagonals of a matrix

diag(A)

%Symbolic math toolbox

%Allows for manipulation of symbols to peform operations symbolically

syms a b
c=2.1;
g=4.81*sin(a/3)+3*exp(-b/c)

%Differentiation

%Any derivative diff(f,n)
%f=function and n=derivation degree

%f=sym('2x');
%dfdt=diff(f)
%dfdt2=diff(f,2)

%Partial Derivatives

%diff(h,'x' or 'y' partial)

%h=sym('2*x+y^2')
%hx=diff(h,'x')


%Integration

%f1=sym('((2*t)+cos(3*t))');
%int(f)


%Loops

%for i=first:increment:last,statements
%end

%Loops are covered on page 41 in the book

%Displaying/recalling data

disp(v)

%Plotting

t=linspace(0,5);
x=exp(-t).*(cos(t)+sin(t));
plot(t,x)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



















