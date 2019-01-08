function [res] = DzielWiel(fun, x, x0)
%DZIELWIEL Symulacja dzielenia wielomianu przez jego miejsca zerowe.
%   fun - wska�nik na funkcj� - wielomian
%   x0 - wektor miejsc zerowych
%   x - warto�� wsp�rz�dnej dla kt�ej wyznaczamy warto�� wielomianu
%   res - warto�� podzielonego wielomianu

res = fun(x) / prod(x - x0);
end

