/*
# MySQL 基础语法练习题 答案
*/


/* 单选题 */
-- CBBBC ABBAB
-- BBBAA CBBCD


/* 填空题 */
-- 大小写；大小写
-- COUNT (*)；COUNT (字段名)
-- 任意长度的字符串；一个任意字符
-- 非关系型；关系型
-- FROM；LIMIT
-- .frm；表文件
-- UNION；UNION ALL
-- UNION 联合查询；自关联；GROUP BY+CASE...END
-- 0；空表
-- 一对一；一对多；多对多；3


/* 编程题一(1) */

SELECT 
    d.DEPTNO,
    d.DNAME,
    MAX(e.SAL) AS MAX_SAL,
    AVG(e.SAL) AS AVG_SAL,
    AVG(e.SAL) - (SELECT AVG(SAL) FROM EMP) AS SAL_DIFF
FROM DEPT d
JOIN EMP e ON d.DEPTNO = e.DEPTNO
GROUP BY d.DEPTNO
HAVING AVG(e.SAL) > 2000
ORDER BY MAX_SAL DESC;

/* 编程题一(2) */

SELECT 
    t1.ENAME AS EMP_NAME,
    t1.SAL AS EMP_SAL,
    IFNULL(t2.ENAME, '无') AS MGR_NAME,
    IFNULL(t2.SAL, '无') AS MGR_SAL,
    t1.DEPTNO
FROM EMP t1
LEFT JOIN EMP t2 ON t1.MGR = t2.EMPNO
ORDER BY t1.DEPTNO ASC, t1.SAL DESC;

/* 编程题二(1) */
-- 知识点：多表连接、WHERE条件（NULL判断/区间/日期）、ORDER BY多字段排序
SELECT s.sname, c.cname, sc.score
FROM student s
JOIN score sc ON s.sid = sc.sid
JOIN course c ON sc.cid = c.cid
WHERE sc.score IS NOT NULL  -- 排除缺考
  AND sc.score >= 80        -- 成绩≥80
  AND sc.exam_date LIKE '2026-01%'  -- 2026年1月考试
ORDER BY c.cname ASC, sc.score DESC;

/* 编程题二(2) */
-- 知识点：GROUP BY、聚合函数（COUNT/AVG/MAX/MIN）、HAVING、ORDER BY
SELECT c.cname AS 课程名,
       COUNT(sc.score) AS 参考人数,  -- COUNT(字段)统计非NULL值
       ROUND(AVG(sc.score), 2) AS 平均分,  -- 保留2位小数（笔记外但实用）
       MAX(sc.score) AS 最高分,
       MIN(sc.score) AS 最低分
FROM course c
JOIN score sc ON c.cid = sc.cid
GROUP BY c.cid, c.cname  -- 多字段分组（笔记核心）
HAVING AVG(sc.score) >= 85  -- HAVING筛选分组（区别于WHERE）
ORDER BY 平均分 DESC;

/* 编程题二(3) */
-- 知识点：LEFT JOIN（保留左表所有行）、IFNULL处理NULL、聚合函数
SELECT s.sname,
       COUNT(sc.cid) AS 所选课程数,  -- 统计选课数（含NULL则为0）
       IFNULL(SUM(sc.score), 0) AS 总成绩  -- 缺考不计入总成绩
FROM student s
LEFT JOIN score sc ON s.sid = sc.sid
GROUP BY s.sid, s.sname
ORDER BY 总成绩 DESC, s.sname ASC;

/* 编程题二(4) */
-- 知识点：独立子查询（效率高）、JOIN、子查询作为临时表
SELECT s.sname, s.gender, sc.score, avg_temp.课程平均分
FROM student s
JOIN score sc ON s.sid = sc.sid
-- 子查询获取Mathematics课程平均分（独立子查询，只执行一次）
JOIN (
    SELECT c.cid, AVG(sc.score) AS 课程平均分
    FROM course c
    JOIN score sc ON c.cid = sc.cid
    WHERE c.cname = 'Mathematics'
    GROUP BY c.cid
) AS avg_temp ON sc.cid = avg_temp.cid
WHERE sc.score > avg_temp.课程平均分;

/* 编程题二(5) */
-- 5.1 列转行：姓名-数学/英语/物理/语文成绩（缺考显示0）
-- 知识点：GROUP BY、CASE...END、聚合函数（MAX压缩行）
SELECT s.sname,
       MAX(CASE c.cname WHEN 'Mathematics' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 数学成绩,
       MAX(CASE c.cname WHEN 'English' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 英语成绩,
       MAX(CASE c.cname WHEN 'Physics' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 物理成绩,
       MAX(CASE c.cname WHEN 'Chinese' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 语文成绩
FROM student s
LEFT JOIN score sc ON s.sid = sc.sid
LEFT JOIN course c ON sc.cid = c.cid
GROUP BY s.sid, s.sname;

-- 5.2 行转列：转回姓名-课程名-成绩
-- 知识点：UNION联合查询、子查询作为临时表
SELECT sname, 'Mathematics' AS 课程名, 数学成绩 AS 成绩 FROM (
    SELECT s.sname,
           MAX(CASE c.cname WHEN 'Mathematics' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 数学成绩,
           MAX(CASE c.cname WHEN 'English' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 英语成绩,
           MAX(CASE c.cname WHEN 'Physics' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 物理成绩,
           MAX(CASE c.cname WHEN 'Chinese' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 语文成绩
    FROM student s
    LEFT JOIN score sc ON s.sid = sc.sid
    LEFT JOIN course c ON sc.cid = c.cid
    GROUP BY s.sid, s.sname
) AS temp
UNION
SELECT sname, 'English' AS 课程名, 英语成绩 AS 成绩 FROM (
    SELECT s.sname,
           MAX(CASE c.cname WHEN 'Mathematics' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 数学成绩,
           MAX(CASE c.cname WHEN 'English' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 英语成绩,
           MAX(CASE c.cname WHEN 'Physics' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 物理成绩,
           MAX(CASE c.cname WHEN 'Chinese' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 语文成绩
    FROM student s
    LEFT JOIN score sc ON s.sid = sc.sid
    LEFT JOIN course c ON sc.cid = c.cid
    GROUP BY s.sid, s.sname
) AS temp
UNION
SELECT sname, 'Physics' AS 课程名, 物理成绩 AS 成绩 FROM (
    SELECT s.sname,
           MAX(CASE c.cname WHEN 'Mathematics' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 数学成绩,
           MAX(CASE c.cname WHEN 'English' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 英语成绩,
           MAX(CASE c.cname WHEN 'Physics' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 物理成绩,
           MAX(CASE c.cname WHEN 'Chinese' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 语文成绩
    FROM student s
    LEFT JOIN score sc ON s.sid = sc.sid
    LEFT JOIN course c ON sc.cid = c.cid
    GROUP BY s.sid, s.sname
) AS temp
UNION
SELECT sname, 'Chinese' AS 课程名, 语文成绩 AS 成绩 FROM (
    SELECT s.sname,
           MAX(CASE c.cname WHEN 'Mathematics' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 数学成绩,
           MAX(CASE c.cname WHEN 'English' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 英语成绩,
           MAX(CASE c.cname WHEN 'Physics' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 物理成绩,
           MAX(CASE c.cname WHEN 'Chinese' THEN IFNULL(sc.score, 0) ELSE 0 END) AS 语文成绩
    FROM student s
    LEFT JOIN score sc ON s.sid = sc.sid
    LEFT JOIN course c ON sc.cid = c.cid
    GROUP BY s.sid, s.sname
) AS temp;

-- 5.3 统计每个性别的学生各课程平均分
-- 知识点：多表连接、GROUP BY多字段、聚合函数
SELECT s.gender, c.cname, ROUND(AVG(sc.score), 2) AS 平均分
FROM student s
JOIN score sc ON s.sid = sc.sid
JOIN course c ON sc.cid = c.cid
WHERE sc.score IS NOT NULL
GROUP BY s.gender, c.cname  -- 先按性别分，再按课程分（笔记核心）
ORDER BY s.gender ASC, 平均分 DESC;