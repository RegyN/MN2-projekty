function [res] = CompareArrays(arr1, arr2, epsilon)
%COMPAREARRAYS Porównanie wartoœci elementów dwóch wektorów z dopuszczalnym
%b³êdem
%   arr1, arr2 - porównywane wektory
%   epsilon - maksymalna dopuszczalna ró¿nica miêdzy odpowiednimi elemntami
%   res - zmienna boolowska, okreœla równoœæ wektorów
if(nargin == 2)
    epsilon = 0.000001;
end
res = true;
for i = 1:max(size(arr1))
    if(abs(arr1(i)-arr2(i)) > epsilon)
        res = false;
        return;
    end
end
end

