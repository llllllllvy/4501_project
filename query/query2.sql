SELECT zipcode,
       COUNT(tree_id) AS tree_num
FROM trees
GROUP BY zipcode
ORDER BY COUNT(tree_id) DESC
LIMIT 10