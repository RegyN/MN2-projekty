function [x, error] = GaussJordanElim(A, B)
% GAUSSJORDANELIM Rozwi¹¿ uk³ad równañ w reprezentacji macierzowej AX=B
% wykorzystuj¹c metodê Gaussa-Jordana
%   Argumenty:
%   - A - macierz o rozmiarze nxn
%   - B - macierz o rozmiarze nxm
%   Wyjœcia:
%   - x - macierz szukana nxm
n = size(A, 1);
m = size(B, 2);
error = 0;
if( size(A, 2) ~= n || size(B, 1) ~= n) % Sprawdzam czy wymiary macierzy s¹ odpowiednie
    error = 1;
    x = -1;
    disp("B£¥D: Nieprawid³owy rozmiar macierzy! Ma byæ A=nxn, B=nxm")
    return;
end
AB = [A, B];        % Sklejam A i B, ¿eby móc je razem transformowaæ (przyspiesza dzia³anie)
for i = 1:n
    if(AB(i, i) == 0)                % Jeœli na diagonali jest 0
        row = find(AB(i:n, i), 1);   % szukam w kolumnie pod nim wartoœci niezerowej
        if(size(row) < 1)            % w wypadku jej braku
            error = 2;               % koñczê dzia³anie funkcji b³êdem
            x = -1;
            disp("B£¥D: 0 na diagonali, którego nie da siê zamieniæ!")
            return;
        end
        AB([row+i-1, i], :) = AB([i, row+i-1], :); % Zamieniam wiersze tak, ¿eby przesun¹æ 0 z g³ównej przek¹tnej
    end
    AB(i,:) = AB(i, :) / AB(i, i);    % Przygotowujê wiersz dziel¹c go tak, ¿eby by³o 1 na przek¹tnej
    dif = AB(:, i);                  % Sprawdzam z jakim wspó³czynnikiem trzeba dodaæ obecny wiersz do innych, by otrzymaæ 0 w kolumnie
    dif(i) = 0;                      % Do obecnego wiersza nie chcê nic dodawaæ
    AB = AB - dif * AB(i, :);
end
x = AB(:, n+1:n+m);     % Wynikiem s¹ kolumny ze sklejonej macierzy odpowiadaj¹ce kolumnom macierzy wejœciowej B
end
