function ansY = cubicSpline(px, py, qx, type)
    if string(type) ~= 'period'
        fp0 = py(1);
        fpn = py(end);
        py = py(2:end-1);
    end
    h = px(2:end) - px(1:end-1);
    % divided difference
    dd = (py(2:end) - py(1:end-1)) ./ (px(2:end) - px(1:end-1));
    
    lambda = [1, h(2:end) ./ (h(1:end-1) + h(2:end)), 1];
    mu = [1, h(1:end-1) ./ (h(1:end - 1) + h(2:end)), 1];
    d = [0; 6 * ((dd(2:end) - dd(1:end-1)) ./ (h(2:end) + h(1:end-1)))'; 0];
    
    if string(type) == 'endslope'
        d(1) = 6 / h(1) * (dd(1) - fp0);
        d(end) = 6 / h(end) * (fpn - dd(end));
        A = 2 * eye(length(d)) + diag(mu(2:end), -1) + diag(lambda(1:end-1), 1);
        M = linsolve(A, d);
    elseif string(type) == 'moment'
        lambda(1) = 0;
        mu(end) = 0;
        d(1) = 2 * fp0;
        d(end) = 2 * fpn;
        A = 2 * eye(length(d)) + diag(mu(2:end), -1) + diag(lambda(1:end-1), 1);
        M = linsolve(A, d);
    elseif string(type) == 'period'
        lambda(end) = h(1) ./ (h(end) + h(1));
        mu(end) = 1 - lambda(end);
        d(end) = 6 * (dd(1) - dd(end)) ./ (h(1) + h(end));
        A = 2 * eye(length(d)) + diag(mu(2:end), -1) + diag(lambda(1:end-1), 1);
        A = A(2:end, 2:end);
        d = d(2:end);
        A(1, end) = mu(1);
        A(end, 1) = lambda(end);
        M = linsolve(A, d);
        M = [M(end); M];
    else
        error("Undefined type");
    end
    
    M = M';
    pos = discretize(qx, px);
    ansY = M(pos) .* (px(pos + 1) - qx).^3 ./ 6 ./ h(pos) + ...
           M(pos + 1) .* (qx - px(pos)).^3 ./ 6 ./ h(pos) + ...
           (py(pos) - M(pos) .* h(pos).^2 / 6) .* (px(pos + 1) - qx) ./ h(pos) + ...
           (py(pos + 1) - M(pos + 1) .* h(pos).^2 / 6) .* (qx - px(pos)) ./ h(pos);
end