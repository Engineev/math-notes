foo = @(x) Foo(x);
[result, points] = adaptSimpson(foo, 0, 1, 10^(-4));
disp(result);
disp(points);

function [result, points] = adaptSimpson(f, a, b, eps)
    points = [a, b];
    function [] = separateInterval(l, r)
        if abs(Simpson(f, l, r, 1) - Simpson(f, l, r, 2)) / 15 ...
                > (r - l) / (b - a) * eps 
            m = (l + r) / 2;
            points(end + 1) = m;
            separateInterval(l, m);
            separateInterval(m, r);
        end
    end

    separateInterval(a, b);
    points = sort(points);
    len = length(points);
    result = 0;
    for i = 1:len-1
        result = result + Romberg(f, points(i), points(i+1), 10, ...
            (points(i+1) - points(i)) / (b - a) * eps);
    end
end

function y = Foo(x)
    y = sqrt(x) .* log(x);
    y(x == 0) = 0;
end