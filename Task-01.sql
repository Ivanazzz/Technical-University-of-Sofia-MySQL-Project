USE Game;

-- we will display information about all characters that contain the letter 'g' in their name
SELECT * 
FROM Hero
WHERE name LIKE '%g%';