USE Game;

-- we will create a query that returns the name of only those characters who have 
-- at least one mission completed and also returns the number of missions they have completed
SELECT h.name AS heroName, 
	   COUNT(hm.missionId) AS completedMissionsCount
FROM Hero AS h
JOIN HeroMission AS hm 
ON h.id = hm.heroId
WHERE hm.isCompleted = 1
GROUP BY h.name;