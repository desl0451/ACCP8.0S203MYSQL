########################################################################
#示例1
#检查Logic Java课程最近一次考试。如果有成绩达到80分以上者,则显示分数排在前5名学员的学号和分数
########################################################################
USE `MySchool`;
SELECT `StudentNo`,`StudentResult`
FROM `Result`
WHERE EXISTS
        (SELECT * FROM `Result` 
        WHERE `ExamDate`=(
					SELECT MAX(`ExamDate`) FROM `Result`
					WHERE `SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java')
				    )
		    AND
		    `SubjectNo` =(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java')
		    AND
		   `StudentResult`>80					          
	   )
        AND
        `SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java')
ORDER BY `StudentResult` DESC
LIMIT 5;           
		
		
########################################################################
#示例2
#检查Logic Java课程最近一次考试。如果全部没有通过考试(60分及格),则认为本次考试偏难，
#计算的该次考试平均分加5分
########################################################################
#使用此代码时需要先将数据库的成绩全部改成小于60分　，才会有结果
SELECT  AVG(StudentResult)+5 AS 平均分 
FROM `Result`
WHERE NOT  EXISTS(
	/*查询Logic Java最后一次成绩小于60分的记录*/
	SELECT * FROM `Result` WHERE `SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java')
	                                                  AND 
	                                                  `ExamDate`=(SELECT MAX(`ExamDate`) FROM `Result` 
										WHERE `SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java'))
							 AND
							 `StudentResult`>60
	
			     )
	AND
	`SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java')
	AND
	`ExamDate`=(SELECT MAX(`ExamDate`) FROM `Result` 
										WHERE `SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java'))

