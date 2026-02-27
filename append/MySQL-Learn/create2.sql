-- 创建学生表
CREATE TABLE student (
    stu_id VARCHAR(20) NOT NULL COMMENT '学号(字母+数字)',
    stu_name VARCHAR(50) NOT NULL COMMENT '姓名(英文)',
    phone CHAR(11) NOT NULL COMMENT '11位手机号',
    address VARCHAR(6) NOT NULL COMMENT '6位邮编',
    PRIMARY KEY (stu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生信息表';

-- 创建课程表
CREATE TABLE course (
    course_id VARCHAR(20) NOT NULL COMMENT '课程号(字母+数字)',
    course_name VARCHAR(100) NOT NULL COMMENT '课程名(英文)',
    assess_type ENUM('bin', 'grade', 'point') NOT NULL COMMENT '考核等级类型',
    PRIMARY KEY (course_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程信息表';

-- 创建成绩表
CREATE TABLE score (
    stu_id VARCHAR(20) NOT NULL COMMENT '学号',
    course_id VARCHAR(20) NOT NULL COMMENT '课程号',
    score INT NOT NULL COMMENT '成绩',
    score_date DATE NOT NULL COMMENT '出分日期',
    PRIMARY KEY (stu_id, course_id), -- 复合主键保证一个学生一门课只有一个成绩
    FOREIGN KEY (stu_id) REFERENCES student(stu_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生成绩表';

-- -------------------------- 插入学生表数据（50条，学号不连续） --------------------------
INSERT INTO student (stu_id, stu_name, phone, address) VALUES
('S8976', 'Emma Wilson', '13800138000', '100001'),
('S7823', 'Liam Davis', '13900139001', '200002'),
('S9187', 'Olivia Taylor', '13700137002', '300003'),
('S6542', 'Noah Martinez', '13600136003', '400004'),
('S8395', 'Ava Anderson', '13500135004', '500005'),
('S7148', 'Elijah Thomas', '13400134005', '600006'),
('S9561', 'Sophia Jackson', '13300133006', '700007'),
('S6874', 'Lucas White', '13200132007', '800008'),
('S8259', 'Mia Harris', '13100131008', '900009'),
('S7483', 'Benjamin Martin', '13000130009', '010010'),
('S9376', 'Isabella Thompson', '18900189010', '020011'),
('S6789', 'Henry Garcia', '18800188011', '030012'),
('S8542', 'Amelia Martinez', '18700187012', '040013'),
('S7915', 'Alexander Robinson', '18600186013', '050014'),
('S9827', 'Charlotte Clark', '18500185014', '060015'),
('S6438', 'James Rodriguez', '18400184015', '070016'),
('S8765', 'Amelia Lewis', '18300183016', '080017'),
('S7592', 'Daniel Walker', '18200182017', '090018'),
('S9648', 'Harper Young', '18100181018', '100019'),
('S6935', 'Matthew Hall', '18000180019', '110020'),
('S8471', 'Evelyn Allen', '17900179020', '120021'),
('S7286', 'Joseph Wright', '17800178021', '130022'),
('S9453', 'Abigail Scott', '17700177022', '140023'),
('S6798', 'Samuel Green', '17600176023', '150024'),
('S8129', 'Emily Adams', '17500175024', '160025'),
('S7845', 'David Baker', '17400174025', '170026'),
('S9267', 'Elizabeth Gonzalez', '17300173026', '180027'),
('S6581', 'Joseph Nelson', '17200172027', '190028'),
('S8934', 'Sofia Carter', '17100171028', '200029'),
('S7659', 'Andrew Mitchell', '17000170029', '210030'),
('S9782', 'Victoria Perez', '16900169030', '220031'),
('S6347', 'Ryan Roberts', '16800168031', '230032'),
('S8695', 'Grace Phillips', '16700167032', '240033'),
('S7318', 'Nathan Evans', '16600166033', '250034'),
('S9541', 'Chloe Turner', '16500165034', '260035'),
('S6829', 'Jackson Campbell', '16400164035', '270036'),
('S8457', 'Avery Parker', '16300163036', '280037'),
('S7983', 'Scarlett Edwards', '16200162037', '290038'),
('S9168', 'Gabriel Collins', '16100161038', '300039'),
('S6742', 'Victoria Stewart', '16000160039', '310040'),
('S8875', 'Julian Sanchez', '15900159040', '320041'),
('S7529', 'Luna Morris', '15800158041', '330042'),
('S9346', 'Isaac Rogers', '15700157042', '340043'),
('S6481', 'Ellie Reed', '15600156043', '350044'),
('S8279', 'Levi Cook', '15500155044', '360045'),
('S7754', 'Zoe Morgan', '15400154045', '370046'),
('S9863', 'Charles Bell', '15300153046', '380047'),
('S6987', 'Penelope Murphy', '15200152047', '390048'),
('S8519', 'Jaxon Bailey', '15100151048', '400049'),
('S7436', 'Layla Rivera', '15000150049', '410050');

-- -------------------------- 插入课程表数据（6条，覆盖3种考核类型） --------------------------
INSERT INTO course (course_id, course_name, assess_type) VALUES
('C8901', 'Computer Science', 'bin'),       -- 二等级
('C7823', 'Mathematics Analysis', 'grade'), -- 五等级
('C6547', 'English Composition', 'point'),  -- 百分制
('C9182', 'Data Structure', 'bin'),         -- 二等级
('C8359', 'Physics Principles', 'grade'),   -- 五等级
('C7641', 'Programming Basics', 'point');   -- 百分制

-- -------------------------- 插入成绩表数据（满足选课3-6门，成绩规则） --------------------------
-- 学生S8976（选6门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8976', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8976', 'C7823', 80, '2024-01-16');
INSERT INTO score (stu_id, course_id, score_date) VALUES ('S8976', 'C6547', 88, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8976', 'C9182', 60, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8976', 'C8359', 90, '2024-01-19');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8976', 'C7641', 95, '2024-01-20');

-- 学生S7823（选3门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7823', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7823', 'C7823', 70, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7823', 'C6547', 75, '2024-01-17');

-- 学生S9187（选4门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9187', 'C9182', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9187', 'C8359', 60, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9187', 'C7641', 82, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9187', 'C6547', 68, '2024-01-18');

-- 学生S6542（选5门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6542', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6542', 'C7823', 100, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6542', 'C6547', 92, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6542', 'C9182', 100, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6542', 'C8359', 80, '2024-01-19');

-- 学生S8395（选6门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8395', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8395', 'C7823', 90, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8395', 'C6547', 77, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8395', 'C9182', 60, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8395', 'C8359', 70, '2024-01-19');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8395', 'C7641', 89, '2024-01-20');

-- 学生S7148（选4门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7148', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7148', 'C7823', 80, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7148', 'C6547', 59, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7148', 'C7641', 98, '2024-01-18');

-- 学生S9561（选3门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9561', 'C9182', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9561', 'C8359', 100, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9561', 'C7641', 72, '2024-01-17');

-- 剩余43名学生的成绩数据（示例规则：随机3-6门课，符合成绩类型约束）
-- 学生S6874（选5门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6874', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6874', 'C7823', 70, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6874', 'C6547', 85, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6874', 'C9182', 60, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6874', 'C8359', 80, '2024-01-19');

-- 学生S8259（选6门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8259', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8259', 'C7823', 90, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8259', 'C6547', 66, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8259', 'C9182', 100, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8259', 'C8359', 60, '2024-01-19');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8259', 'C7641', 100, '2024-01-20');

-- 学生S7483（选3门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7483', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7483', 'C6547', 79, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7483', 'C7641', 88, '2024-01-17');

-- 学生S9376（选4门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9376', 'C7823', 80, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9376', 'C6547', 91, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9376', 'C9182', 60, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9376', 'C8359', 90, '2024-01-18');

-- 学生S6789（选5门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6789', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6789', 'C7823', 100, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6789', 'C6547', 45, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6789', 'C9182', 100, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6789', 'C7641', 78, '2024-01-19');

-- 学生S8542（选6门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8542', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8542', 'C7823', 70, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8542', 'C6547', 83, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8542', 'C9182', 60, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8542', 'C8359', 80, '2024-01-19');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8542', 'C7641', 92, '2024-01-20');

-- 学生S7915（选3门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7915', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7915', 'C8359', 100, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7915', 'C7641', 67, '2024-01-17');

-- 学生S9827（选4门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9827', 'C7823', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9827', 'C6547', 87, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9827', 'C9182', 100, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9827', 'C7641', 94, '2024-01-18');

-- 学生S6438（选5门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6438', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6438', 'C7823', 90, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6438', 'C6547', 72, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6438', 'C9182', 60, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6438', 'C8359', 70, '2024-01-19');

-- 学生S8765（选6门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8765', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8765', 'C7823', 80, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8765', 'C6547', 95, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8765', 'C9182', 100, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8765', 'C8359', 60, '2024-01-19');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8765', 'C7641', 81, '2024-01-20');

-- 学生S7592（选3门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7592', 'C6547', 89, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7592', 'C9182', 60, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7592', 'C7641', 76, '2024-01-17');

-- 学生S9648（选4门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9648', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9648', 'C7823', 70, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9648', 'C8359', 80, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9648', 'C7641', 69, '2024-01-18');

-- 学生S6935（选5门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6935', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6935', 'C7823', 100, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6935', 'C6547', 58, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6935', 'C9182', 100, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6935', 'C8359', 90, '2024-01-19');

-- 学生S8471（选6门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8471', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8471', 'C7823', 80, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8471', 'C6547', 74, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8471', 'C9182', 60, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8471', 'C8359', 70, '2024-01-19');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8471', 'C7641', 97, '2024-01-20');

-- 学生S7286（选3门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7286', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7286', 'C6547', 86, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7286', 'C8359', 100, '2024-01-17');

-- 学生S9453（选4门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9453', 'C7823', 90, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9453', 'C6547', 63, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9453', 'C9182', 100, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9453', 'C7641', 84, '2024-01-18');

-- 学生S6798（选5门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6798', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6798', 'C7823', 60, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6798', 'C6547', 98, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6798', 'C9182', 60, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6798', 'C8359', 80, '2024-01-19');

-- 学生S8129（选6门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8129', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8129', 'C7823', 70, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8129', 'C6547', 88, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8129', 'C9182', 100, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8129', 'C8359', 90, '2024-01-19');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8129', 'C7641', 73, '2024-01-20');

-- 学生S7845（选3门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7845', 'C9182', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7845', 'C8359', 70, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7845', 'C7641', 85, '2024-01-17');

-- 学生S9267（选4门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9267', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9267', 'C7823', 80, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9267', 'C6547', 71, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9267', 'C7641', 92, '2024-01-18');

-- 学生S6581（选5门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6581', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6581', 'C7823', 100, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6581', 'C6547', 69, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6581', 'C9182', 100, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6581', 'C7641', 87, '2024-01-19');

-- 学生S8934（选6门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8934', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8934', 'C7823', 90, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8934', 'C6547', 82, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8934', 'C9182', 60, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8934', 'C8359', 60, '2024-01-19');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8934', 'C7641', 99, '2024-01-20');

-- 学生S7659（选3门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7659', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7659', 'C6547', 94, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7659', 'C8359', 80, '2024-01-17');

-- 学生S9782（选4门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9782', 'C7823', 70, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9782', 'C6547', 77, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9782', 'C9182', 100, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9782', 'C7641', 68, '2024-01-18');

-- 学生S6347（选5门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6347', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6347', 'C7823', 80, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6347', 'C6547', 55, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6347', 'C9182', 60, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6347', 'C8359', 90, '2024-01-19');

-- 学生S8695（选6门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8695', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8695', 'C7823', 100, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8695', 'C6547', 85, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8695', 'C9182', 100, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8695', 'C8359', 70, '2024-01-19');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8695', 'C7641', 83, '2024-01-20');

-- 学生S7318（选3门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7318', 'C9182', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7318', 'C8359', 100, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7318', 'C7641', 79, '2024-01-17');

-- 学生S9541（选4门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9541', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9541', 'C7823', 90, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9541', 'C6547', 66, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9541', 'C7641', 91, '2024-01-18');

-- 学生S6829（选5门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6829', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6829', 'C7823', 70, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6829', 'C6547', 92, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6829', 'C9182', 100, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6829', 'C8359', 80, '2024-01-19');

-- 学生S8457（选6门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8457', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8457', 'C7823', 80, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8457', 'C6547', 78, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8457', 'C9182', 60, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8457', 'C8359', 90, '2024-01-19');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8457', 'C7641', 88, '2024-01-20');

-- 学生S7983（选3门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7983', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7983', 'C6547', 81, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7983', 'C7641', 72, '2024-01-17');

-- 学生S9168（选4门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9168', 'C7823', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9168', 'C6547', 95, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9168', 'C9182', 100, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9168', 'C8359', 70, '2024-01-18');

-- 学生S6742（选5门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6742', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6742', 'C7823', 100, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6742', 'C6547', 75, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6742', 'C9182', 60, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6742', 'C8359', 80, '2024-01-19');

-- 学生S8875（选6门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8875', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8875', 'C7823', 70, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8875', 'C6547', 89, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8875', 'C9182', 100, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8875', 'C8359', 100, '2024-01-19');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8875', 'C7641', 94, '2024-01-20');

-- 学生S7529（选3门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7529', 'C9182', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7529', 'C8359', 80, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7529', 'C7641', 67, '2024-01-17');

-- 学生S9346（选4门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9346', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9346', 'C7823', 80, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9346', 'C6547', 73, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9346', 'C7641', 96, '2024-01-18');

-- 学生S6481（选5门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6481', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6481', 'C7823', 90, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6481', 'C6547', 84, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6481', 'C9182', 100, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6481', 'C8359', 60, '2024-01-19');

-- 学生S8279（选6门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8279', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8279', 'C7823', 100, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8279', 'C6547', 90, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8279', 'C9182', 60, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8279', 'C8359', 70, '2024-01-19');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8279', 'C7641', 86, '2024-01-20');

-- 学生S7754（选3门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7754', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7754', 'C6547', 97, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7754', 'C7641', 78, '2024-01-17');

-- 学生S9863（选4门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9863', 'C7823', 70, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9863', 'C6547', 68, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9863', 'C9182', 100, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S9863', 'C8359', 90, '2024-01-18');

-- 学生S6987（选5门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6987', 'C8901', 100, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6987', 'C7823', 80, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6987', 'C6547', 74, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6987', 'C9182', 60, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S6987', 'C8359', 100, '2024-01-19');

-- 学生S8519（选6门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8519', 'C8901', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8519', 'C7823', 90, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8519', 'C6547', 87, '2024-01-17');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8519', 'C9182', 100, '2024-01-18');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8519', 'C8359', 80, '2024-01-19');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S8519', 'C7641', 93, '2024-01-20');

-- 学生S7436（选3门）
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7436', 'C9182', 60, '2024-01-15');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7436', 'C8359', 70, '2024-01-16');
INSERT INTO score (stu_id, course_id, score, score_date) VALUES ('S7436', 'C7641', 89, '2024-01-17');

-- 提交所有数据
COMMIT;