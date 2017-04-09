#3.1.6 技能训练
##############################################################
#上机练习1
##############################################################
DROP DATABASE IF EXISTS `Test`;
CREATE DATABASE `Test`;
USE Test;
DROP TABLE IF EXISTS `Person`;
CREATE TABLE `Person`(
   `Number` INT(4)        NOT NULL COMMENT "序号"  AUTO_INCREMENT PRIMARY KEY,
   `Name`   VARCHAR(50)   NOT NULL COMMENT "姓名",
   `Sex`    CHAR(2)       COMMENT "性别",
   `BornDate` DATETIME    COMMENT "出生日期"
)COMMENT="人员表";

#将表名修改为TB_Person
ALTER TABLE `Person` RENAME `TB_Person`;

#删除出生日期字段
ALTER TABLE `TB_Person` DROP COLUMN `BornDate`;

#添加出生日期字段,数据类型为DATE类型
ALTER TABLE `TB_Person` ADD COLUMN `BornDate` DATE;

#修改序号字段名(Number)为Id,类型改为BIGINT类型
ALTER TABLE `TB_Person` CHANGE `Number` `Id` BIGINT;



##############################################################
#上机练习2
##############################################################
USE MySchool;
#添加主键约束
ALTER TABLE `Result` ADD CONSTRAINT PK_RNO PRIMARY KEY (`StudentNo`,`SubjectNo`,`ExamDate`);

#添加外键约束
ALTER TABLE `Result` ADD CONSTRAINT FK_RSNO FOREIGN KEY (`StudentNo`) REFERENCES `Student`(`StudentNo`)

##############################################################
#上机练习3
##############################################################
USE MySchool;
INSERT INTO `Subject`(`SubjectNo`,`SubjectName`,`ClassHour`,`GradeId`)
VALUES (1,'Logic Java',220,1),(2,'HTML',160,1),(3,'JavaOOP',230,2)

#Student表测试数据
INSERT INTO `Student` (`StudentNo`, `LoginPwd`, `StudentName`, `Sex`, `GradeId`, `Phone`, `Address`, `BornDate`, `Email`, `IdentityCard`) VALUES('10000','123','郭靖','男','1','13645667783','天津市河西区','1990-09-08 00:00:00',NULL,NULL);
INSERT INTO `Student` (`StudentNo`, `LoginPwd`, `StudentName`, `Sex`, `GradeId`, `Phone`, `Address`, `BornDate`, `Email`, `IdentityCard`) VALUES('10001','123','李文才','男','1','13645667890','地址不详','1994-04-12 00:00:00',NULL,NULL);
INSERT INTO `Student` (`StudentNo`, `LoginPwd`, `StudentName`, `Sex`, `GradeId`, `Phone`, `Address`, `BornDate`, `Email`, `IdentityCard`) VALUES('10002','123','李斯文','男','1','13645556793','河南洛阳','1993-07-23 00:00:00',NULL,NULL);
INSERT INTO `Student` (`StudentNo`, `LoginPwd`, `StudentName`, `Sex`, `GradeId`, `Phone`, `Address`, `BornDate`, `Email`, `IdentityCard`) VALUES('10003','123','张萍','女','1','13642345112','地址不详','1995-06-10 00:00:00',NULL,NULL);
INSERT INTO `Student` (`StudentNo`, `LoginPwd`, `StudentName`, `Sex`, `GradeId`, `Phone`, `Address`, `BornDate`, `Email`, `IdentityCard`) VALUES('10004','123','韩秋洁','女','1','13812344566','北京市海淀区','1995-07-15 00:00:00',NULL,NULL);
INSERT INTO `Student` (`StudentNo`, `LoginPwd`, `StudentName`, `Sex`, `GradeId`, `Phone`, `Address`, `BornDate`, `Email`, `IdentityCard`) VALUES('10005','123','张秋丽','女','1','13567893246','北京市东城区','1994-01-17 00:00:00',NULL,NULL);
INSERT INTO `Student` (`StudentNo`, `LoginPwd`, `StudentName`, `Sex`, `GradeId`, `Phone`, `Address`, `BornDate`, `Email`, `IdentityCard`) VALUES('10006','123','肖梅','女','1','13563456721','河北省石家庄市','1991-02-17 00:00:00',NULL,NULL);
INSERT INTO `Student` (`StudentNo`, `LoginPwd`, `StudentName`, `Sex`, `GradeId`, `Phone`, `Address`, `BornDate`, `Email`, `IdentityCard`) VALUES('10007','123','秦洋','男','1','13056434411','上海市卢湾区','1992-04-18 00:00:00',NULL,NULL);
INSERT INTO `Student` (`StudentNo`, `LoginPwd`, `StudentName`, `Sex`, `GradeId`, `Phone`, `Address`, `BornDate`, `Email`, `IdentityCard`) VALUES('10008','123','何睛睛','女','1','13053445221','广州市天河区','1997-07-23 00:00:00',NULL,NULL);
INSERT INTO `Student` (`StudentNo`, `LoginPwd`, `StudentName`, `Sex`, `GradeId`, `Phone`, `Address`, `BornDate`, `Email`, `IdentityCard`) VALUES('20000','123','王宝宝','男','2','15076552323','地址不详','1996-06-05 00:00:00',NULL,NULL);
INSERT INTO `Student` (`StudentNo`, `LoginPwd`, `StudentName`, `Sex`, `GradeId`, `Phone`, `Address`, `BornDate`, `Email`, `IdentityCard`) VALUES('20010','123','何小华','女','2','13318877954','地址不详','1995-09-10 00:00:00',NULL,NULL);
INSERT INTO `Student` (`StudentNo`, `LoginPwd`, `StudentName`, `Sex`, `GradeId`, `Phone`, `Address`, `BornDate`, `Email`, `IdentityCard`) VALUES('30011','123','陈志强','男','3','13689965430','地址不详','1994-09-27 00:00:00',NULL,NULL);
INSERT INTO `Student` (`StudentNo`, `LoginPwd`, `StudentName`, `Sex`, `GradeId`, `Phone`, `Address`, `BornDate`, `Email`, `IdentityCard`) VALUES('30012','123','李露露','女','3','13685678854','地址不详','1992-09-27 00:00:00',NULL,NULL);

/*Result表数据*/
INSERT INTO `Result` (`StudentNo`, `SubjectNo`,`StudentResult`, `ExamDate`) VALUES('10000',1,71,'2016-02-15 00:00:00');
INSERT INTO `Result` (`StudentNo`, `SubjectNo`,`StudentResult`, `ExamDate`) VALUES('10000',1,60,'2016-02-17 00:00:00');
INSERT INTO `Result` (`StudentNo`, `SubjectNo`,`StudentResult`, `ExamDate`) VALUES('10001',1,46,'2016-02-17 00:00:00');
INSERT INTO `Result` (`StudentNo`, `SubjectNo`,`StudentResult`, `ExamDate`) VALUES('10002',1,83,'2016-02-17 00:00:00');
INSERT INTO `Result` (`StudentNo`, `SubjectNo`,`StudentResult`, `ExamDate`) VALUES('10003',1,65,'2016-02-17 00:00:00');
INSERT INTO `Result` (`StudentNo`, `SubjectNo`,`StudentResult`, `ExamDate`) VALUES('10004',1,70,'2016-02-17 00:00:00');
INSERT INTO `Result` (`StudentNo`, `SubjectNo`,`StudentResult`, `ExamDate`) VALUES('10005',1,95,'2016-02-17 00:00:00');
INSERT INTO `Result` (`StudentNo`, `SubjectNo`,`StudentResult`, `ExamDate`) VALUES('10006',1,93,'2016-02-17 00:00:00');
INSERT INTO `Result` (`StudentNo`, `SubjectNo`,`StudentResult`, `ExamDate`) VALUES('10007',1,23,'2016-02-17 00:00:00');
INSERT INTO `Result` (`StudentNo`, `SubjectNo`,`StudentResult`, `ExamDate`) VALUES('10008',1,60,'2016-02-17 00:00:00');
INSERT INTO `Result` (`StudentNo`, `SubjectNo`,`StudentResult`, `ExamDate`) VALUES('20000',3,68,'2016-07-09 00:00:00');
INSERT INTO `Result` (`StudentNo`, `SubjectNo`,`StudentResult`, `ExamDate`) VALUES('20010',3,90,'2016-07-09 00:00:00');

INSERT INTO `Grade` VALUES(1,'S1'),(2,'S2'),(3,'Y2');
##############################################################
#上机练习4
##############################################################
#1.将学生表中学号为20000的学生的邮箱修改为stu20000@163.com,密码改为000
UPDATE `Student` SET `Email`='stu20000@163.com',`LoginPwd`='000'  WHERE `StudentNo`=20000

#2.将科目表中课时数大于200且学期编号为1的科目的课时减少10课时
UPDATE `Subject` SET `ClassHour`=`ClassHour`-10 WHERE `ClassHour`>200 AND `GradeId`=1

#3.将所有年级编号为1的学生姓名、性别、出生日期、手机号码信息保存到新表Student_Grade1中
CREATE TABLE `Student_Grade1`
(
      SELECT `StudentName`,`Sex`,`BornDate`,`Phone`
      FROM `Student`
      WHERE `GradeId`=1
)

##############################################################
#上机练习5
##############################################################
#1.查询2016年2月17日考试前5名的学生的学号和分数
SELECT `StudentNo`,`StudentResult`
FROM `Result`
WHERE `ExamDate`='2016-02-17' 
ORDER BY `StudentResult` DESC
LIMIT 5

#将所有女学生按年龄从大到小排序，从第2条记录开始显示6名女学生的姓名、年龄、出生日期、手机号信息
SELECT `StudentName`,CEIL(DATEDIFF(NOW(),`BornDate`)/365) AS 'Age',`BornDate`,`Phone`,CEIL(DATEDIFF(NOW(),`BornDate`)/365)
FROM `Student`
WHERE `Sex`='女'
ORDER BY CEIL(DATEDIFF(NOW(),`BornDate`)/365) DESC
LIMIT 1,6;   -- 第2条记录开始显示6名

#按出生年份分组统计学生人数，将各组中人数达到2人的年份和人数显示出来
SELECT  YEAR(`BornDate`) AS `Year`,COUNT(*) AS `Count` 
FROM `Student`
GROUP BY YEAR(`BornDate`) 
HAVING COUNT(*)>=2

#查询参加2016年2月17日考试的所有学员的最高分、最低分、平均分。
SELECT MAX(`StudentResult`) `max`,MIN(`StudentResult`)  `Min`,AVG(`StudentResult`) AS `Avg`
FROM `Result`
WHERE  `ExamDate`='2016-02-17'


##############################################################
#上机练习6
##############################################################
#查询参加最近一次Logic Java考试成绩的学生的最高分和最低分
SELECT MAX(`StudentResult`) `Max`,MIN(`StudentResult`) `Min`
FROM `Result`
WHERE `ExamDate`=(
					SELECT  MAX(`ExamDate`)
					FROM `Result` WHERE `SubjectNo`=(
												SELECT `SubjectNo` FROM `Subject` 
												WHERE `SubjectName`='Logic Java'
					                                                      )
                                )
              AND
              `SubjectNo`=(
					SELECT `SubjectNo`
					FROM `Subject` WHERE `SubjectName`='Logic Java'
               
                                )

##############################################################
#上机练习7
#使用IN关键字的子查询来查询第一学期(S1)学期开设的课程
##############################################################
SELECT `SubjectNo`,`SubjectName`
 FROM `Subject` WHERE `GradeId`=(SELECT `GradeId` FROM `Grade` WHERE `GradeName`='S1');


##############################################################
#上机练习8
#使用NOT IN关键字的子查询来查询未参加HTML课程最近一次考试的在读学生名单
##############################################################
SELECT  `StudentNo`,`StudentName` FROM `Student` 
WHERE `StudentNo` 
NOT IN 
(SELECT `StudentNo` FROM `Result` 
 WHERE `ExamDate`=(
                      SELECT MAX(`ExamDate`) FROM `Result`
                      WHERE `SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='HTML')
                                   )
              AND
              `SubjectNo`=(
                      SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='HTML'
                                   )
)
AND
`GradeId`=(SELECT `GradeId` FROM `Subject` WHERE `SubjectName`='HTML');
                               






