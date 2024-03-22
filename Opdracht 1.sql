-- CREATED BY NIKOLAAS BREMS

-- Delete all if exists
DROP TABLE IF EXISTS DnD.PlayableCharacter;
DROP TABLE IF EXISTS DnD.CharacterClass;
DROP TABLE IF EXISTS DnD.CharacterSheet;
DROP TABLE IF EXISTS DnD.Alignment;
DROP TABLE IF EXISTS DnD.Race;
DROP TABLE IF EXISTS DnD.Class;
DROP TABLE IF EXISTS DnD.Background;
DROP TABLE IF EXISTS DnD.Player;
DROP SCHEMA IF EXISTS DnD;
GO

--Create schema
CREATE SCHEMA DnD;
GO

--Create tables
CREATE TABLE DnD.Player
(
    id INT IDENTITY (1, 1) NOT NULL,
    name VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    phone VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Player PRIMARY KEY (id),
    CONSTRAINT UK_Player_name_firstName
        UNIQUE (name, firstName)
);
GO

CREATE TABLE DnD.Background
(
    id INT IDENTITY (1, 1) NOT NULL,
    name VARCHAR(20) NOT NULL,
    skillProficiency VARCHAR(100) NOT NULL,
    toolProficiency VARCHAR(50) NOT NULL,
    language VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Background PRIMARY KEY (id)
);
GO

CREATE TABLE DnD.Class
(
    id INT IDENTITY (1, 1) NOT NULL,
    name VARCHAR(20) NOT NULL,
    armorProficiency VARCHAR(100) NOT NULL,
    weaponProficiency VARCHAR(100) NOT NULL,
    hitDice INT NOT NULL,
    savingThrow VARCHAR(15) NOT NULL,
    CONSTRAINT PK_Class PRIMARY KEY (id),
    CONSTRAINT UK_Class_name UNIQUE (name)
);
GO

CREATE TABLE DnD.Race
(
    id INT IDENTITY (1, 1) NOT NULL,
    name VARCHAR(20) NOT NULL,
    abilityScoreIncrease VARCHAR(15) NOT NULL,
    speed INT NOT NULL,
    vision VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Race PRIMARY KEY (id),
    CONSTRAINT UK_Race_name UNIQUE (name)
);
GO

CREATE TABLE DnD.Alignment
(
    id INT IDENTITY (1, 1) NOT NULL,
    name VARCHAR(15) NOT NULL,
    CONSTRAINT PK_Alignment PRIMARY KEY (id),
    CONSTRAINT UK_Alignment_name UNIQUE (name)
);
GO

CREATE TABLE DnD.CharacterSheet
(
    id INT IDENTITY (1, 1) NOT NULL,
    name VARCHAR(50) NOT NULL,
    alignemntId INT NOT NULL,
    place VARCHAR(30) NOT NULL,
    raceId INT NOT NULL,
    backgroundId INT NOT NULL,
    level INT NOT NULL,
    CONSTRAINT PK_CharacterSheet PRIMARY KEY (id),
    CONSTRAINT FK_Alignment
        FOREIGN KEY (alignemntId)
            REFERENCES DnD.Alignment(id),
    CONSTRAINT FK_Race
        FOREIGN KEY (raceId)
            REFERENCES DnD.Race(id),
    CONSTRAINT FK_Background
        FOREIGN KEY (backgroundId)
            REFERENCES DnD.Background(id),
    CONSTRAINT UK_CharacterSheet_name UNIQUE (name)
);
GO

CREATE TABLE DnD.CharacterClass
(
    id INT IDENTITY (1, 1) NOT NULL,
    classId INT NOT NULL,
    characterId INT NOT NULL,
    level INT NOT NULL,
    CONSTRAINT PK_CharacterClass PRIMARY KEY (id),
    CONSTRAINT FK_Class
        FOREIGN KEY (classId)
            REFERENCES DnD.Class(id),
    CONSTRAINT FK_CharacterSheet
        FOREIGN KEY (characterId)
            REFERENCES DnD.CharacterSheet(id)
);
GO

CREATE TABLE DnD.PlayableCharacter
(
    id INT IDENTITY (1, 1) NOT NULL,
    characterSheetId INT NOT NULL,
    playerId INT NOT NULL,
    CONSTRAINT PK_PlayableCharacter PRIMARY KEY (id),
    CONSTRAINT FK_Character
        FOREIGN KEY (characterSheetId)
            REFERENCES DnD.CharacterSheet(id),
    CONSTRAINT FK_Player
        FOREIGN KEY (playerId)
            REFERENCES DnD.Player(id)
);
GO

-- CREATED BY NIKOLAAS BREMS