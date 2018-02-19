eps = 10^(-8);

phi = @(x)((x.^2 + 2 - exp(x)) ./ 3);
x0  = 0.25;

direct_iteration(phi, x0, eps)
% ans = 0.2575

phi = @(x)(-(x.^3 + 2*x^2 - 10*x - 20) ./ 20);
x0  = 1;

direct_iteration(phi, x0, eps)
% ans = 1.3688