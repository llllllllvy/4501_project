SELECT tree_id,
       spc_common AS species,
       health,
       status,
       (longitude,Latitude) AS location
FROM trees
WHERE ST_DWithin(
                ST_MakePoint(longitude, Latitude)::geography,
                ST_MakePoint(-73.96253174434912, 40.80737875669467)::geography,
                805 )