USE Game;

-- we'll create a stored procedure that accepts one parameter - monsterTypeIn, which is of 
-- type ENUM('zombie', 'troll', 'gnome') and based on the parameter, outputs a table of 
-- missions where the monster type corresponds to the given type.
DROP PROCEDURE IF EXISTS GetMissions;
DELIMITER //
CREATE PROCEDURE GetMissions(IN monsterTypeIn ENUM('zombie', 'troll', 'gnome'))
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE missionId INT;
    DECLARE missionName VARCHAR(30);
    DECLARE missionDescription TEXT;
    DECLARE missionReward INT;
    DECLARE cur CURSOR FOR SELECT id, name, description, reward FROM Mission WHERE monsterId IN (SELECT id FROM Monster WHERE monsterType = monsterTypeIn);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Create a temporary table to store the results
    DROP TEMPORARY TABLE IF EXISTS tempMissions;
    CREATE TEMPORARY TABLE tempMissions (
        missionId INT,
        missionName VARCHAR(30),
        missionDescription TEXT,
        missionReward INT
    );

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO missionId, missionName, missionDescription, missionReward;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Insert the mission data into the temporary table
        INSERT INTO tempMissions (missionId, missionName, missionDescription, missionReward)
        VALUES (missionId, missionName, missionDescription, missionReward);
    END LOOP;
    CLOSE cur;

    -- Return the results from the temporary table
    SELECT * FROM tempMissions;
END //
DELIMITER ;

CALL GetMissions('zombie');