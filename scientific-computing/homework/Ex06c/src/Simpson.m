function result = Simpson(f, a, b, n)
    h = (b - a) ./ n;
    X1 = linspace(a, b, n + 1);
    X2 = X1(1:end-1) + 0.5 * h;
    Y1 = f(X1);
    Y1(1) = Y1(1) / 2; 
    Y1(end) = Y1(end) / 2;
    Y2 = f(X2);
    result = h / 6 * (2 * sum(Y1) + 4 * sum(Y2));
end
