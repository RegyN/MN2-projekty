function [resX, error] = Bisekcja(fun, a, b, epsilon)
%BISEKCJA Szukanie miejsca zerowego funkcji metod¹ bisekcji
%   fun - wskaŸnik na funkcjê, któej miejsac zerowe s¹ poszukiwane
%   a, b - przedzia³ poszukiwañ
%   spsilon - oczekiwana dok³adnoœæ
%   resX - miejsce zerowe
%   error - flaga b³êdu, jeœli równa 0, to praca zakoñczona powodzeniem.
if(nargin == 3)
    epsilon = 1e-8;
end

error = 0;
resX = NaN;
if(sign(fun(a)) == sign(fun(b)))
    error = 1;
    return
end

while(b - a > epsilon)
    if(sign(fun(a)) == sign(fun(b)))
        error = 1;
        return;
    end
    mid = (a + b) / 2;
    if(sign(fun(mid)) == sign(fun(a)))
        a = mid;
    else
        b = mid;
    end
end
resX = (a + b) / 2;
end

