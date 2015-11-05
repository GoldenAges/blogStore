MySql 入门级优化
就数据库常用的四种操作来说，增删查改。
用到的最多的就是 查， 如何优化查询？
入门参考：
    [How To Optimize Queries and Tables in MySQL and MariaDB on a VPS](https://www.digitalocean.com/community/tutorials/how-to-optimize-queries-and-tables-in-mysql-and-mariadb-on-a-vps)
深入学习
    [PHP Manula](https://dev.mysql.com/doc/refman/5.5/en/optimize-overview.html)
    [MySQL索引原理及慢查询优化](http://tech.meituan.com/mysql-index.html)

优化一般分为两种，一种是构建数据库时所要考虑到的一些因素，例如 字段的设计，外键的设置等等
一种就是后期查询优化，例如多表查询，索引，缓存等等
1. 优化表结构
    1.1 字段属性，类型
        对 enum 字段的慎用 [Why enum is evil](http://komlenic.com/244/8-reasons-why-mysqls-enum-data-type-is-evil/)
        需要使用到 enum 的时候选择Tinyint
    1.2 字段结构的设置
2. 查询优化（亦可以理解为查询语句的优化）
    2.1. 单表优化教容易，只选择需要的字段，调整 where 之后条件的顺序，然后对区分度大的字段加上索引即可
    2.2. 多表查询优化
        2.3 子查询的可读性比联合查询高，联合查询比子查询效率高，更容易优化，如何取舍得看具体的业务应用场景
    

优化的第一步是明白如何查看SQL语句执行时间和效率
MySql命令: [Explain 命令](http://dev.mysql.com/doc/refman/5.5/en/explain-output.html)
