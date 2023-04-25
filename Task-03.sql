USE Game;

-- we'll write a query that retrieves the following characteristics of the first 5 heroes who 
-- are fighters: ID, Name, Health (from the Hero table), number of monsters killed, and Defense Points
SELECT h.id, 
	   h.name, 
       h.healthPoints, 
	   h.killedMonstersCount,
       f.defencePoints
FROM Hero AS h
JOIN Fighter AS f 
ON h.id = f.id 
AND h.isFighter = 1
LIMIT 5;