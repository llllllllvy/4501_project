SELECT longitude,
       Latitude,
       (longitude,Latitude) AS location
FROM trees
WHERE (longitude,Latitude) is not NULL
GROUP BY 1,2,3
ORDER BY 1,2,3