function [res] = CompareArrays(arr1, arr2, epsilon)
%COMPAREARRAYS Por�wnanie warto�ci element�w dw�ch wektor�w z dopuszczalnym
%b��dem
%   arr1, arr2 - por�wnywane wektory
%   epsilon - maksymalna dopuszczalna r�nica mi�dzy odpowiednimi elemntami
%   res - zmienna boolowska, okre�la r�wno�� wektor�w
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

