WITH tree_rent AS
              (SELECT t1.zipcode,
                      t1.mean_rent,
                      COUNT(t2.tree_id) AS tree_num
               FROM rents_avg AS t1
               JOIN trees AS t2 ON t1.zipcode = t2.zipcode
               GROUP BY 1,2)
       SELECT t1.zipcode,
              ROUND(t1.mean_rent::numeric, 2) AS average_rent,
              t1.tree_num,
              COUNT(t2.complaint_id) AS complaint_num
       FROM tree_rent AS t1
       JOIN complaints311 AS t2 on t1.zipcode  = t2.zipcode
       GROUP BY 1,2,3