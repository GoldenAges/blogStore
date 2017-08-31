#### 根据中文字段排序问题

MySQL默认字符集为UTF-8，根据中文排序时会乱序，所以排序时要转化一下编码:

select * from zfix_test order by convert(name using gb2312)

[解决mysql中文排序无效方法](http://www.111cn.net/database/mysql/44936.htm)

#### 去除重复值

select distinct(id) from zfix_test where is_del='N';


#### 将联合查询出的null值转化为0

http://stackoverflow.com/questions/1037653/sql-left-join-return-0-rather-than-null

```
ISNULL(nullable, value_if_null) for MsSQL, COALESCE(nullable1, nullable2, ..., value_if_null) for MySQL.
```


#### 将一行分解为多行

http://stackoverflow.com/questions/13750584/how-to-split-a-resulting-column-in-multiple-columns

select substring(column, start, length) form table

#### 将多行组合为一行

contact(column1,column2)

#### 行列转化（难点）

