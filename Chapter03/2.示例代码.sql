DROP DATABASE IF EXISTS Test;
CREATE DATABASE Test;
USE Test;
#3.1.1修改表名
DROP TABLE IF EXISTS `Demo01`;
CREATE TABLE IF NOT EXISTS `Demo01`(
    `Id`   INT(10) NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(8) NOT NULL,
    PRIMARY KEY(id)
)COMMENT="示例表";
#修改表名
ALTER TABLE `Demo01` RENAME `Demo02`;

#3.1.2添加字段
ALTER TABLE Demo02 ADD COLUMN `PassWord` VARCHAR(32) NOT NULL;

#3.1.3修改字段
ALTER TABLE Demo02 CHANGE `Name` `UserName` CHAR(10) NOT NULL;

#3.1.4删除字段
ALTER TABLE Demo02 DROP COLUMN `PassWord`;

#3.1.5
#添加主键
#ALTER TABLE 表名 ADD CONSTRAINT 主键名      PRIMARY KEY 表名(主键字段);
ALTER TABLE `Grade` ADD CONSTRAINT `PK_Grade` PRIMARY KEY `Grade`(`GradeId`);

#添加外键
#ALTER TABLE 表名 ADD CONSTRAINT 外键名  PRIMARY KEY 外键字段 REFERENCES 关联表名(关联字段)
ALTER TABLE `Student` ADD CONSTRAINT `FK_Student_Grade` FOREIGN KEY (`GradeId`);
REFERENCES `Grade`(`GradeId`);


#3.2.1.1插入数据记录
USE MySchool;
INSERT INTO `Student`(`LoginPwd`,`StudentName`,`GradeId`,`Phone`,`BornDate`)
VALUES('123','黄小平',1,'13956799999','1996-5-8');

DELETE FROM `Student` WHERE `StudentNo`=0;

#3.2.1.2插入多行数据
INSERT INTO `Subject`(`SubjectName`,`ClassHour`,`GradeId`)
VALUES('Login Java',220,1),('HTML',160,1),('Java OOP',230,2);







#3.2.1.3将查询结果插入到新表
#语法1:必须要先创建新表，然后在执行语句
-- insert into 新表(字段1,字段2)
-- SELECT 字段1,字段2
-- FROM 原表
INSERT INTO `PhoneList`(`StudentNo`,`Phone`)
SELECT `StudentNo`,`Phone`
FROM `Student`
#语法2:执行语句后会创建出表,并把数据添加到表中
DROP TABLE IF EXISTS `PhoneList`;
CREATE TABLE `PhoneList`
(SELECT `StudentName`,`Phone` FROM `Student`);


#3.2.2更新数据记录
UPDATE `Student`
SET `Phone`='13810145778',`Address`='北京市海淀区燕东园23-1-101'
WHERE `StudentNo`=10011;

#3.2.3.1删除数记录
DELETE FROM `PhoneList` WHERE `StudentName`='黄小平';

#3.2.3.2TRANCATE删除
TRUNCATE TABLE `PhoneList`;
#注意:TRUNCATE 语句实现删除表中所有数据，删除后将重置自增列,表结构及其字段、约束、
#索引保持不变，执行速度比DELETE语句快。

#3.3.1 DQL语句回顾
SELECT * FROM `Student` WHERE `GradeId`=1 ORDER BY StudentNo;

#3.3.2 LIMIT子句
#显示前N条记录
SELECT * FROM `Student` WHERE `GradeId`=1 ORDER BY StudentNo LIMIT 4;
#显示第N条记录开始 显示M条记录
#从   第2条记录开始(包括第2条记录)  显示3条记录     显示2,3,4条记录
SELECT * FROM `Student` WHERE `GradeId`=1 ORDER BY StudentNo LIMIT 2,3;

#3.3.3.1 常用函数
#1.聚合函数 AVG() COUNT() MAX() MIN() SUM()

#3.3.3.2字符串函数
#连接字符串 concat('My','S','QL');
SELECT CONCAT('My','S','QL');#MySQL

#将指定字符串从POS位围起开始,替换为字符串newstr
SELECT INSERT ('这是SQL Server数据库',3,10,'MySQL');#这是MySQL数据库

#将字符串STR变成小写
SELECT LOWER('MySQL');#mysql

#将字符串STR变成大写
SELECT UPPER('MySQL');#MYSQL

#截取字符串
SELECT SUBSTRING('JavaMySQLOracle',5,5);#MySQL

#3.3.3.3时间日期函数
#Linux错做系统 #LN -sf /usr/SHARE/zoneinfo/Asia/ShangHai    /etc/LOCALTIME 设置上海时间
#获取当前日期
SELECT CURDATE();

#获取当前时间
SELECT CURTIME();

#获取当前日期和时间
SELECT NOW();

#返回日期date为一年中的第几周
SELECT WEEK(NOW());

#返回日期date的年份
SELECT YEAR(NOW());

#返回时间time的小时值
SELECT HOUR(NOW());

#返回时间time的分钟值
SELECT MINUTE(NOW());

#返回日期参数date1和date2之间相隔的天数
SELECT DATEDIFF(NOW(),'2008-08-08');

#计算日期参数date加上n天后的日期
SELECT ADDDATE(NOW(),5);

#4.数学函数
#返回大于或等于数值x的最小整数
SELECT CEIL(2.3);    -- 3

#返回小于或等于数值x的最大整数
SELECT FLOOR(2.3)  -- 2

#返回0~1间的随机数
SELECT RAND();

#3.4 子查询
####################################################################
#示例1
#查找出"李斯文"的出生日期
####################################################################
SELECT `BornDate` FROM `Student` WHERE `StudentName`='李斯文';

#利用WHERE 语句筛选出生日期比"李斯文"大的学生
SELECT `StudentNo`,`StudentName`,`Sex`,`BornDate`,`Address` FROM `Student` WHERE `BornDate`>'1993-07-23';

####################################################################
#示例2
####################################################################
SELECT `StudentNo`,`StudentName`,`Sex`,`BornDate`,`Address` 
FROM `Student` WHERE `BornDate`>(SELECT `BornDate` FROM `Student` WHERE `StudentName`='李斯文');

####################################################################
#示例3
#查询Logic Java课程至少一次考试刚好等于60分的学生名单
####################################################################
#方法一
SELECT `StudentName` 
FROM `Student` s INNER JOIN `Result` r   ON s.StudentNo=r.StudentNo
                             INNER JOIN `Subject` u ON u.SubjectNo=r.SubjectNo
WHERE u.SubjectName='Logic Java' AND r.StudentResult=60 

####################################################################
#示例4
####################################################################
#方法二
SELECT `StudentName`
FROM `Student`
WHERE `StudentNo`=
        (
          SELECT `StudentNo` FROM `Result` r INNER JOIN `Subject` b  ON r.SubjectNo=b.SubjectNo 
          WHERE r.StudentResult=60 AND b.SubjectName='Logic Java'
        )
        
####################################################################
#示例5
####################################################################
SELECT `StudentName` FROM `Student`
WHERE `StudentNo` IN (
           SELECT `StudentNo` FROM `Result` 
           WHERE `SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java')
			AND
			`StudentResult`=60
			             );


####################################################################
#示例6
####################################################################			             
SELECT `StudentNo`,`StudentName` FROM `Student` WHERE `StudentNo`
IN(
    SELECT `StudentNo` FROM `Result`
    WHERE `SubjectNo`=(
                 SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java'
                                      )
                 AND
                 `ExamDate`=(
                   SELECT MAX(`ExamDate`) FROM `Result` 
                   WHERE `SubjectNo`=(SELECT `SubjectNo` FROM `Subject`  WHERE `SubjectName`='Logic Java')
                 
					)
);

####################################################################
#示例7
####################################################################	
SELECT `StudentNo`,`StudentName`,`GradeId` FROM `Student` WHERE `StudentNo`
NOT IN (
     SELECT `StudentNo` FROM `Result`
     WHERE `SubjectNo`=(
			#获得参加Logic Java课程最近一次考试的学生学号
			SELECT `SubjectNo` FROM `Subject`
			WHERE `SubjectName`='Logic Java'
                                      )
                   AND
                   `ExamDate`=(
			#获得Logic Java课程最近一次的考试日期
			SELECT MAX(`ExamDate`) FROM `Result`
			WHERE `SubjectNo`=(
			                    #获得Logic Java课程的课程编号
			                    SELECT `SubjectNo` FROM `Subject`
			                    WHERE `SubjectName`='Logic Java'
			                                 )
					)
);	             
			             
#不包括S2和Y2学院
SELECT `StudentNo`,`StudentName`,`GradeId` FROM `Student` WHERE `StudentNo`
NOT IN (
     SELECT `StudentNo` FROM `Result`
     WHERE `SubjectNo`=(
			#获得参加Logic Java课程最近一次考试的学生学号
			SELECT `SubjectNo` FROM `Subject`
			WHERE `SubjectName`='Logic Java'
                                      )
                   AND
                   `ExamDate`=(
			#获得Logic Java课程最近一次的考试日期
			SELECT MAX(`ExamDate`) FROM `Result`
			WHERE `SubjectNo`=(
			                    #获得Logic Java课程的课程编号
			                    SELECT `SubjectNo` FROM `Subject`
			                    WHERE `SubjectName`='Logic Java'
			                                 )
					)
)
AND 
`GradeId`=(SELECT `GradeId` FROM `Subject` WHERE `SubjectName`='Logic Java');	             