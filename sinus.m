function [ res, iter ] = sinus( x )
%SINUS function
%   
%   calculate sinus of x (in radians)
    m = 2*pi;
    n = length(x);
    res = zeros(n, 1);
    iter = ones(n, 1);
    x = x - m.*floor(x./m);
    res = x;
    for j = 1:n
        prev = 0;
        while abs(res(j) - prev) > 0
            b = x(j)^(2*iter(j)+1) * (-1)^iter(j) / factorial(2*iter(j)+1);
            prev = res(j);
            res(j) = res(j) + b;
            iter(j) = iter(j) + 1;
        end
    end
end
