function [res] = Main(n)
%MAIN Funkcja znajduj¹ca wartoœci w³asne trójdiagonalnej macierzy 1 4 1
%   n - rz¹d macierzy
%   res - wektor poziomy wartoœci w³asnych

fun = @(x) WyznacznikA(n, x);

res = [];
area = 1 / (n^2);
maxDif = 1 / (10*n);
prevArea = 0;
for i = 1 : n / 2
    fun2 = @(x) DzielWiel(fun, x, res);
    [zero, err] = Bisekcja(fun2, 2 + prevArea, 2 + area, 0.0000000001);
    while(err ~= 0)
        dif = area * 0.2;
        prevArea = area;
        area = area + min(dif, maxDif);
        if(area > 2)
            break;
        end
        [zero, err] = Bisekcja(fun2, 2 + prevArea, 2 + area, 0.0000000001);
    end
    res = [res, zero, 8 - zero];      % 6-(zero-2)
end
if mod(n, 2) == 1
    res = [res, 4];
end
end

