function [res] = CompareArrays(arr1, arr2, epsilon)
%COMPAREARRAYS Summary of this function goes here
%   Detailed explanation goes here
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

