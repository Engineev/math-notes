drawX = linspace(0, 1, 100);

px = [0, 0.1,  0.2, 0.3,  0.5,  0.8,  1];
py = [1, 0.41, 0.5, 0.61, 0.91, 2.02, 2.46];
py = log(py);

drawY = polyfitn(3, px, py, drawX);
plot(px, exp(py), 'o', drawX, exp(drawY), 'r-');
