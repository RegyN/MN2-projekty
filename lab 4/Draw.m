function [] = Draw(X, Y, fx, a, err)
%DRAW Funkcja do rysowania wykresu wzoru empirycznego i punktów wejœciowych
% - X, Y - wektory liczb, okreœlaj¹cych wspó³rzêdne x i y punktów
% pomiarowych
% - fx - wskaŸnik na funkcjê 1 zmiennej. Jest to wzór empiryczny uzyskany
% we wczeœniejszej fazie algorytmu
% - a - 4-elementowy wektor wspó³czynników funkcji fx
% - err - b³¹d aproksymacji, skalar.

span = max(X) - min(X);
if(span == 0)
    span = 1;
end
grid = linspace(min(X)-0.2*span, max(X)+0.2*span, 500);
values = fx(a, grid);
plot(grid, values);
title(strcat('n=', num2str(max(size(X))), '; err=', num2str(err, 3), '; params=[', num2str(a(1), 3), ', ', num2str(a(2), 3), ', ', num2str(a(3), 3), ', ', num2str(a(4), 3),']'));
xlabel('x');
ylabel('y');
hold on;
scatter(X, Y, 64, 'x');
legend({'fun. aproksymuj¹ca', 'pkt. pomiarowe'}, 'Location', 'southwest');
hold off;
drawnow;
end

