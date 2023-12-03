SELECT complaint_type,
       COUNT(complaint_id) AS complaint_num
FROM complaints311
WHERE zipcode = '10027' and created_date BETWEEN '2018-10-01T00:00:00.000' AND '2023-09-30T23:59:59.999'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10