#show variables like 'character%'

#创建数据库
#create database myschool;
CREATE DATABASE IF NOT EXISTS `MySchool`;

#选择数据库 
USE `MySchool`;

CREATE TABLE `Student`(
   `StudentNo`    INT(4)       NOT NULL PRIMARY KEY COMMENT '学号',  
   `LoginPwd`     VARCHAR(20)  NOT NULL,
   `StudentName`  VARCHAR(50)  NOT NULL COMMENT '学生姓名',
   `Sex`          VARCHAR(10)  NOT NULL DEFAULT '男'   COMMENT '性别',
   `GradeId`      INT(4)       UNSIGNED             COMMENT '年级编号',
   `Phone`        VARCHAR(50)                       COMMENT '联系电话',
   `Address`      VARCHAR(255) DEFAULT '地址不详'   COMMENT '地址',
   `BornDate`     DATETIME                          COMMENT '出生日期',
   `Email`        VARCHAR(50)                       COMMENT '邮件账号',
   `IdentityCard` VARCHAR(18)  UNIQUE KEY           COMMENT '身份证号'
)COMMENT="学生号";

#上机练习3
DROP TABLE IF EXISTS `Subject`;
CREATE TABLE `Subject`(
  `SubjectNo`    INT(4)  NOT NULL COMMENT '课程编号' AUTO_INCREMENT PRIMARY KEY,
  `SubjectName`  VARCHAR(50)      COMMENT '课程名称',
  `ClassHour`    INT(4)           COMMENT '学时', 
  `GradeId`      INT(4)           COMMENT '年级编号'
)COMMENT='课程表';

#上机练习4
DROP TABLE IF EXISTS `Result`;
CREATE TABLE `Result`(
  `StudentNo`     INT(4)   NOT NULL COMMENT '学号',
  `SubjectNo`     INT(4)   NOT NULL COMMENT '课程编号',
  `ExamDate`      DATETIME NOT NULL COMMENT '考试日期',
  `StudentResult` INT(4)   NOT NULL COMMENT '考试成绩'
)COMMENT='成绩表';

#上机练习5
DROP TABLE IF EXISTS `Grade`;
CREATE TABLE `Grade`(
  `GradeId`    INT(4)      NOT NULL COMMENT '年级编号' AUTO_INCREMENT PRIMARY KEY,
  `GradeName`  VARCHAR(50) NOT NULL COMMENT '年级名称'
)COMMENT='年级表';

USE MySchool;
#添加主键约束
ALTER TABLE `Result` ADD CONSTRAINT PK_RNO PRIMARY KEY (`StudentNo`,`SubjectNo`,`ExamDate`);

#添加外键约束
ALTER TABLE `Result` ADD CONSTRAINT FK_RSNO FOREIGN KEY (`StudentNo`) REFERENCES `Student`(`StudentNo`);

INSERT INTO `Grade` VALUES(1,'S1'),(2,'S2'),(3,'Y2');

INSERT INTO `Subject`(`SubjectNo`,`SubjectName`,`ClassHour`,`GradeId`)
VALUES (1,'Logic Java',220,1),(2,'HTML',160,1),(3,'JavaOOP',230,2);

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

