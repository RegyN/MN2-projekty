function [] = GJTests()
%GJTESTS Funkcja testuj¹ca dzia³anie GaussJordanElim na prostych
% przyk³adach
[e1, r1] = TestProsty();    % Prosty test
[e2, r2] = TestDiag1();     % Seria testów z niskimi wartoœciami na g³. przek¹tnej
[e3, r3] = TestDiag2();     %
[e4, r4] = TestDiag3();     %
[e5, r5] = TestZeros1();    % Test z zerem na diagonali, które da siê zamieniæ
[e6, r6] = TestZeros2();    % Uwaga, test POWINIEN zwracaæ b³¹d

% Testy o du¿ych wymiarach s¹ dostêpne w funkcji GJPerformanceTests()
end

function [result, expected] = TestProsty()
    A = [8, 1, 6;
         3, 5, 7;
         4, 9, 2];
    X = [1, 2;
         3, 4;
         5, 6];
    B = A*X;
    expected = X;
    result = GaussJordanElim(A, B);
end

function [result, expected] = TestDiag1()
    A = [0.000000001, 1, 6;
         3, 0.000000001, 7;
         4, 9, 0.000000001];
    X = [1, 2;
         3, 4;
         5, 6];
    B = A*X;
    expected = X;
    result = GaussJordanElim(A, B);
end

function [result, expected] = TestDiag2()
    A = [0.000000000001, 1, 6;
         3, 0.000000000001, 7;
         4, 9, 0.000000000001];
    X = [1, 2;
         3, 4;
         5, 6];
    B = A*X;
    expected = X;
    result = GaussJordanElim(A, B);
end

function [result, expected] = TestDiag3()
    A = [0.000000001, 1, 6;
         3, 0.000000001, -6.1;
         3, 1, 0.000000001];
    X = [1, 2;
         3, 4;
         5, 6];
    B = A*X;
    expected = X;
    result = GaussJordanElim(A, B);
end

function [result, expected] = TestZeros1()
    A = [0, 1, 4;
         3, 1, -2;
         -3, 5, 3];
    X = [1, 2;
         3, 4;
         5, 6];
    B = A*X;
    expected = X;
    result = GaussJordanElim(A, B);
end

function [result, expected] = TestZeros2()
    A = [1, 1, 2;
         -1, 3, 0;
         0, 4, 2];
    X = [1, 2;
         4, 7;
         5, 1];
    B = A*X;
    expected = X;
    result = GaussJordanElim(A, B);
end