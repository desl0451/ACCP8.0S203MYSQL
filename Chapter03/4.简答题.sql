########################################################################
#简答题
#3.使用子查询获得当前没有被者借阅的图书信息。
#要求:输出图书名称、图书编号、作者姓名、出版社和单价
########################################################################
SELECT `Bid`,`BName`,`Author`,`PubComp`,`Price` 
FROM `Book` 
WHERE `Bid` NOT IN (SELECT `Bid` FROM `Borrow` WHERE `Borrow`.Bid=`Book`.Bid);


########################################################################
#4.使用子查询获得今年的所有缴纳罚款的读者清单,要求输出的数
#   据包括读者姓名，图书名称，罚款日期和缴纳罚金等
########################################################################
SELECT `Penalty`.Rid, `Reader`.`RName`,`Book`.`BName`,`Penalty`.`PDate`,`Penalty`.`Amount`
FROM  `Penalty` INNER JOIN `Book`     ON `Penalty`.`Bid`=`Book`.`Bid`
			   INNER JOIN `Reader` ON `Penalty`.`Rid`=`Reader`.`Rid`
WHERE YEAR(`PDate`)=2019;


########################################################################
#5.使用子查询获得地址为空的所有读者尚未归还的图书清单。
#   要求:按读者编号从高到低，借书日期由近至远的顺序输出
#   读者编号、读者姓名
########################################################################
/*select  `Rid`
from   `Borrow`
where `Rid` in (
		select `Rid`
		from `Reader`
		where `RAddress` is null
		)
order by `Rid` desc ,`LendDate` desc
*/

