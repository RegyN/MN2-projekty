function [splits, midX, midY, expected, calculated, error, avgErr] = BilinearInterpolation(fun, minx, maxx, miny, maxy, epsilon)
%BILINEARINTERPOLATION Interpolacja funkcjami bilinowymi na kwadracie 
% Interpolacja funkcjami bilinowymi na kwadracie podzielonym na n^2
% kwadratów przystaj¹cych. Zagêszczenie podzia³u kwadratu, a¿ do
% osi¹gniêcia b³êdu œredniokwadratowego, mierzonego w œrodkach kwadratów
% podzia³u, mniejszego od epsilon.
%   Argumenty:
% fun - funkcja do interpolacji
% minx, miny, maxx, maxy - ograniczenia obszaru interpolacji
% epsilon - oczekiwany maks. b³¹d œredniokwadratowy
%   Wyjœcia:
% splits - stosunek d³ugoœci pierwotnego kwadratu do koñcowego
% - midX, midY - wspó³rzêdne œrodków kwadratów, macierze (n-1)x(n-1)
% expected - macierz (n-1)x(n-1) wartoœci funkcji w œrodkach
% calculated - macierz (n-1)x(n-1) wartoœci interpolacji w œrodkach
% error - macierz (n-1)x(n-1) wartoœci b³êdu interpolacji w œrodkach
% avgError - koñcowy b³¹d œrednokwadratowy

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

