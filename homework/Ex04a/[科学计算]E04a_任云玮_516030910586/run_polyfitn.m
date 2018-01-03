drawX = linspace(0, 1, 100);

px = [0, 0.1,  0.2, 0.3,  0.5,  0.8,  1];
py = [1, 0.41, 0.5, 0.61, 0.91, 2.02, 2.46];

drawY = polyfitn(3, px, py, drawX);
hold on
plot(px, py, 'o');
plot(drawX, drawY, 'r-');

drawY = polyfitn(4, px, py, drawX);
plot(drawX, drawY, 'b--');
hold off