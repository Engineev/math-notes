function print_optimal_parens(fid,s,i,j)

% fid 是要把打印的东西保存在新建的文件 fid 中
if i == j
    fprintf('A%d',i);   
    fprintf(fid,'%d',i);
else
    fprintf('(');    fprintf(fid,'(');
    print_optimal_parens(fid,s,i,s(i,j));
    print_optimal_parens(fid,s,s(i,j)+1,j);
    fprintf(')');    fprintf(fid,')');
end
