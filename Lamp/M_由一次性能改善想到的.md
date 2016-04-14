Sql 性能分析
1. http://www.cnblogs.com/echosong/p/3541262.html 
2. 减少查询次数，尽量通过SQL查询来一次性得到你需要的数据，这里面包含一些SQL的高级技巧，例如行列转换，行与行之间的运算（加减乘除或字符连接）


表结构：(现在的数据量是40w)
z_data_statistics | CREATE TABLE `z_data_statistics` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `mobile_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '手机ID',
  `user_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` enum('normal','close','open') NOT NULL DEFAULT 'normal' COMMENT 'normal :正常 open:统计非注册  close:统计注册',
  `number` bigint(10) NOT NULL DEFAULT '0' COMMENT '数量',
  `is_del` enum('N','Y') NOT NULL DEFAULT 'N' COMMENT '是否删除',
  `ip` bigint(10) NOT NULL DEFAULT '0' COMMENT 'IP地址',
  `modified` int(10) NOT NULL DEFAULT '0' COMMENT '修改日期',
  `created_at` int(10) NOT NULL DEFAULT '0' COMMENT '创建日期',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `mobile_id` (`mobile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='工具统计表'

需求：
1. 得到表中所有pv和uv总量
2. 得到当前页面的每款手机的pv和uv量
3. pv: type='normal' uv: type!='normal'

select sum(number) as num from z_data_statistics where is_del="N" 0.11s

uv Total:
select sum(number) as num from z_data_statistics where type="normal" and is_del="N" 0.15s

pv Total:
select sum(number) as num from z_data_statistics where type!="normal" and is_del="N" 0.12s

select created_at, mobile_id, sum(number) as num from z_data_statistics where is_del="N" group by mobile_id; 0.40s

按手机分组 uv 
 select created_at, mobile_id, sum(number) as num from z_data_statistics where type="normal" and is_del="N" group by mobile_id; 
 0.43s

select created_at, mobile_id, sum(number) as num from z_data_statistics where type="normal" and is_del="N" group by mobile_id order by num desc limit 0,10;
0.45s

pv

select created_at, mobile_id, sum(number) as num from z_data_statistics where type!="normal" and is_del="N" group by mobile_id; 0.39s

select created_at, mobile_id, sum(number) as num from z_data_statistics where type!=normal and is_del="N" group by mobile_id; 0.39s

select created_at, mobile_id, sum(number) as num from z_data_statistics where is_del="N" group by mobile_id; 0.39s

单条和多条 条数较少时没区别
select created_at, mobile_id, sum(number) as num from z_data_statistics where type="normal" and is_del="N" and mobile_id=190;

select created_at, mobile_id, sum(number) as num from z_data_statistics where mobile_id in (190,161,1,60,51,79,80,62,2,24) and type="normal" and is_del="N" group by mobile_id;0.28


select created_at, mobile_id, type, sum(number) as num from z_data_statistics where is_del="N" group by mobile_id,type order by num desc;
在这个基础上再进行数据分析

最终结果，一条SQL解决：行列转换以及
select created_at, mobile_id, SUM(IF(type='close', number, 0)) + SUM(IF(type='open', number, 0)) as pv,  SUM(IF(type='normal', number, 0)) as uv from z_data_statistics where is_del="N" and created_at between 1459440000 and 1462032000  group by mobile_id order by pv desc;
在这个基础上再进行数据分析