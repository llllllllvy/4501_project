SELECT longitude,
        Latitude,
        (longitude,Latitude) AS location
FROM complaints311 
WHERE created_date BETWEEN '2018-10-01T00:00:00.000' AND '2023-09-30T23:59:59.999'
    AND complaint_type =  'New Tree Request'
    AND (longitude,Latitude) is not NULL
GROUP BY 1,2,3
ORDER BY 1,2,3