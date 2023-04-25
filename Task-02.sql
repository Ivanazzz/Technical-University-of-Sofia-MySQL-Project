USE Game;

-- we will output the average attack point value rounded to the second decimal place 
-- and the sum of all magic points based on the monster type
SELECT monsterType,
	   ROUND(AVG(attackPoints), 2) AS AvgOfAttackPoints,
       SUM(magicPoints) AS SumOfMagicPoints
FROM Monster
GROUP BY monsterType;