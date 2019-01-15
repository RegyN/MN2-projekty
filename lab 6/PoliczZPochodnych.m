function [T, X, V, A] = PoliczZPochodnych(startX, startV, l, dt, maxT)
%POLICZZPOCHODNYCH Summary of this function goes here
%   Detailed explanation goes here
g = 9.805;
k = g/l;
x = startX;
v = startV;
a = -k*sin(x);
T = (0:dt:maxT)';
n = max(size(T));
X = zeros(n, 1);
V = zeros(n, 1);
A = zeros(n, 1);
for i = 1:n
    X(i) = x;
    V(i) = abs(v);
    A(i) = a;
    v = v+a*dt;
    x = x+v*dt;
    a = -k*sin(x);
end
end

