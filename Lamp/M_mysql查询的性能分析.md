# 单条SQL语句的性能分析
除开一些像 pt-query-digest 第三方分析工具之外，如何利用内建命令对SQL语句进行性能分析呢。
首先明确性能分析，包括好几部分：

1. 查询等待时间，也称为响应时间
2. 语句执行时间
    * 解析
3. 返回结果时间
每个部分都可能成为瓶颈，所以第一步是如何查看上面的耗时信息

主要命令有四个 

* `show profiles #需在mysql先设置 set profiling = 1`
* `show status`
* 查看慢查询日志
* explain 命令

## 使用Show Profile
-  `select * from information_schema.profiling`;
- show profile 

![2016-07-19_17:30:00.jpg](http://7xscq6.com1.z0.glb.clouddn.com/2016-07-19_17:30:00.jpg)

- `show profile for query 7` 

![2016-07-19_17:31:56.jpg](http://7xscq6.com1.z0.glb.clouddn.com/2016-07-19_17:31:56.jpg)

优化显示查询结果

```SQL
mysql> set @query_id=7;
mysql> SELECT STATE,
       sum(duration) AS total_R,
       round(100 * sum(duration) /
               (SELECT sum(duration)
                FROM information_schema.profiling
                WHERE query_id=@query_id),2) AS pct_r,
       count(*) AS calls
FROM information_schema.profiling
WHERE query_id=@query_id
GROUP BY STATE
ORDER BY total_r DESC;

```

(分析结果)[]

## 使用Show status

- 使用status，虽然`show status`只能返回一些计数器数据，能显示某些活动的频繁程度，但无法给出消耗了多少时间，无法测量基于时间的绘画活动，单对于在执行完查询后观察某些计数器的值还是有帮助的。

```
mysql> FLUSH STATUS;
mysql> show status where variable_name like 'Handle%' or variable_name like 'Created%';
```
![2016-07-19_17:50:42.jpg](http://7xscq6.com1.z0.glb.clouddn.com/2016-07-19_17:50:42.jpg)

虽然explain 查看执行计划也可以获得大部分相同的信息，但是explain是通过估算得到的结果（对于一般的优化也够用了），而通过计数器则是实际测量的结果。
[结果分析]

## 使用慢查询日志(既可以用来分析整个查询过程，也可以分析单挑查询语句)

在[安装](https://github.com/GoldenAges/blogStore/blob/master/Lamp/M_pt-query-digest.md)好Percona Toolkit后，可以通过pt-query-digest命令来来分析查询结果，首先你需要打开慢查询日志
`>mysql set slow_query_log=1`, 查看慢查询日志的存储位置 `>mysql show variables like 'slow_query_log_file`,找到日志位置，然后通过命令`user> pt-query-digest filename`查看分析结果

![2016-07-20_2016-07-20_14:59:25.jpg](http://7xscq6.com1.z0.glb.clouddn.com/2016-07-20_2016-07-20_14:59:25.jpg)

## 使用Explain命令

```
Explain select no_sql_cache from ....;
```
[结果分析]()


