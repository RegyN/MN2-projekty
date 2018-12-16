function [resX, resY] = Bisekcja(fun, a, b, epsilon)
%BISEKCJA Summary of this function goes here
%   Detailed explanation goes here
if(nargin == 3)
    epsilon = 1e-8;
end
if(sign(fun(a)) == sign(fun(b)))
    disp('B³¹d: Wartoœci funkcji na koñcach przedzia³ów maj¹ mieæ ró¿ne znaki');
end
while(b-a > epsilon)
    mid = (a+b)/2;
    if(sign(fun(mid)) == sign(fun(a)))
        a = mid;
    else
        b = mid;
    end
end
resX = (a+b)/2;
resY = fun(resX);
end

