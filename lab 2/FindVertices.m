function [X, Y] = FindVertices(minX, maxX, minY, maxY, n)
%FINDVERTICES Znajduje podzia� kwadratu na n^2 kwadrat�w
%   Argumenty
% - minX, minY, maxX, maxY - skalary, ograniczenia tworz�ce kwadrat do podzia�u
% - n - skalar, ile razy mniejszy ma by� ka�dy kwadrat po podziale od
% pocz�tkowego
%   Wyj�cia
% X, Y - macierze nxn wsp�rz�dnych punkt�w - naro�nik�w kwadrat�w

if((maxX-minX ~= maxY-minY) || maxX < minX)
    disp("B��D! Nieprawid�owe ograniczenia.")
    return;
end
x = minX:(maxX-minX)/n:maxX;
y = maxY:(minY-maxY)/n:minY;
[X, Y] = meshgrid(x, y);
end

