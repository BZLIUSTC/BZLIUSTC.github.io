-- 创建考试数据库
CREATE DATABASE IF NOT EXISTS exam_db;
USE exam_db;

-- 1. 部门表（DEPT）
CREATE TABLE DEPT (
    DEPTNO INT(2) NOT NULL PRIMARY KEY,
    DNAME VARCHAR(14),
    LOC VARCHAR(13)
);

-- 2. 员工表（EMP）
CREATE TABLE EMP (
    EMPNO INT(4) NOT NULL PRIMARY KEY,
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR INT(4),
    HIREDATE DATE,
    SAL DOUBLE(7,2),
    COMM DOUBLE(7,2),
    DEPTNO INT(2)
);

-- 3. 工资等级表（SALGRADE）
CREATE TABLE SALGRADE (
    GRADE INT,
    LOSAL INT,
    HISAL INT
);

-- 插入测试数据
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK'),(20,'RESEARCH','DALLAS'),(30,'SALES','CHICAGO'),(40,'OPERATIONS','BOSTON');

INSERT INTO EMP VALUES 
(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10),
(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,NULL,20),
(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
(7876,'ADAMS','CLERK',7788,'1987-05-23',1100,NULL,20),
(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),
(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);

INSERT INTO SALGRADE VALUES (1,700,1200),(2,1201,1400),(3,1401,2000),(4,2001,3000),(5,3001,9999);








-- 4. 学生表（一方表：拥有方）
CREATE TABLE student (
    sid INT(4) NOT NULL PRIMARY KEY,  -- 学号（主键）
    sname VARCHAR(20) NOT NULL,       -- 姓名
    gender CHAR(1),                   -- 性别
    age INT(2)                        -- 年龄
);

-- 5. 课程表（一方表：拥有方）
CREATE TABLE course (
    cid INT(4) NOT NULL PRIMARY KEY,  -- 课程号（主键）
    cname VARCHAR(20) NOT NULL,       -- 课程名
    teacher VARCHAR(20)               -- 授课老师
);

-- 6. 成绩表（多方表：从属方，关联学生和课程的外键）
CREATE TABLE score (
    sid INT(4),                       -- 关联学生表sid（外键逻辑）
    cid INT(4),                       -- 关联课程表cid（外键逻辑）
    score INT(3),                     -- 成绩（0-100）
    exam_date DATE                    -- 考试日期
);

-- 插入测试数据（覆盖笔记中DML批处理、日期类型等知识点）
INSERT INTO student VALUES 
(1001, 'MIKE', 'M', 18),
(1002, 'ALICE', 'W', 19),
(1003, 'BOB', 'M', 18),
(1004, 'LUCY', 'W', 20),
(1005, 'JACK', 'M', 19);

INSERT INTO course VALUES 
(2001, 'Mathematics', 'Mr. Li'),
(2002, 'English', 'Ms. Wang'),
(2003, 'Physics', 'Mr. Zhang'),
(2004, 'Chinese', 'Ms. Chen');

INSERT INTO score VALUES 
(1001, 2001, 95, '2026-01-10'),
(1001, 2002, 88, '2026-01-12'),
(1001, 2003, 92, '2026-01-15'),
(1002, 2001, 82, '2026-01-10'),
(1002, 2002, 90, '2026-01-12'),
(1002, 2004, 85, '2026-01-18'),
(1003, 2001, 78, '2026-01-10'),
(1003, 2003, 86, '2026-01-15'),
(1004, 2002, 93, '2026-01-12'),
(1004, 2004, 89, '2026-01-18'),
(1005, 2001, 88, '2026-01-10'),
(1005, 2003, NULL, '2026-01-15');  -- 成绩NULL（缺考）

COMMIT;

