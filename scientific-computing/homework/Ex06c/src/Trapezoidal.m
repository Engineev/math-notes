function result = Trapezoidal(f, a, b, n)
    h = (b - a) / n;
    X = linspace(a, b, n + 1);
    Y = f(X);
    Y(1) = Y(1) / 2;
    Y(end) = Y(end) / 2;
    result = h * sum(Y);
end