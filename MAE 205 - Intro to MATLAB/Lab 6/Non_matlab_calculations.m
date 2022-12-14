%%
clear; clc;

out = 50;
while (out >= 10)
    out = out - 20;
end
out = out*-2 + 5

%%
out = 30;
for jj = 1:6
    if (mod(jj,2) ~= 0)
        continue;
    end
    out = out - jj*3;
end

%%
clear;clc;
out = zeros(2,3); x = 2; z = 2;
for ii = 1:size(out,1)
    for jj = 1:size(out,2)
        out(ii,jj) = x*z -2;
        x = x + 1;
    end
    z = z - 1;
end