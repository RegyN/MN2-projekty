function [result, endError] = FindApprox(X, Y, draw, start)
%FINDAPPROX Znajdowanie wzoru empirycznego o bazie 1, x, x^2, e^x przy
%danym zestawie punkt�w pomiarowych, oraz graficzna reprezentacja funkcji
%aproksymuj�cej i punkt�w wej�ciowych.
% - X, Y - wektory liczb, okre�laj�cych wsp�rz�dne x i y punkt�w
% pomiarowych
% - draw - zmienna boolowska, czy ma by� rysowany wykres. Domy�lnie false.
% - start - punkt startowy poszukiwania wsp�czynnik�w. Domy�lnie [0,0,0,0]

if(nargin == 2)
    start = [0,0,0,0];
    draw = false;
elseif(nargin == 3 || size(start, 2) ~= 4)
    start = [0,0,0,0];
elseif(nargin ~= 4)
    disp('B��D: Nieprawid�owa liczba argument�w funkcji FindApprox!. Potrzeba 2-4!')
    return;
end

curError = Inf;
maxError = 0.0001 * size(X, 2); % Zamiast zawsze dzieli� obecny b��d na n, mno�� maksymalny przez n
iter = 0;
maxIter = 50;   % Warto�� graniczna liczby iteracji.
f = @(a) sum((a(1) + a(2) * X + a(3) * X .^ 2 + a(4) * exp(X) - Y) .^ 2);
fx = @(a, x) a(1) + a(2) * x + a(3) * x .^ 2 + a(4)*exp(x);
options = optimset('Display','none');

while(curError > maxError && iter < maxIter)
    cur = start + 0.5 * iter * rand(1,4) .* ones(1,4);
    params = fminsearch(f, cur, options);
    error = f(params);
    if(error < curError)
        curError = error;
        result = params;
    end
    iter = iter + 1;
end

if(draw)
    Draw(X, Y, fx, result, (curError / max(size(X))));
end

endError = curError / max(size(X));
end

