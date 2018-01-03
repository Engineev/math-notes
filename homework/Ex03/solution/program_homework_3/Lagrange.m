function yy = Lagrange(x,y,xx)
% Input: (x,y)  - ��֪�Ĳ�ֵ��
%         xx    - ��ֵ������ xx ����ֵ
% Output: yy    - ��ֵ������ xx ���ĺ���ֵ

n = length(x); N = length(xx);
lag = zeros(n,1); % �������� xx ����ֵ
yy = zeros(N,1);   % ��ֵ������ xx ����ֵ
for i = 1:N
    for k = 1:n
        Num1 = xx(i)-x; Num1(k) = [];    Num = prod(Num1);
        Den1 = x(k)-x;  Den1(k) = [];    Den = prod(Den1);
        lag(k) = Num/Den;
    end
    yy(i) = dot(y,lag);
end