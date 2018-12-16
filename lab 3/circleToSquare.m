function [r, theta] = circleToSquare(x, y)
%CIRCLETOSQUARE Przekszta³ca ko³o o r = 1 i œrodku w (0, 0) w kwadrat[-1,1]x[-1,1]
%
    
    [r, theta] = cart2pol(x, y);
    assert( all( r>=0 && r<=1 ), "ERROR: circleToSquare - nieprawid³owe argumenty!" );
    r = r .* 2 - 1;
    theta = theta ./ pi;
end

