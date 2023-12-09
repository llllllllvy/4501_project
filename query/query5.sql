SELECT t2.zipcode,
       COUNT(t1.tree_id) AS tree_num
FROM trees AS t1
JOIN nyczipcodes AS t2 ON ST_Within(ST_Transform(ST_SetSRID(ST_MakePoint(t1.longitude, t1.latitude), 4326), 4326), ST_SetSRID(t2.geom, 4326))
GROUP BY t2.zipcode
ORDER BY 2 DESC
LIMIT 10