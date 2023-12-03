WITH tb_most_tree_zipcode as (SELECT zipcode,
                                     COUNT(tree_id) AS tree_num
                              FROM trees
                              GROUP BY zipcode
                              ORDER BY COUNT(tree_id) DESC
                              LIMIT 10)
SELECT zipcode,
       average_rent
FROM(
SELECT t1.zipcode,
       t1.tree_num,
       ROUND(AVG(t2.m2023_08)::numeric, 2) AS average_rent
FROM tb_most_tree_zipcode AS t1
JOIN rents AS t2 ON t1.zipcode = t2.zipcode
GROUP BY t1.zipcode, t1.tree_num
ORDER BY t1.tree_num DESC);