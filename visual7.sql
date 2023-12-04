WITH comp_traffic as (
    SELECT  SUBSTR(created_date,0,8) as month,
            zipcode,
            COUNT(complaint_id) AS complaint_num
    FROM complaints311
    where complaint_type ilike '%%traffic%%'
    GROUP BY 1,2
    ORDER BY 1,3)
    SELECT t1.month,
           t1.zipcode,
           t1.complaint_num,
           COUNT(t2.*) AS crash_num
    FROM comp_traffic as t1
    JOIN crashes AS t2 ON t1.zipcode = t2.zipcode AND t1.month = SUBSTR(t2.crash_date,0,8)
    GROUP BY 1,2,3
    ORDER BY 1,2