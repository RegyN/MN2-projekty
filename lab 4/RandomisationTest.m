function [scales, results] = RandomisationTest(fun)
%RANDOMISATIONTEST Test wp�ywu losowego zaburzenia na aproksymacj�.
%testowany b��d aproksymacji przy stopniowo rosn�cym zaszumieniu funkcji.
% - fun - wska�nik na funkcj� 1 zmiennej, kt�ra b�dzie aproksymowana

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

