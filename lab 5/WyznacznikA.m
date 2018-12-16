function [d] = WyznacznikA(n)
%WYZNACZNIKA Summary of this function goes here
%   Detailed explanation goes here
dpp = 1;
dp = 4;
d = 4;
for i = 2:n
    d = dp*4 - dpp;
    dpp = dp;
    dp = d;
end
end

