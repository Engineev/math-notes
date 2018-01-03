function yy = Newton(x,y,xx)
% Input: (x,y)  - ��֪�Ĳ�ֵ��
%         xx    - ��ֵ������ xx ����ֵ
% Output: yy    - ��ֵ������ xx ���ĺ���ֵ

n = length(x); N = length(xx);

% ------- ������� -------------------------
dif0 = zeros(n-1,1); % ����ĵ�һ��
dif = y; % �õ��ĸ��׾���
for i = 1:n-1
    y1 = dif(2:end)-dif(1);   % ���� end ����д�� n, ��Ϊ����С
    x1 = x(i+1:n)-x(i);
    
    dif = y1./x1; % ��һ�ס�����
    dif0(i) = dif(1); % ��¼�¾���ĵ�һ������  
end

% ------- �������˻�, ͬʱ���Ծ������ Newton ����ʽ ---------
yy = y(1)*ones(N,1); 
w0 = xx - x(1);
for i = 1:n-1    
    yy = yy + dif0(i)*w0;    
    w1 = xx-x(i+1);
    w0 = w0.*w1;    
end