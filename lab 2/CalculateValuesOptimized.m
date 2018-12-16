function [values] = CalculateValuesOptimized(fun, X, Y, V)
%CALCULATEVALUES Calculate values of 2D function in matrix of points

if(size(V, 1) == 0)
    values = CalculateValues(fun, X, Y);
    return;
end
n = size(X, 1);
values = zeros(n);
for i=1:2:n
    for j=1:2:n
        values(i, j) = V((i+1)/2, (j+1)/2);
    end
end

for i=2:2:n
    for j=1:2:n
        values(i, j) = fun(X(i, j), Y(i, j));
    end
end

for i=1:n
    for j=2:2:n
        values(i, j) = fun(X(i, j), Y(i, j));
    end
end
end

