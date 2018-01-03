function [m,s] = compute_ms(p)

n = length(p)-1; 
%% ����Ϊ 1 ��
m = zeros(n,n); % ����Ϊ 1 ��Ϊ 0��ֱ�ӳ�ʼ����ֻ�� i <= j ���ǽ��)
s = zeros(n,n); % �洢�ϵ� ��ֻ�� i <= j ���ǽ��)

%% ����Ϊ 2 �� n ��
for L = 2:n
    for i = 1:n-L+1
        j = i+L-1; % ����Ϊ L  
        step = 1;
        for k = i:j-1 % ��ʽѭ��
            temp(step) = m(i,k) + m(k+1,j) + p(i)*p(k+1)*p(j+1);
            step = step + 1;
        end        
        tempk = (i:j-1);
        [m(i,j),ind] = min(temp);        
        s(i,j) = tempk(ind);
    end
end