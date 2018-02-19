clc;clear;
%% 初始化
p = [5 6 2 9 7 6]; n = length(p)-1;

%% 计算最优矩阵 m 和断点矩阵 s
[m,s] = compute_ms(p);

%% 打印输出结果，保存在文本文件，并读取字符串
fid = fopen('getstr.txt','wt'); % 新建名为 getstr.txt 的文本文件
fprintf('The printed result: \n\n');
print_optimal_parens(fid,s,1,n) % 递归打印字符串
fprintf('\n');
a = importdata('getstr.txt');  % 读取保存在 getstr 中的字符串
a = char(a)

%% 随机生成矩阵，计算连乘积和次数
[sume,sums,Ae,A] = MultiplicationA(p,a)
