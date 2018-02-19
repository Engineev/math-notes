function yy = Newton(x,y,xx)
% Input: (x,y)  - 已知的插值对
%         xx    - 插值函数在 xx 处求值
% Output: yy    - 插值函数在 xx 处的函数值

n = length(x); N = length(xx);

% ------- 计算均差 -------------------------
dif0 = zeros(n-1,1); % 均差的第一个
dif = y; % 用到的各阶均差
for i = 1:n-1
    y1 = dif(2:end)-dif(1);   % 这里 end 不能写成 n, 因为逐渐缩小
    x1 = x(i+1:n)-x(i);
    
    dif = y1./x1; % “一阶”均差
    dif0(i) = dif(1); % 记录下均差的第一个分量  
end

% ------- 计算连乘积, 同时乘以均差求出 Newton 多项式 ---------
yy = y(1)*ones(N,1); 
w0 = xx - x(1);
for i = 1:n-1    
    yy = yy + dif0(i)*w0;    
    w1 = xx-x(i+1);
    w0 = w0.*w1;    
end