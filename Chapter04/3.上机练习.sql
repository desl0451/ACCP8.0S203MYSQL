########################################################################
#上机练习1
#查询S2学员考试成绩信息
########################################################################
SELECT `StudentNo` AS 学号,`SubjectNo` AS 科目编号,`StudentResult` AS 考试成绩,`ExamDate` AS 考试日期
FROM `Result`
WHERE `StudentNo` IN (
	SELECT `StudentNo` FROM `Student` 
	WHERE `GradeId`=(SELECT `GradeId` FROM `Grade` WHERE `GradeName`='S2')
			            )
 
########################################################################
#上机练习2
#为每个学生制作在校期间各门课程的成绩单，要求每个学生参加每门课程的最后一
#次考试成绩作为该生本课程的最终成绩，按学期顺序输出各门课程的成绩
########################################################################
SELECT  `Student`.StudentName AS 姓名, 
	       (SELECT `GradeName` FROM `Grade` WHERE `Grade`.GradeId=`Student`.GradeId) AS 课程所属年级,
	      `Subject`.SubjectName,
	      `Result`.ExamDate,
	      `Result`.StudentResult
FROM `Result` INNER JOIN `Student` ON `Student`.StudentNo=`Result`.StudentNo
                        INNER JOIN `Subject` ON `Subject`.SubjectNo=`Result`.SubjectNo
WHERE `Result`.ExamDate IN (
			SELECT MAX(`ExamDate`) FROM `Result` r
			WHERE `Result`.SubjectNo=r.SubjectNo 	GROUP BY `SubjectNo`
						)
ORDER BY  `Subject`.GradeId

########################################################################
#上机练习3
#统计Logic Java课程最近一次考试学生应到人数、实到人数和缺考人数
#提取Logic Java课程最近一次考试的成绩信息并保存结果。成绩信息包括
#学生姓名,学号,考试成绩
########################################################################
#1)查询获得Logic Java课程的课程编号和最近一次的考试日期
SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java';

SELECT MAX(`ExamDate`) FROM `Result` 
INNER JOIN `Subject` ON `Result`.SubjectNo=`Subject`.SubjectNo
WHERE `SubjectName`='Logic Java';

SELECT `GradeId` FROM `Subject` WHERE `SubjectName`='Logic Java';

#应到人数
SELECT COUNT(*) FROM `Student`
WHERE `GradeId`=(SELECT `GradeId` FROM `Subject` WHERE `SubjectName`='Logic Java')

#实到人数
SELECT COUNT(*) FROM `Result`
WHERE `SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java')
            AND
            `ExamDate`=(SELECT MAX(`ExamDate`) FROM `Result` WHERE `SubjectNo`=(
							SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java'
						)
				 );
#缺考人数
SELECT 	(SELECT COUNT(*) FROM `Student`
		WHERE `GradeId`=(SELECT `GradeId` FROM `Subject` WHERE `SubjectName`='Logic Java'))
		-
		(SELECT COUNT(*) FROM `Result`
		WHERE `SubjectNo`=(SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java')
			    AND
			    `ExamDate`=(SELECT MAX(`ExamDate`) FROM `Result` WHERE `SubjectNo`=(
									SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java'
								)
						 ))		
#提取学生的成绩信息并保存结果，包括学生姓名、学号和考试成绩
SELECT `Student`.`StudentName`,`Student`.`StudentNo`,`StudentResult`
FROM `Student` LEFT JOIN (
	SELECT * FROM `Result`
	WHERE `ExamDate` =(
						SELECT MAX(`ExamDate`) FROM `Result` 
						INNER JOIN `Subject` ON `Result`.SubjectNo=`Subject`.SubjectNo
						WHERE `SubjectName`='Logic Java'
	                                   )
	             AND
	             `SubjectNo`=(
						SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java'
					   )
		) R 
ON `Student`.StudentNo=R.`StudentNo`;

#将查询后的结果保存到tempResult表中
DROP TABLE IF EXISTS `tempResult`;
CREATE TABLE `tempResult`(
	SELECT `Student`.`StudentName`,`Student`.`StudentNo`,`StudentResult`
	FROM `Student` LEFT JOIN (
		SELECT * FROM `Result`
		WHERE `ExamDate` =(
							SELECT MAX(`ExamDate`) FROM `Result` 
							INNER JOIN `Subject` ON `Result`.SubjectNo=`Subject`.SubjectNo
							WHERE `SubjectName`='Logic Java'
						   )
			     AND
			     `SubjectNo`=(
							SELECT `SubjectNo` FROM `Subject` WHERE `SubjectName`='Logic Java'
						   )
			) R 
	ON `Student`.StudentNo=R.`StudentNo`
);