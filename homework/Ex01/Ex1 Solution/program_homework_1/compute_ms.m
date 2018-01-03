function [m,s] = compute_ms(p)

n = length(p)-1; 
%% 长度为 1 的
m = zeros(n,n); % 长度为 1 的为 0，直接初始化（只有 i <= j 的是结果)
s = zeros(n,n); % 存储断点 （只有 i <= j 的是结果)

%% 长度为 2 到 n 的
for L = 2:n
    for i = 1:n-L+1
        j = i+L-1; % 长度为 L  
        step = 1;
        for k = i:j-1 % 公式循环
            temp(step) = m(i,k) + m(k+1,j) + p(i)*p(k+1)*p(j+1);
            step = step + 1;
        end        
        tempk = (i:j-1);
        [m(i,j),ind] = min(temp);        
        s(i,j) = tempk(ind);
    end
end