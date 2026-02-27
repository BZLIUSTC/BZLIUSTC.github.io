create index ename_index on emp(ename)
create index sal_index on emp(sal)

explain select * from emp where job='analyst' # all

explain select ename from emp # index

explain select * from emp where sal<1000 # range

explain select * from emp where sal>1000 # all 因为返回行数大于总行的 1/3

explain select * from emp where ename='smith' # ref

explain select * from emp where empno=7788 # const

# 索引失效
explain select * from emp where sal>1000 # all 因为返回行数大于总行的 1/3
explain select * from emp where sal+100=900 # all 数学运算
explain select * from emp where upper(ename)='SMITH' # all 使用函数
explain select * from emp where ename like 's%' # range 前置模糊, 并且数据行 < 1/3
explain select * from emp where ename like '%s'  # all 后置模糊，必然失效
explain select * from emp where ename like '%s%' # all  包含模糊，必然失效

insert into emp(empno,ename) values('100',123) # mysql 自动调用类型转换，把字符串'100'转为100，把数字123转为'123'
explain select * from emp where ename=123 # all MySQL使用自动类型转化时直接放弃使用索引