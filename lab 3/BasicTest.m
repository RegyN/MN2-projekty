clear

fun = @(x, y) 1;
minX = -1;
maxX = 1;
minY = -1;
maxY = 1;
N = 101;
hx = (maxX-minX)/N;
hy = (maxY-minY)/N;

X = minX:(maxX-minX)/(N-1):maxX;
Y = minY:(maxY-minY)/(N-1):maxY;

base = zeros(N, 1);
area = base;
for i=1:2:N
    base(i) = 2;
end
for i=2:2:N
    base(i) = 4;
end
base(1) = 1;
base(size(base, 1)) = 1;
base = base * base';

Sum = 0;
for i=1:N-1
    [x, y] = squareToCircle(X(i), Y);
    Sum = Sum + sum(base(i, :) .* fun(x, y));
end

result = Sum * ((hx*hy)/9)