function [counts, errors] = PointCountTest(fun, left, right)
%POINTCOUNTTEST Prezentacja wp³ywu liczby punktów na dok³adnoœæ dopasowania
%aproksymacji. Kolejno sprawdzana aproksymacja dla od 1 do 10 punktów.
% - fun - wskaŸnik na funkcjê 1 zmiennej
% - left, right - skalary, okreœlaj¹ce zakres w jakim funkcja ma byæ
% przybli¿ana
clc
format short
if(nargin == 0)
    left = 0;
    right = 5;
    fun = @(x) -1*sin(1.5*x) + 1;
elseif(nargin == 1)
    left = 0;
    right = 5;
elseif(nargin ~=3)
    disp('B£¥D: Nieprawid³owa liczba argumentów funkcji PointCountTest!. Potrzeba 1 lub 3!')
    return;
end

if(left > right) % Pilnujê kolejnoœci ograniczeñ
    tmp = left;
    left = right;
    right = tmp;
end

counts = 1:10;
errors = [];
for n = counts  % n to liczba punktów oparcia aproksymacji
    X = linspace(left, right, n);
    Y = fun(X);
    [~,err] = FindApprox(X, Y, true);
    errors = [errors; err];
    pause(1);
end
counts = counts';
end