MySQL版本
5.1
和
5.6

问题：
使用group by 之后select 的列就必须是 group by 里面出现的列


官方文档:

https://dev.mysql.com/doc/refman/5.7/en/group-by-handling.html 

解决方案：
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

参考：

https://stackoverflow.com/questions/23921117/disable-only-full-group-by

报错：
SQLSTATE[42000]: Syntax error or access violation: 1055 Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'zealer.a.id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by


解决方案
SET GLOBAL sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';