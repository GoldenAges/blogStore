http://stackoverflow.com/questions/10295228/exporting-results-of-a-mysql-query-to-excel

SELECT ... FROM ... WHERE ... 
INTO OUTFILE 'file.csv'
FIELDS TERMINATED BY ','

 SELECT * FROM document INTO OUTFILE 'c:/order-1.csv' 


 方案类别－方案名称－对应机型（SPU信息）－所需配件（SKU信息）－报价

 select DISTINCT fix_id, a.id, a.type, a.name, a.sku spu, b.program_son_id, b.sku, b.price from zfix_oper_program a right join zfix_fix_program_parts b on a.id=program_id where a.is_del="N" and b.is_del="N" and b.type="FIX";

 SELECT `a`.`id`, `a`.`type`, `a`.`name`, `a`.`sku` AS `spu`, `b`.`program_id`, `b`.`program_son_id`, `b`.`program_name`, `b`.`sku`, `b`.`price` FROM `zfix_oper_program` `a` LEFT JOIN `zfix_fix_program_parts` b on `a`.id=`b`.`program_id` 


 WHERE a.id=4

//方案
select a.id, a.name, a.type,a.sku spu, c.sku, c.price,as PlanPrice from zfix_oper_program as a left join zfix_oper_program_son as c on a.id=c.parent_id where a.is_del="N";


 select b.fix_id,a.id,a.name,a.type,b.price as partPrice, c.price as PlanPrice from zfix_oper_program as a join zfix_fix_program_parts as b on a.id=b.program_id join zfix_oper_program_son as c on a.id=c.parent_id where a.is_del="N" and b.is_del="N" and c.is_del="N" group by b.fix_id;