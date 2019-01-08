function [res] = DzielWiel(fun, x, x0)
%DZIELWIEL Symulacja dzielenia wielomianu przez jego miejsca zerowe.
%   fun - wskaŸnik na funkcjê - wielomian
%   x0 - wektor miejsc zerowych
%   x - wartoœæ wspó³rzêdnej dla któej wyznaczamy wartoœæ wielomianu
%   res - wartoœæ podzielonego wielomianu

res = fun(x) / prod(x - x0);
end

