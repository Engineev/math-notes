function yy = Lagrange(x,y,xx)
% Input: (x,y)  - 已知的插值对
%         xx    - 插值函数在 xx 处求值
% Output: yy    - 插值函数在 xx 处的函数值

n = length(x); N = length(xx);
lag = zeros(n,1); % 基函数在 xx 处的值
yy = zeros(N,1);   % 插值函数在 xx 处的值
for i = 1:N
    for k = 1:n
        Num1 = xx(i)-x; Num1(k) = [];    Num = prod(Num1);
        Den1 = x(k)-x;  Den1(k) = [];    Den = prod(Den1);
        lag(k) = Num/Den;
    end
    yy(i) = dot(y,lag);
end