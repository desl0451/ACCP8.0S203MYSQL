#第二章本章作业

#简答题
#(1)创建数据库：创建数据库Library
DROP DATABASE IF EXISTS `Library`;
CREATE DATABASE `Library`;
USE `Library`;
#(2) 创建下面四个表
DROP TABLE IF EXISTS `Book`;
CREATE TABLE `Book`(
  Bid     VARCHAR(50)  NOT NULL COMMENT '图书编号' PRIMARY KEY,
  BName   VARCHAR(50)  NOT NULL COMMENT '图书书名',
  Author  VARCHAR(20)  NOT NULL COMMENT '作者姓名',
  PubComp VARCHAR(100) NOT NULL COMMENT '出版社'  ,
  PubDate DATETIME     NOT NULL COMMENT '出版日期',
  BCount  INT(4)       NOT NULL COMMENT '现存数量',
  Price   FLOAT        NOT NULL
)COMMENT='图书信息表';

DROP TABLE IF EXISTS `Reader`;
CREATE TABLE `Reader`(
  `Rid`      VARCHAR(50)  NOT NULL COMMENT '读者编号' PRIMARY KEY,
  `RName`    VARCHAR(50)  NOT NULL COMMENT '读者姓名',
  `LendNum`  INT(4)                COMMENT '借书数量',
  `RAddress` VARCHAR(200) NOT NULL
)COMMENT='读者信息表';

DROP TABLE IF EXISTS `Borrow`;
CREATE TABLE `Borrow`(
  `Rid`        VARCHAR(50) NOT NULL COMMENT '读者编号',
  `Bid`        VARCHAR(50) NOT NULL COMMENT '图书编号',
  `LendDate`   TIMESTAMP   NOT NULL COMMENT '借阅日期',
  `WillDate`   DATETIME    NOT NULL COMMENT '应归还日期',
  `ReturnDate` DATETIME    	    COMMENT '实际归还日期',
  PRIMARY KEY (`Rid`,`Bid`,`LendDate`) 
)COMMENT='图书借阅表';

DROP TABLE IF EXISTS `Penalty`;
CREATE TABLE `Penalty`(
  `Rid`      VARCHAR(50) NOT NULL COMMENT '读考编号',
  `Bid`      VARCHAR(50) NOT NULL COMMENT '图书编号',
  `PDate`    DATETIME    NOT NULL COMMENT '罚款日期',
  `PType`    INT(4)      NOT NULL COMMENT '罚款类型',
  `Amount`   FLOAT       NOT NULL COMMENT '罚款金额',
  PRIMARY KEY (`Rid`,`Bid`,`PDate`)
)COMMENT='罚款记录表';

USE `Library`;
#插入测试数据
#添加图书信息Book
INSERT INTO `Book` VALUES('ISBN001','Java','王涛','机械工业','2019-3-31', 100,200.0);
INSERT INTO `Book` VALUES('ISBN002','CSharp','王涛','机械工业','2019-6-10', 100,240.0);

#添加读者Reader
INSERT INTO `Reader` VALUES('001','张小宝','1','哈尔滨宏图小区');
INSERT INTO `Reader` VALUES('002','张大宝','2','哈尔滨南岗区文林街');

#添加图书借阅表Borrow
INSERT INTO `Borrow`(Rid,Bid,WillDate) VALUES('001','ISBN001','2019-5-3');
INSERT INTO `Borrow`(Rid,Bid,WillDate) VALUES('002','ISBN002','2019-5-7');

#添加罚款记录表Penalty
INSERT INTO `Penalty`(Rid,Bid,PDate,PType,Amount) VALUES('001','ISBN001','2019-9-9',3,300);
INSERT INTO `Penalty`(Rid,Bid,PDate,PType,Amount) VALUES('001','ISBN002','2019-9-9',3,370);
