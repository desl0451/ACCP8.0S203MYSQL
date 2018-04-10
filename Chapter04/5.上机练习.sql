############################################################
#  示例1
############################################################
#检查“Logic Java”课程最近一次考试成绩
#如果有 80分以上的成绩，显示分数排在前5名的学员学号和分数

#查询Logic Java课程最近一次考试成绩
#查询Logic Java课程编号
SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java';


#最近一次考试时间
SELECT MAX(`ExamDate`) FROM `Result` 
WHERE `SubjectNo` =(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java');

##########################################################################
#检查“Logic Java”课程最近一次考试成绩
#如果有 80分以上的成绩，显示分数排在前5名的学员学号和分数
##########################################################################

SELECT `StudentNo`,`StudentResult` 
FROM `Result`
WHERE EXISTS(
		SELECT * FROM `Result` 
		WHERE `SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java')
		       AND
		      `ExamDate`=(SELECT MAX(`ExamDate`) FROM `Result` 
					WHERE `SubjectNo` =(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java')
				  )
		       AND
		       `StudentResult`>80     	
	    )
      AND `SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java')
ORDER BY `StudentResult`  DESC      
LIMIT 5;

##########################################################################
#检查“Logic Java”课程最近一次考试成绩
#如果全部未通过考试（60分及格），认为本次考试偏难，计算的该次考试平均分加5分
##########################################################################
SELECT (AVG(`StudentResult`) +5 ) AS 提分后结果
FROM `Result`
WHERE NOT EXISTS (
	   SELECT * FROM `Result` 
	   WHERE `SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java')
	          AND
	         `ExamDate`=(SELECT MAX(`ExamDate`) FROM `Result` WHERE `SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java'))
	         AND
	         `StudentResult`>60
      )
      AND
      `SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java')
      AND
      `ExamDate`=(SELECT MAX(`ExamDate`) FROM `Result` WHERE `SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java'))



SELECT AVG(studentresult)+10 AS 平均分 FROM Result
WHERE NOT EXISTS (
		#查询Logic Java最后一次考试成绩小于60的记录
		SELECT * FROM `Result`  WHERE `subjectNo` = (
		   SELECT `subjectNo` FROM `Subject` WHERE `subjectName` = 'Logic Java'
		  )  AND `examDate` = (
		     SELECT MAX(`examDate`) FROM `Result` WHERE `subjectNo` = (     
		       SELECT `subjectNo` FROM `Subject` 
		       WHERE `subjectName` = 'Logic Java') 
		  ) AND `studentResult` > 60)
	AND `subjectNo` = ( SELECT `subjectNo` FROM `Subject` WHERE `subjectName` = 'Logic Java') 
	AND `examDate` = ( SELECT MAX(`examDate`) FROM `Result` WHERE `subjectNo` = (     
			  SELECT `subjectNo` FROM `Subject` 
			  WHERE `subjectName` = 'Logic Java') );



SELECT AVG(studentresult)+5 AS 平均分 FROM Result
WHERE NOT EXISTS (
	SELECT * FROM `Result`  
	WHERE `subjectNo` = (  SELECT `subjectNo` FROM `Subject` WHERE `subjectName` = 'Logic Java')  
	       AND 
	       `examDate` = (SELECT MAX(`examDate`) FROM `Result` WHERE `subjectNo` = (     
		       SELECT `subjectNo` FROM `Subject` WHERE `subjectName` = 'Logic Java') 
		  ) 
		AND `studentResult` > 60)
	AND `subjectNo` = (SELECT `subjectNo` FROM `Subject` WHERE `subjectName` = 'Logic Java') 
	AND `examDate` = (SELECT MAX(`examDate`) FROM `Result` WHERE `subjectNo` = ( SELECT `subjectNo` FROM `Subject`  WHERE `subjectName` = 'Logic Java') );

 ###############################################################################
 #如果有S2的学生，就查询参加S2学科考试的学员学号、科目编号、考试成绩，考试时间
 ###############################################################################
 SELECT `StudentNo`,`SubjectNo`,`StudentResult`,`ExamDate`
 FROM `Result`
 WHERE EXISTS(
	    SELECT * FROM `Student` WHERE `GradeId`=(SELECT `GradeId` FROM `Grade` WHERE `GradeName`='S2')
	)
       AND
       `SubjectNo` IN (SELECT `SubjectNo` FROM `Subject` WHERE `GradeId`=(SELECT `GradeId` FROM `Grade` WHERE `GradeName`='S2'))
###############################################################################
#为每个学生制作在校期间每门课程的成绩单，要求每个学生参加每门课程的
#最后一次考试成绩作为该生本课程的最终成绩
###############################################################################	
#成绩单的数据项
#学生姓名
#课程所属的年级名称
#课程名称
#考试日期
#考试成绩
SELECT stu.`StudentName` 姓名,r.`StudentResult` 成绩,(SELECT `GradeName` FROM `Grade` g WHERE g.`GradeId`=sub.`GradeId`) 年级,
       sub.`SubjectName` 科目名称,r.`ExamDate` 考试日期
FROM `Result` r  INNER JOIN `Student` stu ON stu.`StudentNo`=r.`StudentNo`
		 INNER JOIN `Subject` sub ON sub.`SubjectNo`=r.`SubjectNo`
WHERE r.`ExamDate` IN(
	SELECT MAX(`ExamDate`) FROM `Result` r2 WHERE r2.`SubjectNo`=r.`SubjectNo`
	ORDER BY r2.`SubjectNo`
)
ORDER BY sub.`GradeId`;


SELECT  `studentName` 姓名,( SELECT `gradeName` FROM `Grade` WHERE `gradeId`=`Subject`.`gradeId` ) AS 课程所属年级 , 
	`subjectName` 课程名称, `examDate` 考试日期, `studentResult` 成绩
FROM  `Result` r1  INNER JOIN `Student` ON r1.`studentNo`=`Student`.`studentNo`
		   INNER JOIN `Subject` ON `Subject`.`subjectNo`=r1.`subjectNo`
WHERE r1.`examDate` IN (
      SELECT MAX(`examDate`) FROM `Result` r2
      WHERE r1.`subjectNo` = r2.`subjectNo`#主查询和子查询间参数值绑定
      GROUP BY r2.`subjectNo`
) 
ORDER BY Subject.gradeId;
