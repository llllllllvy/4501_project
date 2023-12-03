WITH 
       lowest_highest_rent_zipcode as((SELECT zipcode,
                                              ROUND(AVG(m2023_01)::numeric, 2) AS average_rent
                                       FROM rents
                                       GROUP BY zipcode
                                       HAVING ROUND(AVG(m2023_01)::numeric, 2) IS NOT NULL
                                       ORDER BY ROUND(AVG(m2023_01)::numeric, 2) ASC
                                       LIMIT 5)
                                       UNION ALL
                                       (SELECT zipcode,
                                              ROUND(AVG(m2023_01)::numeric, 2) AS average_rent
                                       FROM rents
                                       GROUP BY zipcode
                                       HAVING ROUND(AVG(m2023_01)::numeric, 2) IS NOT NULL
                                       ORDER BY ROUND(AVG(m2023_01)::numeric, 2) DESC
                                       LIMIT 5)),
        l_h_comp AS (SELECT t1.zipcode,
                            t1.average_rent,
                            count(t3.complaint_id) as complaint_num     
                     FROM lowest_highest_rent_zipcode as t1
                     LEFT JOIN complaints311 AS t3 ON cast(t1.zipcode  as text)= t3.zipcode
                     GROUP BY t1.zipcode, t1.average_rent
                     ORDER BY t1.average_rent)
SELECT t1.zipcode,
       t1.average_rent,
       count(trees.tree_id) as tree_num,
       t1.complaint_num
FROM l_h_comp as t1
LEFT JOIN trees on t1.zipcode = trees.zipcode
GROUP BY 1,2,4
ORDER BY 2;