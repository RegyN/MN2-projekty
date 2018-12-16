function [splits, midX, midY, expected, calculated, error, avgErr] = BilinearOptimized(fun, minX, maxX, minY, maxY, epsilon)
%BILINEAROPTIMIZED Interpolacja funkcjami bilinowymi na kwadracie 
% Interpolacja funkcjami bilinowymi na kwadracie podzielonym na n^2
% kwadrat�w przystaj�cych. Zag�szczenie podzia�u kwadratu, a� do
% osi�gni�cia b��du �redniokwadratowego, mierzonego w �rodkach kwadrat�w
% podzia�u, mniejszego od epsilon.
%   Argumenty:
% - fun - funkcja do interpolacji
% - minX, minY, maxX, maxY - ograniczenia obszaru interpolacji
% - epsilon - oczekiwany maks. b��d �redniokwadratowy
%   Wyj�cia:
% - splits - stosunek d�ugo�ci pierwotnego kwadratu do ko�cowego
% - midX, midY - wsp�rz�dne �rodk�w kwadrat�w, macierze nxn
% - expected - macierz nxn warto�ci funkcji w �rodkach
% - calculated - macierz nxn warto�ci interpolacji w �rodkach
% - error - macierz nxn warto�ci b��du interpolacji w �rodkach
% - avgError - ko�cowy b��d �redniokwadratowy

splits = 2;         % zmienna okre�laj�ca stosunek rozmiaru pocz�tkowego kwadratu do ko�cowego kawa�ka
avgErr = epsilon;   % b��d �redniokwadratowy, warto�� pocz�tkowa taka, �eby p�tla zawsze si� wykona�a cho� raz
V = [];

while(avgErr >= epsilon && splits < 10000)                  % Je�li b��d nie jest odpowiednio ma�y, b�d� te� liczba podzia��w nie jest zbyt wielka
    [X, Y] = FindVertices(minX, maxX, minY, maxY, splits);  % Znajduj� wierzcho�ki kwadrat�w
    V = CalculateValuesOptimized(fun, X, Y, V);             % Znajduj� warto�ci funkcji w wierzcho�kach, korzystaj�c ze znanych z poprzedniej iteracji warto�ci
    [A, B, C, D] = Interpolate(X, Y, V);                    % Interpoluj� w ka�dym z kwadrat�w cz�stkowych
    [midX, midY, expected, calculated, error, avgErr] = CalculateError(X, Y, A, B, C, D, fun); % Wyliczam b��d
    splits = splits * 2;                                    % W kolejnych iteracjach podzia� zag�szczany jest dwukrotnie
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Kod poni�ej mo�na odkomentowa� i postawi� breakpoint na end p�tli (linia 42)  %
    % B�d� wtedy rysowane przybli�enia funkcji z kolejnych iteracji                 %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%     subplot(2,1,1);
%     mesh(midX, midY, calculated);
%     title("Calculated ("+splits+" splits)");
%     subplot(2,1,2);
%     mesh(midX, midY, error);
%     title("Error = " + avgErr);
end
splits = splits / 2;            % Na koniec p�tli splits jest podwajane, wi�c w tym miejscu zmniejszam, zeby opisywa� wykorzystan� warto��
end

