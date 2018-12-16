function [midX, midY, expected, calculated, error, avgError] = CalculateError(X, Y, A, B, C, D, fun)
%CALCULATEERROR Wyznacza b��d �redniokwadratowy interpolacji w �rodku
%ci�ko�ci kwadrat�w.
%   Argumenty:
% - X, Y - wsp�rz�dne punkt�w, w�z��w interpolacji
% - A, B, C, D - macierze nxn, parametry funkcji biliniowych w ka�dym z kwadrat�w
% fun - wska�nik na funkcj�, kt� interpolujemy
%   Wyj�cia:
% - midX, midY - wsp�rz�dne �rodk�w kwadrat�w, macierze (n-1)x(n-1)
% - expected - macierz (n-1)x(n-1) warto�ci funkcji w �rodkach
% - calculated - macierz (n-1)x(n-1) warto�ci interpolacji w �rodkach
% - error - macierz (n-1)x(n-1) warto�ci b��du interpolacji w �rodkach
% - avgError - skalar, �redniokwadratowy b��d interpolacji w �rodkach
% kwadrat�w.

n = size(X, 1);
sumError = 0;
midX = zeros(n-1);
midY = zeros(n-1);
expected = zeros(n-1);
calculated = zeros(n-1);
error = zeros(n-1);
for i=1:n-1
    for j=1:n-1
        midX(i, j) = (X(i, j)+X(i, j+1))/2;
        midY(i, j) = (Y(i, j)+Y(i+1, j))/2;
        expected(i, j) = fun(midX(i, j), midY(i, j));
        calculated(i, j) = A(i, j)*midX(i, j) + B(i, j)*midY(i, j) + C(i, j)*midX(i, j)*midY(i, j) +D(i, j);
        error(i, j) = expected(i, j) - calculated(i, j);
        sumError = sumError + (error(i, j))^2;
    end
end
avgError = sumError / ((n - 1) ^ 2);
avgError = sqrt(avgError);
end

