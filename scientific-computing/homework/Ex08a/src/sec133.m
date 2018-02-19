eps = 10^(-8);
p   = [1 2 10 -20];
phi = @(x)(polyval(p, x));
N   = 11;
x0s = linspace(1, 2, N)';
cntn = zeros(1, N)';
for i = 1:N
    [~, cntn(i)] = Newton_iteration(p, x0s(i), eps);
end

cnts = zeros(1, N)';
for i = 1:N
    [~, cnts(i)] = Steffensen(phi, x0s(i), eps);
end