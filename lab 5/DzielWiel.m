function [res] = DzielWiel(fun, x, x0)
%DZIELWIEL Symuluj� dzielenie wielomianu przez jego miejsca zerowe.
%Wyznaczam warto�� w punkcie x

% divisor = 1;
% for elem = x0
%     divisor = divisor * (x - elem);
% end
% res = fun(x) / divisor;
% end

res = fun(x) / prod(x - x0);
end

