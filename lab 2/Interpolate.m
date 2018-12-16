function [A, B, C, D] = Interpolate(X, Y, expected)
%INTERPOLATE ZnajdŸ parametry interpolacyjnej funkcji biliniowej na
%podstawie znajomoœci oczekiwanej wartoœci w punktach po³o¿onych w
%wierzcho³kach n^2 kwadratów (funkcja f(x, y) = ax + by + cxy + d)
%   Argumenty:
% X, Y - macierze (n+1)x(n+1) opisuj¹ce wspó³rzêdne x i y punktów na których oparta
% bêdzie interpolacja
% expected - macierz (n+1)x(n+1) wartoœci funkcji w punkach o wspó³rzêdnych z X, Y
%   Wyjœcia:
% A, B, C, D - macierze nxn zawieraj¹ce parametry funkcji wewn¹trz ka¿dego z kwadratów

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

