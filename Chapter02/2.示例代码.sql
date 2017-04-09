#创建数据库
#create database myschool;
CREATE DATABASE MySchool;
#查看数据库列表
SHOW DATABASES;

#选择数据库 
USE MySchool;

#删除数据库
DROP DATABASE `MySchool`;

#命令行方式连接数据库 mysql -h IP地址 -u root -p 密码
#mysql -h 192.168.70.128 -u root -p 123
#数据类型宽度测试
CREATE TABLE `Tb_Type1`(
	`Sid` INT(4) ZEROFILL
);
#插入数据
INSERT INTO `Tb_Type1` VALUES(12),(1234),(123456);
#INSERT INTO `tb_type1` VALUE(12),(1234),(123456);


#如果为某数值字段指定了ZEROFILL属性,MySQL
#将自动为该字段添加UNSIGNED属性
CREATE TABLE `Tb_Type2`(
   `Sid` INT(4) UNSIGNED
);
#查看student表结构
DESCRIBE Student
DESC Student

#创建表
CREATE TABLE `Student`(
   `StudentNo` INT(4) PRIMARY KEY,
   `Name` CHAR(10)
);

USE MySchool;
#示例1
CREATE TABLE `Student`(
   `StudentNo`    INT(4)       NOT NULL PRIMARY KEY COMMENT '学号' ,   #非空,主键
   `LoginPwd`     VARCHAR(20)  NOT NULL             COMMENT '密码',
   `StudentName`  VARCHAR(50)  NOT NULL             COMMENT '学生姓名',
   `Sex` CHAR(2)  DEFAULT '男' NOT NULL             COMMENT '性别',
   `GradeId`      INT(4)       UNSIGNED             COMMENT '年级编号', #无符号数
   `Phone`        VARCHAR(50)                       COMMENT '联系电话',
   `Address`      VARCHAR(255) DEFAULT '地址不详'   COMMENT '地址',     #默认值
   `BornDate`     DATETIME                          COMMENT '出生日期',
   `Email`        VARCHAR(50)                       COMMENT '邮件账号',
   `IdentityCard` VARCHAR(18)  UNIQUE KEY           COMMENT '身份证号'  #唯一
)COMMENT="学生号";
#查看表
DESCRIBE `Student`

#2.7.2 操作默认存储引擎
SHOW VARIABLES LIKE 'storage_engine%';


#示例2
CREATE DATABASE enginedb
USE enginedb
/*创建表类型为MyISAM的表*/
DROP TABLE IF EXISTS `myisam`;
CREATE TABLE `myisam`(
  sid INT(4)
)ENGINE=MYISAM;

/*创建表类型为InnoDB的表*/
DROP TABLE IF EXISTS `innodb`;
CREATE TABLE `innodb`(
  sid INT(4)
)ENGINE=INNODB;

#2.8.1 如何查看MySQL帮助
HELP contents; #通过HELP contents命令查看帮助文档目录列表
