function [midX, midY, expected, calculated, error, avgError] = CalculateError(X, Y, A, B, C, D, fun)
%CALCULATEERROR Wyznacza b³¹d œredniokwadratowy interpolacji w œrodku
%ciê¿koœci kwadratów.
%   Argumenty:
% - X, Y - wspó³rzêdne punktów, wêz³ów interpolacji
% - A, B, C, D - macierze nxn, parametry funkcji biliniowych w ka¿dym z kwadratów
% fun - wskaŸnik na funkcjê, któ¹ interpolujemy
%   Wyjœcia:
% - midX, midY - wspó³rzêdne œrodków kwadratów, macierze (n-1)x(n-1)
% - expected - macierz (n-1)x(n-1) wartoœci funkcji w œrodkach
% - calculated - macierz (n-1)x(n-1) wartoœci interpolacji w œrodkach
% - error - macierz (n-1)x(n-1) wartoœci b³êdu interpolacji w œrodkach
% - avgError - skalar, œredniokwadratowy b³¹d interpolacji w œrodkach
% kwadratów.

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

