CREATE DATABASE mybank;

USE mybank;
CREATE TABLE `bank`
(
    `customerName` CHAR(10), #用户名 	
    `currentMoney` DECIMAL(10,2)  #当前余额   	
);
/*插入数据*/
INSERT INTO `bank`(`customerName`,`currentMoney`) VALUES('张三',1000);
INSERT INTO `bank`(`customerName`,`currentMoney`) VALUES('李四',1);





/*--关闭事务自动提交--*/
SET autocommit = 0;

/*--开启新事务--*/
START TRANSACTION;

INSERT INTO Result(`StudentNo`,`SubjectNo`,`ExamDate`,`StudentResult`)
VALUES(10000,1,NOW(),99);

INSERT INTO Result(`StudentNo`,`SubjectNo`,`ExamDate`,`StudentResult`)
VALUES(10001,1,NOW(),70);

INSERT INTO Result(`StudentNo`,`SubjectNo`,`ExamDate`,`StudentResult`)
VALUES(10007,1,NOW(),70);
COMMENT;





INSERT INTO Result(`StudentNo`,`SubjectNo`,`ExamDate`,`StudentResult`)
VALUES(10004,1,NOW(),104);

INSERT INTO Result(`StudentNo`,`SubjectNo`,`ExamDate`,`StudentResult`)
VALUES(10004,1,NOW(),134);
/*--回滚事务--*/   
ROLLBACK;

/*--开启自动提交--*/ 
SET autocommit = 1;




################################################################################

USE `MySchool`;
DROP VIEW IF EXISTS `view_student_result`;
CREATE VIEW `view_student_result`
AS
   (SELECT `Student`.`StudentNo`,`Student`.`StudentName` FROM `Student` INNER JOIN `Result` ON `Student`.`StudentNo`=`Result`.`StudentNo`);
   
SELECT * FROM `view_student_result`;





CREATE VIEW `view_result`
AS
SELECT Student.studentName,Subject.subjectName,AVG(Result.studentResult)
FROM Student
INNER JOIN Result ON Student.studentNo = Result.studentNo
INNER JOIN `Subject` ON Result.subjectNo = Subject.subjectNo
GROUP BY `Result`.`studentNo`,`Result`.`subjectNo`;
SELECT * FROM `view_result`;


USE information_schema;
SELECT * FROM views \G;
