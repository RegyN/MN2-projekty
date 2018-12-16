function [values] = CalculateValues(fun, X, Y)
%CALCULATEVALUES Wyznacz warto�ci funkcji 2 zmiennych w podanych punktach
%   Argumenty:
% - fun - wska�nik na funkcj� 2 zmiennych
% - X, Y - macerze nxn zawieraj�ce wsp�rz�dne punkt�w

n = size(X, 1);
values = zeros(n);

for i=1:n
    for j=1:n
        values(i, j) = fun(X(i, j), Y(i, j));
    end
end
end

