function [x] = GaussJordanElimination(A, B)
% GAUSSJORDANELIMINATION Rozwi�� uk�ad r�wna� w reprezentacji macierzowej 
% wykorzystuj�c metod� Gaussa-Jordana
%   Argumenty:
%   - A - macierz wsp�czynnik�w r�wnania, rozmiar nxn
%   - B - wektor pionowy prawych stron r�wnania
%   Wyj�cia:
%   - x - pionowy wektor warto�ci szukanych

n = size(A, 1);
if( size(A, 2) ~= n || size(B, 1) ~= n || size(B, 2) ~= 1)
    x = -1;
    disp("Nieprawid�owy rozmiar macierzy! Ma by� A=nxn, B=nx1")
    return;
end
x = zeros(n, 1);
for i = 1:n
    B(i,:) = B(i,:) / A(i,i);
    A(i,:) = A(i,:) / A(i,i); % Przygotowuj� wiersz, dziel� go tak, �eby by�o 1 na przek�tnej
    dif = A(:,i);
    dif(i) = 0;
    difMat = dif * A(i,:);
    A = A - difMat;
    B = B - dif * B(i);
end
x = B;
end
