function [results] = GaussJordanElimTests()
%GAUSSJORDANELIMTESTS Funkcja testuj¹ca dzia³anie GaussJordanElim
results = [];
results = [results Test1() TestWithError()];
end

function [result, expected] = Test1()
    A = [1, 5, 3;
         2, 4, 6;
        -2,-1, 5];
    B = [4; 2; -10];
    expected = [2;1;-1];
    result = all(GaussJordanElim(A, B) == expected);
end

function [result, expected] = TestWithError()
    A = [1, 5, 3, 2;
         2, 4, 6, -1;
        -2,-1, 5, 7];
    B = [4; 2; -10];
    expected = [2;1;-1];
    result = all(GaussJordanElim(A, B) == -1);
end

