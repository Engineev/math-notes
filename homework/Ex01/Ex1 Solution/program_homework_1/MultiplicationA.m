function [sume,sums,Ae,A] = MultiplicationA(p,a)
n = length(p)-1; sume = prod(p);
% �����̶����������
ss = rng;
for i = 1:n
    A{i} = rand(p(i),p(i+1));
end
rng(ss)

Ae = A{1}; 
for i = 2:n
    Ae = Ae*A{i};  % ֱ����˵Ľ��
end    

%% ����
sums = 0;
while n >= 2 % n ����Ϊ 2
    [p,A,a,sums] = newstring(p,A,a,sums);    
    n = length(p)-1; 
end
A = A{1}; 