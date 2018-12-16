function [d] = Wyznacznik3d(a, b, c)
%WYZNACZNIK3D Summary of this function goes here
%   Detailed explanation goes here

dpp = 1;
dp = a(1);
for i = 2 : max(size(a))
    d = dp*a(i) - b(i-1)*c(i-1)*dpp;
    dpp = dp;
    dp = d;
end
end

