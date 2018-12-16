function [result] = IntegrateUnitCircle(fun, N)
%INTEGRATEUNITCIRCLE Wyznacz ca³kê funkcji 2-wym wewn¹trz jednostkowego okrêgu
%   Uk³ad wspó³rzêdnych jest konwertowany z kartezjañskiego na biegunowy w
%   taki sposób, by obszar ca³kowania transformowaæ do kwadratu x'=[-1,1] 
%   y'=[-1,1]. Ca³kowanie przy u¿yciu z³o¿onej kwadratury Simpsona.

% Transformujê funkcjê z obszaru x^2+y^2 <= 1 do kwadratu [-1, 1]x[-1, 1]
tr = @(x, y) fun((0.5*x+0.5).*cos(y*pi-1), (0.5*x+0.5) .*sin(y*pi-1)) .* (1/4*pi*(x+1));

% Liczba podobszarów musi byæ parzysta i wiêksza od zera
if(N <= 0 || mod(N, 2) ~= 0)
    disp('Nieprawidlowa liczba podzia³ów - musi byæ dodatni¹ liczb¹ parzyst¹');
    result = NaN;
    return;
end

hx = 2 / N; % wymiary pojedynczego podobszaru
hy = 2 / N;

X = -1:hx:1;   % wartoœci wspó³rzêdnych w naro¿nikach podobszarów
Y = -1:hy:1;

% tworzê wektor wspó³czynników Simpsona
base = ones(1, N+1);
for i=3:2:N-1
    base(i) = 2;
end
for i=2:2:N
    base(i) = 4;
end

% sumujê iloczyny wartoœci z macierzy Simpsona i funkcji podca³kowej
Sum = 0;
for i=1:N
    Sum = Sum + base(i) * sum(base .* tr(X(i), Y));
end
% Wartoœæ ca³ki to iloczyn sumy podwartoœci i wspó³czynnika
result = Sum * ((hx*hy)/9);
end