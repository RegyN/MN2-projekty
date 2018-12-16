function [] = GJTests()
%GJTESTS Funkcja testuj�ca dzia�anie GaussJordanElim na prostych
% przyk�adach
[e1, r1] = TestProsty();    % Prosty test
[e2, r2] = TestDiag1();     % Seria test�w z niskimi warto�ciami na g�. przek�tnej
[e3, r3] = TestDiag2();     %
[e4, r4] = TestDiag3();     %
[e5, r5] = TestZeros1();    % Test z zerem na diagonali, kt�re da si� zamieni�
[e6, r6] = TestZeros2();    % Uwaga, test POWINIEN zwraca� b��d

% Testy o du�ych wymiarach s� dost�pne w funkcji GJPerformanceTests()
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