function [x] = GaussJordanElimination(A, B)
% GAUSSJORDANELIMINATION Rozwi¹¿ uk³ad równañ w reprezentacji macierzowej 
% wykorzystuj¹c metodê Gaussa-Jordana
%   Argumenty:
%   - A - macierz wspó³czynników równania, rozmiar nxn
%   - B - wektor pionowy prawych stron równania
%   Wyjœcia:
%   - x - pionowy wektor wartoœci szukanych

n = size(A, 1);
if( size(A, 2) ~= n || size(B, 1) ~= n || size(B, 2) ~= 1)
    x = -1;
    disp("Nieprawid³owy rozmiar macierzy! Ma byæ A=nxn, B=nx1")
    return;
end
x = zeros(n, 1);
for i = 1:n
    B(i,:) = B(i,:) / A(i,i);
    A(i,:) = A(i,:) / A(i,i); % Przygotowujê wiersz, dzielê go tak, ¿eby by³o 1 na przek¹tnej
    dif = A(:,i);
    dif(i) = 0;
    difMat = dif * A(i,:);
    A = A - difMat;
    B = B - dif * B(i);
end
x = B;
end
