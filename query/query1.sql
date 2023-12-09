 SELECT complaints311.ZipCode,
        COUNT(complaint_id) AS complaint_num
FROM complaints311
WHERE created_date BETWEEN '2022-10-01T00:00:00.000' AND '2023-09-30T23:59:59.999'
GROUP BY complaints311.ZipCode;