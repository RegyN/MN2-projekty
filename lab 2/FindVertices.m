function [X, Y] = FindVertices(minX, maxX, minY, maxY, n)
%FINDVERTICES Znajduje podzia³ kwadratu na n^2 kwadratów
%   Argumenty
% - minX, minY, maxX, maxY - skalary, ograniczenia tworz¹ce kwadrat do podzia³u
% - n - skalar, ile razy mniejszy ma byæ ka¿dy kwadrat po podziale od
% pocz¹tkowego
%   Wyjœcia
% X, Y - macierze nxn wspó³rzêdnych punktów - naro¿ników kwadratów

if((maxX-minX ~= maxY-minY) || maxX < minX)
    disp("B£¥D! Nieprawid³owe ograniczenia.")
    return;
end
x = minX:(maxX-minX)/n:maxX;
y = maxY:(minY-maxY)/n:minY;
[X, Y] = meshgrid(x, y);
end

