function [resX, error] = Bisekcja(fun, a, b, epsilon)
%BISEKCJA Summary of this function goes here
%   Detailed explanation goes here
if(nargin == 3)
    epsilon = 1e-8;
end

error = 0;
resX = NaN;
if(sign(fun(a)) == sign(fun(b)))
    error = 1;
    return
end

while(b - a > epsilon)
    if(sign(fun(a)) == sign(fun(b)))
        error = 1;
        return;
    end
    mid = (a + b) / 2;
    if(sign(fun(mid)) == sign(fun(a)))
        a = mid;
    else
        b = mid;
    end
end
resX = (a + b) / 2;
end

