function [ result ] = myLCG( m , a , c , x0 , maxRange)
% myLCG create random number of Linear Congruential Generators 
% formula :  a*x + c mod m
% input 
% m is the modulus, prime is the best
% a the multiplier
% c the increment
% X0 the initial seed
% maxRange is the max iteration
% output is the result of X 
res = zeros(maxRange,1);
for i = 1:maxRange
    % first iteration use x0
    if(i <= 1)
        res(i) = mod((a*x0 + c),m);
    else
        res(i) = mod((a*res(i-1) + c),m);
    end

result = res/m;
end

