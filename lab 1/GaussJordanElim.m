function [x, error] = GaussJordanElim(A, B)
% GAUSSJORDANELIM Rozwi�� uk�ad r�wna� w reprezentacji macierzowej AX=B
% wykorzystuj�c metod� Gaussa-Jordana
%   Argumenty:
%   - A - macierz o rozmiarze nxn
%   - B - macierz o rozmiarze nxm
%   Wyj�cia:
%   - x - macierz szukana nxm
n = size(A, 1);
m = size(B, 2);
error = 0;
if( size(A, 2) ~= n || size(B, 1) ~= n) % Sprawdzam czy wymiary macierzy s� odpowiednie
    error = 1;
    x = -1;
    disp("B��D: Nieprawid�owy rozmiar macierzy! Ma by� A=nxn, B=nxm")
    return;
end
AB = [A, B];        % Sklejam A i B, �eby m�c je razem transformowa� (przyspiesza dzia�anie)
for i = 1:n
    if(AB(i, i) == 0)                % Je�li na diagonali jest 0
        row = find(AB(i:n, i), 1);   % szukam w kolumnie pod nim warto�ci niezerowej
        if(size(row) < 1)            % w wypadku jej braku
            error = 2;               % ko�cz� dzia�anie funkcji b��dem
            x = -1;
            disp("B��D: 0 na diagonali, kt�rego nie da si� zamieni�!")
            return;
        end
        AB([row+i-1, i], :) = AB([i, row+i-1], :); % Zamieniam wiersze tak, �eby przesun�� 0 z g��wnej przek�tnej
    end
    AB(i,:) = AB(i, :) / AB(i, i);    % Przygotowuj� wiersz dziel�c go tak, �eby by�o 1 na przek�tnej
    dif = AB(:, i);                  % Sprawdzam z jakim wsp�czynnikiem trzeba doda� obecny wiersz do innych, by otrzyma� 0 w kolumnie
    dif(i) = 0;                      % Do obecnego wiersza nie chc� nic dodawa�
    AB = AB - dif * AB(i, :);
end
x = AB(:, n+1:n+m);     % Wynikiem s� kolumny ze sklejonej macierzy odpowiadaj�ce kolumnom macierzy wej�ciowej B
end
