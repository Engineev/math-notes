eps = 10^(-8);
phi = @(x)((x.^2 + 2 - exp(x)) ./ 3);
N = 11;
x0s = linspace(0, 1, N)';
cnti = zeros(1, N)';
for i = 1:N
    [~, cnti(i)] = direct_iteration(phi, x0s(i), eps);
end

cnts = zeros(1, N)';
for i = 1:N
    [~, cnts(i)] = Steffensen(phi, x0s(i), eps);
end