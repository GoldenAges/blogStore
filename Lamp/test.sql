
SELECT mobile.name AS name,
       static.created_at,
       static.mobile_id AS id
FROM z_data_statistics AS STATIC
RIGHT JOIN z_mobile_phone AS mobile ON mobile.id=STATIC.mobile_id
WHERE STATIC.is_del="N"
  AND mobile.company=1
  AND STATIC.created_at>1459440000
GROUP BY mobile.id SUM(IF(s.type='close', number, 0)) + SUM(IF(s.type='open', number, 0)) AS pv, =SUM(IF(s.type='normal', number, 0)) AS uv


SELECT m.name,
       m.id,
       s.type
FROM z_mobile_phone AS m
LEFT JOIN z_data_statistics AS s ON m.id=s.mobile_id
WHERE m.is_del="N"
GROUP BY m.id



SELECT s.mobile_id,
SUM(IF(s.type='close', number, 0)) + SUM(IF(s.type='open', number, 0)) AS pv, SUM(IF(s.type='normal', number, 0)) AS uv
FROM z_data_statistics AS s
where s.is_del="N"
group by s.mobile_id




SELECT m.name,m.id,
SUM(IF(s.type='close', number, 0)) + SUM(IF(s.type='open', number, 0)) AS pv, SUM(IF(s.type='normal', number, 0)) AS uv
FROM z_mobile_phone as m
LEFT JOIN z_data_statistics as s  on s.mobile_id=m.id
WHERE m.is_del="N" and m.company=10
group by m.id;