
问题：
使用group by 之后select 的列就必须是 group by 里面出现的列


官方文档:

https://dev.mysql.com/doc/refman/5.7/en/group-by-handling.html 

解决方案：
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

参考：

https://stackoverflow.com/questions/23921117/disable-only-full-group-by