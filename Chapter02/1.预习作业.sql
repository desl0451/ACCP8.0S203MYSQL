#3.预习并完成编码题
#1.创建宠物管理数据库Petdb
DROP DATABASE IF EXISTS `Petdb`;
CREATE DATABASE `Petdb`;

USE `Petdb`;
#.在数据库petdb中,创建宠物表pet,包含的字段信息如下:宠物编号,名称,种类,年龄,健康状况.
DROP TABLE IF EXISTS `Pet`;
CREATE TABLE `Pet`(
   `PetNo`    INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '宠物编号',
   `PetName`   VARCHAR(50) NOT NULL COMMENT '名称',
   `PetType`   VARCHAR(50) NOT NULL COMMENT '种类',
   `PetAge`    INT(4)      NOT NULL COMMENT '年龄',
   `PetHealth` VARCHAR(50) NOT NULL COMMENT '健康状况'
)COMMENT='宠物表';