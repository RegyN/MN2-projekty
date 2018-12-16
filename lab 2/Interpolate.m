function [A, B, C, D] = Interpolate(X, Y, expected)
%INTERPOLATE Znajd� parametry interpolacyjnej funkcji biliniowej na
%podstawie znajomo�ci oczekiwanej warto�ci w punktach po�o�onych w
%wierzcho�kach n^2 kwadrat�w (funkcja f(x, y) = ax + by + cxy + d)
%   Argumenty:
% X, Y - macierze (n+1)x(n+1) opisuj�ce wsp�rz�dne x i y punkt�w na kt�rych oparta
% b�dzie interpolacja
% expected - macierz (n+1)x(n+1) warto�ci funkcji w punkach o wsp�rz�dnych z X, Y
%   Wyj�cia:
% A, B, C, D - macierze nxn zawieraj�ce parametry funkcji wewn�trz ka�dego z kwadrat�w

n = size(X, 1) - 1;
A = zeros(n);
B = A;
C = A;
D = A;
for i=1:n
    for j=1:n
        U = [X(i, j),   Y(i, j),      X(i, j)*Y(i, j),        1;
            X(i+1, j),  Y(i+1, j),    X(i+1, j)*Y(i+1, j),    1;
            X(i, j+1),  Y(i, j+1),    X(i, j+1)*Y(i, j+1),    1;
            X(i+1, j+1),Y(i+1, j+1),  X(i+1, j+1)*Y(i+1, j+1),1];
        V = [expected(i, j); 
            expected(i+1, j); 
            expected(i, j+1); 
            expected(i+1, j+1)];
        params = linsolve(U, V);
        A(i, j) = params(1);
        B(i, j) = params(2);
        C(i, j) = params(3);
        D(i, j) = params(4);
    end
end
end

