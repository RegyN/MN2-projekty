function [splits, midX, midY, expected, calculated, error, avgErr] = BilinearOptimized(fun, minX, maxX, minY, maxY, epsilon)
%BILINEAROPTIMIZED Interpolacja funkcjami bilinowymi na kwadracie 
% Interpolacja funkcjami bilinowymi na kwadracie podzielonym na n^2
% kwadratów przystaj¹cych. Zagêszczenie podzia³u kwadratu, a¿ do
% osi¹gniêcia b³êdu œredniokwadratowego, mierzonego w œrodkach kwadratów
% podzia³u, mniejszego od epsilon.
%   Argumenty:
% - fun - funkcja do interpolacji
% - minX, minY, maxX, maxY - ograniczenia obszaru interpolacji
% - epsilon - oczekiwany maks. b³¹d œredniokwadratowy
%   Wyjœcia:
% - splits - stosunek d³ugoœci pierwotnego kwadratu do koñcowego
% - midX, midY - wspó³rzêdne œrodków kwadratów, macierze nxn
% - expected - macierz nxn wartoœci funkcji w œrodkach
% - calculated - macierz nxn wartoœci interpolacji w œrodkach
% - error - macierz nxn wartoœci b³êdu interpolacji w œrodkach
% - avgError - koñcowy b³¹d œredniokwadratowy

splits = 2;         % zmienna okreœlaj¹ca stosunek rozmiaru pocz¹tkowego kwadratu do koñcowego kawa³ka
avgErr = epsilon;   % b³¹d œredniokwadratowy, wartoœæ pocz¹tkowa taka, ¿eby pêtla zawsze siê wykona³a choæ raz
V = [];

while(avgErr >= epsilon && splits < 10000)                  % Jeœli b³¹d nie jest odpowiednio ma³y, b¹dŸ te¿ liczba podzia³ów nie jest zbyt wielka
    [X, Y] = FindVertices(minX, maxX, minY, maxY, splits);  % Znajdujê wierzcho³ki kwadratów
    V = CalculateValuesOptimized(fun, X, Y, V);             % Znajdujê wartoœci funkcji w wierzcho³kach, korzystaj¹c ze znanych z poprzedniej iteracji wartoœci
    [A, B, C, D] = Interpolate(X, Y, V);                    % Interpolujê w ka¿dym z kwadratów cz¹stkowych
    [midX, midY, expected, calculated, error, avgErr] = CalculateError(X, Y, A, B, C, D, fun); % Wyliczam b³¹d
    splits = splits * 2;                                    % W kolejnych iteracjach podzia³ zagêszczany jest dwukrotnie
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Kod poni¿ej mo¿na odkomentowaæ i postawiæ breakpoint na end pêtli (linia 42)  %
    % Bêd¹ wtedy rysowane przybli¿enia funkcji z kolejnych iteracji                 %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%     subplot(2,1,1);
%     mesh(midX, midY, calculated);
%     title("Calculated ("+splits+" splits)");
%     subplot(2,1,2);
%     mesh(midX, midY, error);
%     title("Error = " + avgErr);
end
splits = splits / 2;            % Na koniec pêtli splits jest podwajane, wiêc w tym miejscu zmniejszam, zeby opisywa³ wykorzystan¹ wartoœæ
end

