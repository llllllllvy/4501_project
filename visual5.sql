SELECT complaint_id,
       longitude,
       Latitude,
       (longitude,Latitude) AS location
FROM complaints311 
WHERE created_date BETWEEN '2023-01-01T00:00:00.000' AND '2023-09-30T23:59:59.999'
     AND ST_DWithin(
                ST_MakePoint(longitude, Latitude)::geography,
                ST_MakePoint(-73.96253174434912, 40.80737875669467)::geography,
                1000 )
GROUP BY 1,2,3,4
ORDER BY 1