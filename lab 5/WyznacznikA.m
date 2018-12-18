function [d] = WyznacznikA(n, t)
%WYZNACZNIKA Summary of this function goes here
%   Detailed explanation goes here
if(nargin == 1)
    t = 0;
end
dpp = 1;
dp = (4-t);
d = (4-t);
for i = 2:n
    d = dp*(4-t) - dpp;
    dpp = dp;
    dp = d;
end
end

