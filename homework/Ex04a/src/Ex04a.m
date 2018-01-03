drawX = linspace(0, 1, 100);

px = [0, 0.1,  0.2, 0.3,  0.5,  0.8,  1];
py = [1, 0.41, 0.5, 0.61, 0.91, 2.02, 2.46];

drawY = foo(4, px, py, drawX);
hold on
plot(px, py, 'o', drawX, drawY, 'r-');

p = polyfit(px, py, 3);
plot(drawX, polyval(p, drawX), 'g--');
hold off

function drawY = foo(n, px, py, drawX)
    % just a helper function
    m = length(px);
    P = orthPoly(m, px);
    cof = orthCoefficient(n, px, py, P);
    drawY = calcPoly(n, cof, P, drawX);
end

function P = orthPoly(n, px)
    % return the first n legendre polynomial
    P = cell(n, 1);
    P{1} = @(x)ones(1, length(x));
    alpha = (px * ((P{1}(px)).^2)') / (P{1}(px) * (P{1}(px))');
    P{2} = @(x)(x-alpha);
    for i = 3:n
       alpha = (px * ((P{i-1}(px)).^2)') / (P{i-1}(px) * (P{i-1}(px))');
       beta  = (P{i-1}(px) * (P{i-1}(px))') / ((P{i-2}(px) * (P{i-2}(px))'));
       P{i} = @(x)( (x-alpha) .* P{i-1}(x) - beta .* P{i-2}(x));
    end
end

function cof = orthCoefficient(n, px, py, P)
    % return the first n coefficient
    % px are the sample points and P are the orthogonal polynomials
    cof = zeros(1, n);
    for k = 1:n 
        cof(k) = (py * (P{k}(px))') / (P{k}(px) * P{k}(px)');
    end
end

function res = calcPoly(n, cof, P, qx)
    res = zeros(1, length(qx));
    for i = 1:n
        res = res + cof(i) .* P{i}(qx);
    end
end