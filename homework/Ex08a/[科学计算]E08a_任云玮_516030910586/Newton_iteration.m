function [res, cnt] = Newton_iteration(p, x0, eps)
    f   = @(x)(polyval(p, x));
    df  = @(x)(polyval(polyder(p), x)); 
    ddf = @(x)(polyval(polyder(polyder(p)), x)); 
    varphi = @(x)(x - f(x) .*  df(x) ./ (df(x).^2 - f(x) .* ddf(x)));
    res = varphi(x0);
    cnt = 1;
    while abs(res - x0) >= eps
        x0 = res;
        res = varphi(x0);
        cnt = cnt + 1;
    end
end