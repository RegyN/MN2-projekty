function [splits, midX, midY, expected, calculated, error, avgErr] = BilinearInterpolation(fun, minx, maxx, miny, maxy, epsilon)
%BILINEARINTERPOLATION Interpolacja funkcjami bilinowymi na kwadracie 
% Interpolacja funkcjami bilinowymi na kwadracie podzielonym na n^2
% kwadrat�w przystaj�cych. Zag�szczenie podzia�u kwadratu, a� do
% osi�gni�cia b��du �redniokwadratowego, mierzonego w �rodkach kwadrat�w
% podzia�u, mniejszego od epsilon.
%   Argumenty:
% fun - funkcja do interpolacji
% minx, miny, maxx, maxy - ograniczenia obszaru interpolacji
% epsilon - oczekiwany maks. b��d �redniokwadratowy
%   Wyj�cia:
% splits - stosunek d�ugo�ci pierwotnego kwadratu do ko�cowego
% - midX, midY - wsp�rz�dne �rodk�w kwadrat�w, macierze (n-1)x(n-1)
% expected - macierz (n-1)x(n-1) warto�ci funkcji w �rodkach
% calculated - macierz (n-1)x(n-1) warto�ci interpolacji w �rodkach
% error - macierz (n-1)x(n-1) warto�ci b��du interpolacji w �rodkach
% avgError - ko�cowy b��d �rednokwadratowy

splits = 2;
avgErr = epsilon;
V = [];

while(avgErr >= epsilon && splits < 10000)
    [X, Y] = FindVertices(minx, maxx, miny, maxy, splits);
    V = CalculateValues(fun, X, Y);
    [A, B, C, D] = Interpolate(X, Y, V);
    [midX, midY, expected, calculated, error, avgErr] = CalculateError(X, Y, A, B, C, D, fun);
    splits = splits * 2;
end
splits = splits / 2;
end

