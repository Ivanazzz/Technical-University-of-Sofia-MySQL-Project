USE Game;

-- we will write a query that will display the necessary information about the mission and the monster. 
-- The information is stored in the Mission and Monster tables. For the join we will use LEFT OUTER JOIN,
-- so that if there is a monster that is still without a mission, it can be present in the results.
SELECT mo.id AS monsterId,
	   mo.name,
       mo.monsterType,
       mi.id AS missionId,
       mi.name,
       mi.reward
FROM Monster AS mo
LEFT OUTER JOIN Mission AS mi
ON mo.id = mi.monsterId;