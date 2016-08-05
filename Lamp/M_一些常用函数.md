#### 根据中文字段排序问题

MySQL默认字符集为UTF-8，根据中文排序时会乱序，所以排序时要转化一下编码:

select * from zfix_test order by convert(name using gb2312)

[解决mysql中文排序无效方法](http://www.111cn.net/database/mysql/44936.htm)