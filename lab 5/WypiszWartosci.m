function [res] = WypiszWartosci(n, rysuj)
%WYPISZWARTOSCI Wypisuje i rysuje wartoœci w³asne macierzy A z zadania
if(nargin == 1)
    rysuj = false;
end
res = eig(ZbudujA(n));
if(rysuj)
    scatter(val, zeros(n, 1));
    axis([1 7 -2 2])
    disp(num2str(eig(ZbudujA(n))', "%.4f "));
end
res = res';
end

