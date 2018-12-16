fun11 = @(x, y) sin(3*x)*sin(1.5*y);
fun12 = @(x, y) sin(9*x)*sin(4.5*y);
fun21 = @(x, y) y/x;
fun22 = @(x, y) sign(x)*y;
fun3 = @(x, y) sin(x*10)*sin(y*5)*(x+y)/5 + cos(y/5)*(x*y)/15;
fun4 = @(x, y) 125*(y^7) + (x^3)/17 + (x^2)/13 + x/4 + 71*x^6*y^7;
fun5 = @(x, y) x^y;

% tablica dopuszczalnych b³êdów
epsilon = [1E-5]

% ograniczenia obszaru interpolacji
minx = -1;
maxx = 1;
miny = -1;
maxy = 1;

for i=1:size(epsilon, 2)
    tic;
    disp("Epsilon: " + epsilon(i))
    [splits, X, Y, exp, calc, err, avgErr] = BilinearOptimized(fun3, minx, maxx, miny, maxy, epsilon(i));
    disp("N: " + splits + " Time: " + toc)
end
% subplot(2,2,1);
% mesh(X, Y, calc);
% title("Calculated");
% subplot(2,2,3);
% mesh(X, Y, err);
% title("Error");
% avgErr;