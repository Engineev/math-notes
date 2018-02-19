function [res, cnt] = Steffensen(phi, x0, eps)
    cnt = 1;
    psi = @(x)( x - (phi(x) - x).^2 ./ (phi(phi(x)) - 2 .* phi(x) + x));
    res = psi(x0);
    while abs(res - x0) >= eps
        x0 = res;
        res = psi(res);
        cnt = cnt + 1;
    end
end