clc;clear;
%% ��ʼ��
p = [5 6 2 9 7 6]; n = length(p)-1;

%% �������ž��� m �Ͷϵ���� s
[m,s] = compute_ms(p);

%% ��ӡ���������������ı��ļ�������ȡ�ַ���
fid = fopen('getstr.txt','wt'); % �½���Ϊ getstr.txt ���ı��ļ�
fprintf('The printed result: \n\n');
print_optimal_parens(fid,s,1,n) % �ݹ��ӡ�ַ���
fprintf('\n');
a = importdata('getstr.txt');  % ��ȡ������ getstr �е��ַ���
a = char(a)

%% ������ɾ��󣬼������˻��ʹ���
[sume,sums,Ae,A] = MultiplicationA(p,a)
