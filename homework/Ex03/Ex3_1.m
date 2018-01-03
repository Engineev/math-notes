f = @(x) 1 ./ (1 + 25 * x.^2);

x = {linspace(-1, 1, 11), linspace(-1, 1, 21)};
y = {f(x{1}), f(x{2})};

drawX = -1 : 1/100 : 1;
ansY = f(drawX);

subplot(2, 2, 1);
plot(drawX, lagrangeInterp(x{1}, y{1}, drawX), '-', drawX, ansY, 'r--');
title('Lagrange, n = 10');
box off

subplot(2, 2, 2);
plot(drawX, lagrangeInterp(x{2}, y{2}, drawX), '-', drawX, ansY, 'r--');
title('Lagrange, n = 20');
box off

subplot(2, 2, 3);
plot(drawX, spline(x{1}, y{1}, drawX), '-', drawX, ansY, 'r--');
title('Spline, n = 10');
box off

subplot(2, 2, 4);
plot(drawX, spline(x{2}, y{2}, drawX), '-', drawX, ansY, 'r--');
title('Spline, n = 20');
box off

function ansY = lagrangeInterp(interpX, interpY, queryX)
    n = length(interpX);
    function yi = li(i, x)
        yi = 1;
        for j = 1 : n
            if (j ~= i)
                yi = yi .* ... 
                    (x - interpX(j)) ./ (interpX(i) - interpX(j));
            end
        end
    end
    
    ansY = 0;
    for i = 1 : n
        ansY = ansY + interpY(i) * li(i, queryX);
    end
end




