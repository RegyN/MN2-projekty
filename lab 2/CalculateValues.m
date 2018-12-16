function [values] = CalculateValues(fun, X, Y)
%CALCULATEVALUES Wyznacz wartoœci funkcji 2 zmiennych w podanych punktach
%   Argumenty:
% - fun - wskaŸnik na funkcjê 2 zmiennych
% - X, Y - macerze nxn zawieraj¹ce wspó³rzêdne punktów

n = size(X, 1);
values = zeros(n);

for i=1:n
    for j=1:n
        values(i, j) = fun(X(i, j), Y(i, j));
    end
end
end

