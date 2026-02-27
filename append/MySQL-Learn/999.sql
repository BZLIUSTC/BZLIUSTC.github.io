-- 1.1
select dept.deptno, dept.dname, t1.部门平均工资, t1.部门最高工资, t1.SAL_DIFF
from dept join (
select deptno as deptno, avg(sal) as 部门平均工资, max(sal) as 部门最高工资, avg(sal)-(select avg(sal) from emp) as SAL_DIFF
from emp 
group by deptno) as t1
on dept.deptno = t1.deptno and t1.部门平均工资>2000
order by t1.部门最高工资 desc

-- 1.2
select t1.ename as worker , t1.sal as income , 
(case when t2.ename is not null then t2.ename else '无' end) as 上级姓名, 
(case when t2.ename is not null then t2.sal else '无' end) as 上级工资
from emp as t1 left join emp as t2
on t1.mgr = t2.empno
order by t1.deptno asc, t1.sal desc


-- 2.1
select t2.name as 学生姓名,  course.cname as 课程, t2.score as 成绩
from course join (
    select st.sname as name, t1.cid as cid, t1.score as score from student st join (
        select * from score where exam_date like '2026-01-%'
    ) as t1
    on st.sid = t1.sid
) as t2
on course.cid= t2.cid
where t2.score is not null and t2.score > 80 
order by course.cname asc, t2.score desc;

-- 2.2
select  course.cname as 课程名, count(score.score) as 参考人数, avg(score.score) as 平均分, max(score.score) as 最高分, min(score.score) as 最低分
from course left join score
on course.cid = score.cid
group by course.cid
having 平均分> 85 
order by 平均分 desc

-- 2.3
select student.sname as 姓名, count(ifnull(score.sid, 0)) as 所选课程数, sum(ifnull(score.score,0)) as 总成绩 
-- 修改建议：是count(score.sid)不是count(ifnull(score.sid, 0))
from student left join score on student.sid=score.sid
group by student.sid
order by 总成绩 desc, 姓名 asc;

-- 2.4
select student.sname as 姓名, student.gender as 性别, gsc.score as 成绩, (select avg(score) from course join score on course.cname='Mathematics' and course.cid=score.cid) as 平均分
from student join 
(select sid, score 
from course join score on course.cname='Mathematics' and course.cid=score.cid
where score > (select avg(score) from course join score on course.cname='Mathematics' and course.cid=score.cid)) as gsc
on student.sid = gsc.sid


select student.sname as 姓名, ss.数学成绩, ss.英语成绩, ss.物理成绩, ss.语文成绩
from student join 
	(select 
	sid,
		# 构造数学成绩列
		max(case cid when 2001 then score else 0 end) as 数学成绩,
		max(case cid when 2002 then score else 0 end) as 英语成绩,
		max(case cid when 2003 then score else 0 end) as 物理成绩,
		max(case cid when 2004 then score else 0 end) as 语文成绩
	from score
	group by sid) as ss
on student.sid = ss.sid





select student.sname as 姓名, 'Math' as 'COURSE', ss.数学成绩 as SCORE
from student join 
	(select 
	sid,
		max(case cid when 2001 then score else 0 end) as 数学成绩,
		max(case cid when 2002 then score else 0 end) as 英语成绩,
		max(case cid when 2003 then score else 0 end) as 物理成绩,
		max(case cid when 2004 then score else 0 end) as 语文成绩
	from score
	group by sid) as ss on student.sid = ss.sid
union 
select student.sname as 姓名, 'English' as COURSE, ss2.英语成绩 as SCORE
from student join 
	(select 
	sid,
		max(case cid when 2001 then score else 0 end) as 数学成绩,
		max(case cid when 2002 then score else 0 end) as 英语成绩,
		max(case cid when 2003 then score else 0 end) as 物理成绩,
		max(case cid when 2004 then score else 0 end) as 语文成绩
	from score
	group by sid) as ss2 on student.sid = ss2.sid
union 
select student.sname as 姓名, 'Physics' as COURSE, ss2.物理成绩 as SCORE
from student join 
	(select 
	sid,
		max(case cid when 2001 then score else 0 end) as 数学成绩,
		max(case cid when 2002 then score else 0 end) as 英语成绩,
		max(case cid when 2003 then score else 0 end) as 物理成绩,
		max(case cid when 2004 then score else 0 end) as 语文成绩
	from score
	group by sid) as ss2 on student.sid = ss2.sid
union 
select student.sname as 姓名, 'Chinese' as COURSE, ss2.语文成绩 as SCORE
from student join 
	(select 
	sid,
		max(case cid when 2001 then score else 0 end) as 数学成绩,
		max(case cid when 2002 then score else 0 end) as 英语成绩,
		max(case cid when 2003 then score else 0 end) as 物理成绩,
		max(case cid when 2004 then score else 0 end) as 语文成绩
	from score
	group by sid) as ss2 on student.sid = ss2.sid