clear
% Sprawdzam poprawnoœæ dzia³ania funkcji
errCount = 0;
for i=1:100
    params = rand(1, 4);
    fun = @(x) params(1) + x*params(2) + x.^2*params(3) + exp(x)*params(4);
    X = 0:0.1:5;
    Y = fun(X);
    [res, ~] = FindApprox(X, Y, false);
    err = sum(params-res);
    if(err > 0.001)
        errCount = errCount + 1;
    end
end
disp(['Liczba wartoœci o b³êdzie ponad 0.001: ', num2str(errCount), '/100']);

% Sprawdzam wp³yw liczby punktów na aproksymacjê:
% Uwaga: Bêdzie kolejno 10 wykresów funkcji aproksymuj¹cej dla 1-10 punktów
PointCountTest(@(x) sin(x));

% Sprawdzam wp³yw b³êdów losowych na aproksymacjê:
expected = [11, 1, 0, 0];
fun = @(x) expected(1) + expected(2)*x + expected(3)*x.^2 + expected(4)*exp(x);
[sc, result] = RandomisationTest(fun);
err = [];
for i=1:max(size(sc))
    err = [err; sum(abs(result(i, :) - expected))];
end
format short
disp("Noise level,  Error");
disp([sc, err]);

% Ró¿ne mniej lub bardziej ciekawe testy. Najlepszy efekt, jeœli postawi
% siê breakpointy przy ka¿dym FindApprox(...)
% Prosta funkcja 1
fun = @(x) 2*x;
X = linspace(0, 10, 100);
Y = fun(X);
FindApprox(X, Y, true)

% Prosta funkcja 2
fun = @(x) 3*x - x.^2 + 1;
X = linspace(-1, 7, 100);
Y = fun(X);
FindApprox(X, Y, true);

% Jeden grzbiet sinusa
fun = @(x) sin(x);
X = linspace(0, pi, 100);
Y = fun(X);
FindApprox(X, Y, true);

% Ca³y wykres sinusa
X = linspace(-pi, pi, 100);
Y = fun(X);
FindApprox(X, Y, true);

% Prosta funkcja 1 z szumem
fun = @(x) 2*x; % +2
X = linspace(-pi, pi, 100);
Y = fun(X) + 2*rand(1, 100);
FindApprox(X, Y, true);

% Prosta funkcja 2 z szumem
fun = @(x) 3*x - x.^2 + 1; % +2.5
X = linspace(-pi, pi, 100);
Y = fun(X) + 2.5*rand(1, 100);
FindApprox(X, Y, true);

% Zwyk³y szum
X = linspace(-pi, pi, 100);
Y = rand(1, 100);
FindApprox(X, Y, true);