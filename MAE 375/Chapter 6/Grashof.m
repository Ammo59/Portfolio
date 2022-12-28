function condition = Grashof(a,b,c,d)
% 
% Aramis Kelkelyan
% MAE 375: Quiz 1 
% Problem 1
% Date: 10/07/2021
%-----------------------------------------
Links = [a,b,c,d];

%Define variables
S = min(Links); L = max(Links);
PQ = sum(Links) - (S+L); 

if S+L < PQ
    condition = 'Grashof';
    
elseif S+L > PQ
    condition = 'Non-Grashof';

else
    condition = 'Special Grashof';

end

fprintf('The Fourbar linkage is %s\n', condition);