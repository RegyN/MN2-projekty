function [result] = IntegrateUnitCircle(fun, N)
%INTEGRATEUNITCIRCLE Wyznacz ca�k� funkcji 2-wym wewn�trz jednostkowego okr�gu
%   Uk�ad wsp�rz�dnych jest konwertowany z kartezja�skiego na biegunowy w
%   taki spos�b, by obszar ca�kowania transformowa� do kwadratu x'=[-1,1] 
%   y'=[-1,1]. Ca�kowanie przy u�yciu z�o�onej kwadratury Simpsona.

% Transformuj� funkcj� z obszaru x^2+y^2 <= 1 do kwadratu [-1, 1]x[-1, 1]
tr = @(x, y) fun((0.5*x+0.5).*cos(y*pi-1), (0.5*x+0.5) .*sin(y*pi-1)) .* (1/4*pi*(x+1));

% Liczba podobszar�w musi by� parzysta i wi�ksza od zera
if(N <= 0 || mod(N, 2) ~= 0)
    disp('Nieprawidlowa liczba podzia��w - musi by� dodatni� liczb� parzyst�');
    result = NaN;
    return;
end

hx = 2 / N; % wymiary pojedynczego podobszaru
hy = 2 / N;

X = -1:hx:1;   % warto�ci wsp�rz�dnych w naro�nikach podobszar�w
Y = -1:hy:1;

% tworz� wektor wsp�czynnik�w Simpsona
base = ones(1, N+1);
for i=3:2:N-1
    base(i) = 2;
end
for i=2:2:N
    base(i) = 4;
end

% sumuj� iloczyny warto�ci z macierzy Simpsona i funkcji podca�kowej
Sum = 0;
for i=1:N
    Sum = Sum + base(i) * sum(base .* tr(X(i), Y));
end
% Warto�� ca�ki to iloczyn sumy podwarto�ci i wsp�czynnika
result = Sum * ((hx*hy)/9);
end