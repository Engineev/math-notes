foo = @(x) Foo(x);

N = 1:1:100;
H = 1 ./ N;
errSim = H; errTra = H;

len = length(N);
for i = 1:100
    errSim(i) = abs(-4/9 - Simpson(foo, 0, 1, N(i)));
    errTra(i) = abs(-4/9 - Trapezoidal(foo, 0, 1, N(i)));
end

figure
hold on
xlabel('h');
ylabel('Error');
plot(H, errTra, 'r-');
plot(H, errSim, 'g-');

N = 1:1:20;
H = 1 ./ 2.^(N-1);
errRom = H;
for i = 1:20
    errRom(i) = abs(-4/9 - Romberg(foo, 0, 1, N(i)));
end

plot(H, errRom, 'b-');
legend('Trapezoidal', 'Simpson', 'Romberg');
hold off

function y = Foo(x)
    y = sqrt(x) .* log(x);
    y(x == 0) = 0;
end