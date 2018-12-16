function [x, y] = squareToCircle(r, theta)
%SQUARETOCIRCLE Przekszta³ca kwadrat[-1,1]x[-1,1] w ko³o o promieniu 1 i
%œrodku w (0, 0)
%   Detailed explanation goes here

r = (r + 1) ./ 2;
theta = theta .* pi;
[x, y] = pol2cart(theta, r);
end

