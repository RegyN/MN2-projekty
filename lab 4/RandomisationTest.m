function [scales, results] = RandomisationTest(fun)
%RANDOMISATIONTEST Test wp³ywu losowego zaburzenia na aproksymacjê.
%testowany b³¹d aproksymacji przy stopniowo rosn¹cym zaszumieniu funkcji.
% - fun - wskaŸnik na funkcjê 1 zmiennej, która bêdzie aproksymowana

scales = 0:0.01:.1;
results = [];
X = linspace(0, 5, 50);

for i = scales
    Y = fun(X).*(ones(1, 50) + i*rand(1, 50));
    [res, err] = FindApprox(X, Y, false);
    results = [results; res];
end
scales = scales';
end

