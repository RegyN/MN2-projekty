function [result] = Integrate(fun, N, minX, maxX, minY, maxY)
%INTEGRATE Summary of this function goes here
%   Detailed explanation goes here
hx = (maxX-minX)/(N-1);
hy = (maxY-minY)/(N-1);

X = minX:hx:maxX;
Y = minY:hy:maxY;

% tworzê macierz
base = zeros(N, 1);
for i=1:2:N
    base(i) = 2;
end
for i=2:2:N
    base(i) = 4;
end
base(1) = 1;
base(size(base, 1)) = 1;

Sum = 0;
for i=1:N-1
    Sum = Sum + sum(base(i) * base .* fun(X(i), Y));
end

result = Sum * ((hx*hy)/9);
end

