function result = Romberg(f, a, b, n, eps)
    if nargin <= 4
        eps = 0;
    end
    n = n - 1;
    h = b - a;
    R = ones(n+1, n+1) * NaN;
    R(1, 1) = h / 2 * (f(a) + f(b));
    for i = 2:n+1
        h = h / 2;
        R(i, 1) = 0.5 * R(i-1, 1) + h * sum(f(a+h:2*h:b-h));
        for j = 2:i+1
            R(i, j) = (4^(j-1) * R(i, j-1) - R(i-1, j-1)) / (4^(j-1) - 1);
        end
        result = R(i, i);
        if abs(R(i, i) - R(i-1, i-1)) < eps
            return
        end
    end
    result = R(n+1, n+1);
end