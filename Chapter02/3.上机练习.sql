#创建数据库
DROP DATABASE IF EXISTS `MySchool`;
CREATE DATABASE `MySchool`;
#上机练习2
USE MySchool;
DROP TABLE IF EXISTS `Student`;
CREATE TABLE `Student`(
  `StudentNo`    INT(4)       NOT NULL              COMMENT    '学号' PRIMARY KEY,#非空,主键
  `LoginPwd`     VARCHAR(20)  NOT NULL              COMMENT    '密码',
  `StudentName`  VARCHAR(50)  NOT NULL              COMMENT    '学生姓名',
  `Sex`          CHAR(2)      DEFAULT '男' NOT NULL COMMENT    '性别',
  `GradeId`      INT(4)       UNSIGNED              COMMENT    '年级编号',
  `Phone`        VARCHAR(50)                        COMMENT    '联系电话',
  `Address`      VARCHAR(255) DEFAULT '地址不详'    COMMENT    '地址',
  `BornDate`     DATETIME                           COMMENT    '出生日期',
  `Email`        VARCHAR(50)                        COMMENT    '邮件账号',
  `IdentityCard` VARCHAR(18)  UNIQUE KEY            COMMENT    '身份证号'
)COMMENT='学生表';

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