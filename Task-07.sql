USE Game;

-- we will create two triggers that increment the killedMonstersCount in the Hero table when the mission,
-- in which the hero participates is completed (isCompleted = 1 in the HeroMission table). The insert_killed_monsters_count trigger
-- is called when values ​​are added to the HeroMission table, and the update_killed_monsters_count trigger, respectively, 
-- when the value of isCompleted in the HeroMission table changes
DROP TRIGGER IF EXISTS insert_killed_monsters_count;
DELIMITER //
CREATE TRIGGER insert_killed_monsters_count
AFTER INSERT ON HeroMission FOR EACH ROW
BEGIN
    IF NEW.isCompleted = 1 THEN
        UPDATE Hero
        SET killedMonstersCount = killedMonstersCount + 1
        WHERE id = NEW.heroId;
    END IF;
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS update_killed_monsters_count;
DELIMITER //
CREATE TRIGGER update_killed_monsters_count
AFTER UPDATE ON HeroMission
FOR EACH ROW
BEGIN
    -- Update the killedMonstersCount in the Hero table if isCompleted is 1
    IF NEW.isCompleted = 1 THEN
        UPDATE Hero
        SET killedMonstersCount = killedMonstersCount + 1
        WHERE id = NEW.heroId;
    END IF;
END;
//
DELIMITER ;