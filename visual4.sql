WITH rent_class AS(
        SELECT t1.zipcode,
               CASE WHEN t1.m2023_09 BETWEEN 0 AND 1000 THEN '$0-1000'
                    WHEN t1.m2023_09 BETWEEN 1001 AND 2000 THEN '$1001-2000'
                    WHEN t1.m2023_09 BETWEEN 2001 AND 3000 THEN '$2001-3000'
                    WHEN t1.m2023_09 BETWEEN 3001 AND 4000 THEN '$3001-4000'
                    WHEN t1.m2023_09 BETWEEN 4001 AND 5000 THEN '$4001-5000'
                    WHEN t1.m2023_09 BETWEEN 5001 AND 6000 THEN '$5001-6000'
                    WHEN t1.m2023_09 BETWEEN 6001 AND 7000 THEN '$6001-7000'
                    WHEN t1.m2023_09 BETWEEN 7001 AND 8000 THEN '$7001-8000'
                END AS rent_class
        FROM rents AS t1
        GROUP BY 1,2)
        SELECT t1.zipcode,
               t1.rent_class,
               COUNT(t2.complaint_id) AS complaint_num
        FROM rent_class AS t1
        LEFT JOIN complaints311 AS t2 ON CAST(t1.zipcode as TEXT) = t2.zipcode
        WHERE t2.created_date BETWEEN '2022-10-01T00:00:00.000' AND '2023-09-30T23:59:59.999'
        GROUP BY 1,2
        ORDER BY 2