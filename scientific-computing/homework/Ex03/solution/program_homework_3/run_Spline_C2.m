clc;clear
n = 11; N = 51;
x0 = -1; xn = 1;

% ---- 精确解 -------
syms t; f = 1./(1+25*t.^2); 
x = linspace(x0,xn,n)';  y = double(subs(f,x));
xx = linspace(x0,xn,N)'; yy0 = double(subs(f,xx));

% ---- 边界条件 1 --------
df = diff(f);
df0 = subs(df,x(1));  dfn = subs(df,x(n));
dfc = [df0;dfn]; dfc = double(dfc);

yy1 = Spline_C1(x,y,xx,dfc);    

% ---- 边界条件 2 --------
d2f = diff(f,2);
df0 = subs(d2f,x(1));  dfn = subs(d2f,x(n));
dfc = [df0;dfn]; dfc = double(dfc);
yy2 = Spline_C2(x,y,xx,dfc); 

figure,
plot(xx,yy0,'r'), hold
plot(xx,yy1,'--o',xx,yy2,'-*k','linewidth',1)
legend('f(x)','S_1(x)','S_2(x)')

% gtext('n = 10')