    clc;clear
    n = 21; N = 101;
    x = linspace(-1,1,n)';  y = 1./(1+25*x.^2);

    xx = linspace(-1,1,N)';
    yy = Newton(x,y,xx);
    plot(x,y,'k',xx,yy,'--b','linewidth',2)
    legend('f(x)','L_{20}(x)')