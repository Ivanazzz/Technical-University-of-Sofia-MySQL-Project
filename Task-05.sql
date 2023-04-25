USE Game;

-- we'll create a query that retrieves the character name, mission name, and mission reward 
-- for those missions whose reward is greater than the average reward for all missions
SELECT h.name AS heroName, 
	   m.name AS missionName, 
       m.reward
FROM Hero h
JOIN HeroMission AS hm 
ON h.id = hm.heroId
JOIN Mission AS m 
ON m.id = hm.missionId
WHERE m.reward > (
    SELECT AVG(reward)
    FROM Mission
);