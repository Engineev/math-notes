function yy = Spline_C1(x,y,xx,c1f)
% Input: (x,y)  - ��֪�Ĳ�ֵ��
%         xx    - ��ֵ������ xx ����ֵ
%         dfc   - �߽絼��
% Output: yy    - ��ֵ������ xx ���ĺ���ֵ

n = length(x); N = length(xx);
df0 = c1f(1); dfn = c1f(2);
% ------ ���ϵ������ -------------------
h = diff(x);
lam = zeros(n-1,1); lam(1) = 1;
lam(2:end) = h(2:end)./(h(1:end-1)+h(2:end));

mu = zeros(n-1,1); mu(end) = 1;
mu(1:end-1) = 1-lam(2:end);

A = 2*diag(ones(n,1))+diag(lam,1)+diag(mu,-1);

% ------ ����Ҷ� -----------------------
d = zeros(n,1);
d(1) = 6/h(1)*((y(2)-y(1))/h(1)-df0);
d(end) = 6/h(end)*(dfn-(y(end)-y(end-1))/h(end));
for j = 2:n-1
    temp1 = (y(j+1)-y(j))/h(j);
    temp2 = (y(j)-y(j-1))/h(j-1);
    d(j) = 6*(temp1-temp2)/(h(j-1)+h(j));
end

% ------ �� M ��������ֵ���
M = A\d; yy = zeros(N,1);
for i = 1:N
    for j = 1:n-1
        t = xx(i);
        if (t<=x(j+1)) && (t>=x(j))
            S = M(j)*(x(j+1)-t)^3/(6*h(j))+M(j+1)*(t-x(j))^3/(6*h(j))...
                +(y(j)-M(j)*h(j)^2/6)*(x(j+1)-t)/h(j)...
                +(y(j+1)-M(j+1)*h(j)^2/6)*(t-x(j))/h(j);
            yy(i) = S;
        end
    end
end