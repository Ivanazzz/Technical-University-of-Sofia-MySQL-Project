DROP DATABASE IF EXISTS Game;
CREATE DATABASE Game;
USE Game;

CREATE TABLE Monster (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
    healthPoints TINYINT UNSIGNED NOT NULL,
    attackPoints TINYINT UNSIGNED NOT NULL,
    magicPoints TINYINT UNSIGNED NOT NULL,
    monsterType ENUM('zombie', 'troll', 'gnome') NOT NULL
);

CREATE TABLE Mission (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    description TEXT NULL,
    reward INT UNSIGNED NOT NULL,
    monsterId INT UNIQUE NULL,
    FOREIGN KEY (monsterId) REFERENCES Monster(id)
);

CREATE TABLE Hero (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    healthPoints TINYINT UNSIGNED NOT NULL,
    attackPoints TINYINT UNSIGNED NOT NULL,
    magicPoints TINYINT UNSIGNED NOT NULL,
    killedMonstersCount INT UNSIGNED NOT NULL,
    isFighter BIT NOT NULL
);

CREATE TABLE Fighter (
	id INT PRIMARY KEY,
    defencePoints TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (id) REFERENCES Hero(id)
);

CREATE TABLE Magician (
	id INT PRIMARY KEY,
    frostAttackPoints TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (id) REFERENCES Hero(id)
);

CREATE TABLE HeroMission (
    heroId INT NOT NULL,
    missionId INT NOT NULL,
    isCompleted BIT NOT NULL,
    FOREIGN KEY (heroId) REFERENCES Hero(id),
    FOREIGN KEY (missionId) REFERENCES Mission(id),
    PRIMARY KEY(heroId, missionId)
);

CREATE TABLE User (
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(30) NOT NULL
);

CREATE TABLE UserHero (
    userId INT NOT NULL,
    heroId INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(id),
    FOREIGN KEY (heroId) REFERENCES Hero(id),
    PRIMARY KEY(userId, heroId)
);