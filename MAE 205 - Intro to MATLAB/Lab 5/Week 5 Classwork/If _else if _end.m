%
%
%
%
clear; clc;

g = input('Enter score to receive the letter grade: ');

if 95 < g
    letter = 'A';
elseif (85 < g)
    letter = 'B';
elseif (75 < g)
    letter = 'C';
elseif (65 < g)
    letter = 'D';
else
    letter = 'F';
end

fprintf('The score was %g which earned an %c. \n\n',g,letter);