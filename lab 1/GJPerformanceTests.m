function [results] = GJPerformanceTests()
%GJPERFORMANCETESTS Funkcja testuj¹ca szybkoœæ dzia³ania GaussJordanElim

n = [400, 800, 1200, 1600, 2000, 2400, 2800]; % tablica wielkoœci macierzy A
m = [100, 200, 400];    % tablica liczby kolumn macierzy B
for i=1:size(n,2)
    for j=1:size(m,2)
        disp("--------------------------------")
        disp(sprintf('n=%d m=%d', n(i), m(j)))
        A = rand(n(i));
        X = rand(n(i), m(j));
        B = A*X;
        tic;
        x = GaussJordanElim(A, B);
        toc
        if(IsEqual(x, X))
            disp("Dobry wynik");
        else
            disp("B³¹d");
        end
    end
end
end

function [isEqual] = IsEqual(A, B)  % T¹ funkcj¹ sprawdzam zgodnoœæ dwóch macierzy
isEqual = 1;
for i=1:size(A, 1)
    for j=1:size(A, 2)
        if(abs(A(i, j)-B(i, j)) > 0.1)
            disp("Jest ró¿nica!")
            isEqual = 0;
        end
    end
end


end

