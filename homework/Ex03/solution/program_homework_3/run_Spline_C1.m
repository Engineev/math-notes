clc;clear
n = 11; N = 51; % n ��ֵ�ڵ����, N ��ͼ�ڵ����
x0 = -1; xn = 1;

% ---- ��ȷ�� -------
syms t; f = 1./(1+25*t.^2); 
x = linspace(x0,xn,n)';  y = double(subs(f,x));
xx = linspace(x0,xn,N)'; yy0 = double(subs(f,xx));

% ---- �߽����� 1 �Ա���� --------
df = diff(f);
df0 = subs(df,x(1));  dfn = subs(df,x(n));
dfc = [df0;dfn]; dfc = double(dfc);
yy1 = Spline_C1(x,y,xx,dfc); 

% ---- �߽����� 1 ϵͳ���� --------
ycs = [dfc(1);y;dfc(2)];    cs = spline(x,ycs);
yy2 = ppval(cs,xx);  

% ---- ��ͼ --------
figure,
plot(xx,yy0,'r',xx,yy1,'-k*','linewidth',1)
legend('f(x)','S(x)')
figure,
plot(xx,yy0,'r',xx,yy2,'-k*','linewidth',1)
legend('f(x)','S(x)')