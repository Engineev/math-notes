function [res, cnt] = direct_iteration(phi, x0, eps)
    res = phi(x0);
    cnt = 1;
    while abs(res - x0) >= eps
        x0 = res;
        res = phi(x0);
        cnt = cnt + 1;
    end
end