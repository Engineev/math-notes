function print_optimal_parens(fid,s,i,j)

% fid ��Ҫ�Ѵ�ӡ�Ķ����������½����ļ� fid ��
if i == j
    fprintf('A%d',i);   
    fprintf(fid,'%d',i);
else
    fprintf('(');    fprintf(fid,'(');
    print_optimal_parens(fid,s,i,s(i,j));
    print_optimal_parens(fid,s,s(i,j)+1,j);
    fprintf(')');    fprintf(fid,')');
end
