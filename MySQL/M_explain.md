## mysql explain 

[官方解释](http://dev.mysql.com/doc/refman/5.5/en/explain-output.html)

Explain只是一个近似似结果，只能作为参考。

简要解释

| Column        | Meaning                           | 意思|
|---            |           ---                     | ---|
| ID            |  The select identifier            |   查询表识，执行顺序 |
| select_type   |   The select type                 |      选择类型     |
| table         | the table for the output row      |涉及到的表 |
| partitions    | the matching partitions           |  分区|
| type          | the join type                     |扫描类型|
| possible_keys | The possible indexes to choosen   |可能选择的索引|
| key           |the index actually chosen          |实际用到的索引|
| key_len       |the lenghth of the chosen key   |索引长度|
| ref           | The columns compared to the index ||
| rows          |Estimate of rows to be examined    |
| filtered      |Percentage of rows filtered by table condition|
| Extra         |Additional information             |     |

下面就一个具体结果来详细解释

```SQL
explain
SELECT `goods`.`id`,
       `goods`.`name`,
       `parts`.`sku`,
       `detail`.`num` AS `num`,
       min(parts.price) AS `min`,
       max(parts.price) AS `max`,
       `goods`.`weight`
FROM `zfix_goods` `goods`
LEFT JOIN `zfix_goods_type` `type` ON type.id=goods.type_id
LEFT JOIN
  (SELECT count(id) AS `num`,
          `goods_id`
   FROM `zfix_re_order_detail` `detail`
   WHERE `is_del`='N'
   GROUP BY `goods_id`) `detail` ON detail.goods_id=goods.id
LEFT JOIN `zfix_goods_parts` `parts` ON parts.goods_id=goods.id
WHERE (`goods`.`is_del`='N')
  AND (`type`.`is_del`='N')
  AND (`parts`.`is_del`='N')
  AND (`goods`.`status`='SALE')
GROUP BY `goods`.`id`
ORDER BY `goods`.`weight`,
         `goods`.`created_at`;```


![2016-08-17_2016-08-17_16:23:28.jpg](http://7xscq6.com1.z0.glb.clouddn.com/2016-08-17_2016-08-17_16:23:28.jpg)

### ID：

主要是一串连续数字，表示查询顺序。如果关联行是union的结果，那么该行为空

### select type
Mysql将select查询分为简单型（SIMPLE）和复杂型，如果是复杂查询则最外层查询标记为PRIMARY，其他部分标记为：

* SubQuery：包含在SELECT列表中的子查询中的SELECT
* DERIVED: 表示包含在FROM子句的子查询中的SELECT，派生表
* UNION：在UNION中的第二个和随后的SELECT被标记为UNION
* UNION RESULT：

### Table 
访问的表名（别名）

### type
关联类型，性能从好到差为：
* NULL: MySql能在优化阶段分解查询语句，在执行阶段甚至用不着再访问表或索引
* const，system:当MySQL能对查询的某部分进行优化并将其转化成一个常量时，例如将主键放入where
* eq_reg:使用这种索引查找，MySql知道最多只返回一条符合条件的记录。这种方法可以在MySql使用主键或唯一索引查找时看到
* ref:索引访问，它返回所有匹配的某个单行的值
* range:范围稻苗就是一个有限制得索引扫描
* index:全表扫描，不过按索引次序进行而不是行
* ALL: 全表扫描

### possible keys
可能用到的索引字段，对于查询没有帮助

### key 
使用的索引，如果不在 prossible keys 列，则可能说明MySQL选用它出于别的原因，例如它可能选择了一个覆盖索引。

### key_len 
MySQL 在索引里使用的字节数，如果是多个索引，则是字段字节数之和

### ref列
显示了之前的表在key列记录的索引中查找所用的列或常量

### rows列
MySQL的**估算**扫描列，不太精确，只能作为参考

### Extra列

* "Using index": 使用覆盖索引（最优）
* "Using where": 意味着MySQL服务器将在存储引擎检索行后再进行过滤
* "Using temporary": MySQL在对查询结果排序时会使用一个临时表
* "Using filesort": MySQL会对结果使用一个外部索引排序，而不是按照索引次序从表里读取行。
* "Range checked for each record": 没有可用的索引

性能查询主要查看如下列，
type，key, ref, rows, Extra








