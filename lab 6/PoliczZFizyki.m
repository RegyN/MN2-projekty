function [T, X, V, A] = PoliczZFizyki(startX, startV, l, dt, maxT)
%POLICZZFIZYKI Summary of this function goes here
%   Detailed explanation goes here
g = 9.805;
k = g/l;
x = startX;
H = l*(1 - cos(startX));
v = startV;
a = -k*sin(x);
T = (0:dt:maxT)';
n = max(size(T));
X = zeros(n, 1);
V = zeros(n, 1);
A = zeros(n, 1);
for i = 1:n
    X(i) = startX*cos(sqrt(k)*T(i));
    V(i) = (sqrt(2*g*(H-l*(1-cos(X(i))))))/l;
    A(i) = -k*sin(X(i));
end
end

