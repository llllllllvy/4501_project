WITH top3_comp AS(
        SELECT 
               complaint_type,
               COUNT(complaint_id) AS complaint_num
        FROM complaints311
        WHERE created_date BETWEEN '2022-10-01T00:00:00.000' AND '2023-09-30T23:59:59.999'
        GROUP BY 1
        ORDER BY 2 DESC
        LIMIT 3)
SELECT SUBSTR(t2.created_date,1,10) AS day,
       t1.complaint_type,
       COUNT(t2.complaint_id) AS complaint_num
FROM top3_comp as t1
LEFT JOIN complaints311 AS t2 on t1.complaint_type = t2.complaint_type
WHERE t2.created_date BETWEEN '2022-10-01T00:00:00.000' AND '2023-09-30T23:59:59.999'
GROUP BY 1,2
ORDER BY 1