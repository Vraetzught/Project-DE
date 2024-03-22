-- CREATED BY NIKOLAAS BREMS

-- insert data into Player
INSERT INTO DnD.Player
    (name, firstName, phone, email)
VALUES
    ('Anderson', 'Isabella', '0483930355', 'Isabella.Anderson@hotmail.nl'),
    ('Brown', 'Olivia', '0462405051', 'Olivia.Brown@yahoo.com'),
    ('Clark', 'Ava', '0494615366', 'Ava.Clark@hotmail.be'),
    ('Davis', 'Noah', '0478656530', 'Noah.Davis@gmail.com'),
    ('Green', 'Benjamin', '0460196617', 'Benjamin.Green@outlook.fr'),
    ('Hall', 'James', '0460888481', 'James.Hall@gmail.com'),
    ('Harris', 'Charlotte', '0493455594', 'Charlotte.Harris@gmail.com'),
    ('Johnson', 'Lucas', '0495471791', 'Lucas.Johnson@outlook.com'),
    ('Lewis', 'Amelia', '0465675659', 'Amelia.Lewis@live.com'),
    ('Martinez', 'Sophia', '0493956131', 'Sophia.Martinez@hotmail.com'),
    ('Mitchell', 'Grace', '0479322071', 'Grace.Mitchell@gmail.co.uk'),
    ('Parker', 'William', '0465031687', 'William.Parker@hotmail.com'),
    ('Smith', 'Evelyn', '0487855208', 'Evelyn.Smith@yahoo.com'),
    ('Taylor', 'Mason', '0482678995', 'Mason.Taylor@gmail.com'),
    ('Thomas', 'Elijah', '0493850569', 'Elijah.Thomas@hotmail.com'),
    ('Turner', 'Mia', '0490200909', 'Mia.Turner@outlook.com'),
    ('Walker', 'Aiden', '0473917022', 'Aiden.Walker@live.org'),
    ('White', 'Oliver', '0484150753', 'Oliver.White@live.com'),
    ('Wilson', 'Liam', '0480560930', 'Liam.Wilson@msn.com'),
    ('Wright', 'Harper', '0461383671', 'Harper.Wright@outlook.com')
GO

-- Insert data into Background
INSERT INTO DnD.Background
    (name, skillProficiency, toolProficiency, language)
VALUES
    ('Academic', 'Investigation, Insight', 'One type of artisans tools', 'Two of choice'),
    ('Acolyte', 'Insight, Religion', 'None', 'Two of choice'),
    ('Archaeologist', 'History, Investigation', 'Cartographers tools', 'Two of choice'),
    ('Bounty Hunter', 'Investigation, Survival', 'One type of gaming set', 'None'),
    ('Cartographer', 'Nature, Survival', 'Cartographers tools', 'One of choice'),
    ('Criminal', 'Deception, Stealth', 'Thieves tools', 'None'),
    ('Entertainer', 'Acrobatics, Performance', 'One type of musical instrument', 'None'),
    ('Folk Hero', 'Animal Handling, Survival', 'One type of artisans tools', 'None'),
    ('Guild Artisan', 'Insight, Persuasion', 'One type of artisans tools', 'One of choice'),
    ('Hermit', 'Medicine, Religion', 'Herbalism kit', 'One of choice'),
    ('Knight', 'History, Persuasion', 'Gaming set', 'One of choice'),
    ('Merchant', 'Insight, Persuasion', 'Navigators tools', 'One of choice'),
    ('Monster Hunter', 'Arcana, Survival', 'Alchemists supplies', 'One of choice'),
    ('Noble', 'History, Persuasion', 'None', 'One of choice'),
    ('Outlander', 'Athletics, Survival', 'One musical instrument', 'None'),
    ('Sage', 'Arcana, History', 'None', 'Two of choice'),
    ('Sailor', 'Athletics, Perception', 'Navigators tools, vehicles (water)', 'None'),
    ('Soldier', 'Athletics, Intimidation', 'Gaming set', 'None'),
    ('Spy', 'Deception, Investigation', 'Forgery kit, disguise kit', 'One of choice'),
    ('Urchin', 'Sleight of Hand, Stealth', 'Disguise kit, thieves tools', 'None')
GO

-- Insert data into Class
INSERT INTO DnD.Class
    (name, armorProficiency, weaponProficiency, hitDice, savingThrow)
VALUES
    ('Artificer', 'Light armor, medium armor, shields', 'Simple weapons', 8, 'CON INT'),
    ('Barbarian', 'Light armor, medium armor, shields', 'Simple weapons, martial weapons', 12, 'STR CON'),
    ('Bard', 'Light armor', 'Simple weapons, hand crossbows, longswords, rapiers, shortswords', 8, 'DEX CHA'),
    ('Blood Hunter', 'Light armor, medium armor, shields', 'Simple weapons, martial weapons', 10, 'DEX INT'),
    ('Cleric', 'Light armor, medium armor, shields', 'Simple weapons', 8, 'WIS CHA'),
    ('Druid', 'Light armor, medium armor, shields (not metal)', 'Clubs, daggers, darts, javelins, maces, quarterstaffs, scimitars, sickles, slings, spears', 8, 'INT WIS'),
    ('Fighter', 'All armor, shields', 'Simple weapons, martial weapons', 10, 'STR CON'),
    ('Monk', 'None', 'Simple weapons, shortswords', 8, 'STR DEX'),
    ('Paladin', 'All armor, shields', 'Simple weapons, martial weapons', 10, 'WIS CHA'),
    ('Ranger', 'Light armor, medium armor, shields', 'Simple weapons, martial weapons', 10, 'STR DEX'),
    ('Rogue', 'Light armor', 'Simple weapons, hand crossbows, longswords, rapiers, shortswords', 8, 'DEX INT'),
    ('Sorcerer', 'None', 'Daggers, darts, slings, quarterstaffs, light crossbows', 6, 'CON CHA'),
    ('Warlock', 'Light armor', 'Simple weapons', 8, 'WIS CHA'),
    ('Wizard', 'None', 'Daggers, darts, slings, quarterstaffs, light crossbows', 6, 'INT WIS'),
    ('Astartes', 'All armor, shields', 'Simple weapons, martial weapons', 12, 'STR CON'),
    ('Force master', 'Light and medium armors, shields', 'Simple weapons, martial weapons', 10, 'STR CON'),
    ('Hogwarts Wizard', 'None', 'Simple weapons', 8, 'INT WIS'),
    ('Overlord', 'Medium armor, heavy armor, and shields', 'Simple and martial melee weapons', 12, 'STR CHA'),
    ('Pokémon trainer', 'Light armor', 'Simple weapons, whip', 8, 'DEX CHA'),
    ('Spider-Man', 'None', 'Simple weapons, martial weapons', 8, 'STR DEX')
GO

-- Insert data into Race
INSERT INTO DnD.Race
    (name, abilityScoreIncrease, speed, vision)
VALUES
    ('AaraKocra', 'X+2 X+1 / 3X+1', 30, 'Normal'),
    ('Aasimar', 'X+2 X+1 / 3X+1', 30, 'Darkvision'),
    ('Changeling', 'X+2 X+1 / 3X+1', 30, 'Normal'),
    ('Dragonborn', 'STR+2 CHA+1', 30, 'Normal'),
    ('Dwarf', 'CON+2', 25, 'Darkvision'),
    ('Eladrin', 'X+2 X+1 / 3X+1', 30, 'Darkvision'),
    ('Elf', 'DEX+2', 30, 'Darkvision'),
    ('Fairy', 'X+2 X+1 / 3X+1', 30, 'Normal'),
    ('Firbolg', 'X+2 X+1 / 3X+1', 30, 'Normal'),
    ('Githyanki', 'X+2 X+1 / 3X+1', 30, 'Normal'),
    ('Githzerai', 'X+2 X+1 / 3X+1', 30, 'Normal'),
    ('Gnome', 'INT+2', 25, 'Darkvision'),
    ('Goliath', 'X+2 X+1 / 3X+1', 30, 'Normal'),
    ('Half-Elf', 'CHA+2 2X+1', 30, 'Darkvision'),
    ('Halfling', 'DEX+2', 25, 'Normal'),
    ('Half-Orc', 'STR+2 CON+1', 30, 'Darkvision'),
    ('Human', 'ALL+1', 30, 'Normal'),
    ('Kenku', 'X+2 X+1 / 3X+1', 30, 'Normal'),
    ('Tabaxi', 'X+2 X+1 / 3X+1', 30, 'Darkvision'),
    ('Tiefling', 'CHA+2', 30, 'Darkvision')
GO

-- insert data into Alignment
INSERT INTO DnD.Alignment
    (name)
VALUES
    ('Lawful good'),
    ('Lawful neutral'),
    ('Lawful evil'),
    ('Neutral good'),
    ('Neutral (True)'),
    ('Neutral evil'),
    ('Chaotic good'),
    ('Chaotic neutral'),
    ('Chaotic evil')
GO

-- Insert data into CharacterSheet
INSERT INTO DnD.CharacterSheet
    (name, alignemntId, place, raceId, backgroundId, level)
VALUES
    ('Aander Brightwood', 2, 'Stormwreck Isle', 12, 12, 3),
    ('Aelar Windrider', 7, 'Icewind Dale', 7, 15, 3),
    ('Azura Stormcaller', 7, 'Baldur’s Gate', 6, 14, 4),
    ('Branwyn Leafwhisper', 4, 'Candlekeep', 15, 10, 3),
    ('Drakar Fireblood', 8, 'Neverwinter', 4, 6, 1),
    ('Durin Stoneheart', 1, 'Candlekeep', 13, 8, 4),
    ('Eilif Thunderstrider', 5, 'Waterdeep', 16, 4, 3),
    ('Elowen Swiftwind', 6, 'Neverwinter', 18, 6, 1),
    ('Grimnir Battlehammer', 2, 'Phandalin', 5, 1, 3),
    ('Kaelen Stormrider', 8, 'Phandalin', 10, 18, 2),
    ('Larken Windwhisper', 3, 'Neverwinter', 8, 19, 1),
    ('Lyra Nightshade', 7, 'The Underdark', 20, 7, 2),
    ('Pippin Greenfoot', 4, 'Baldur’s Gate', 15, 20, 2),
    ('Rowan Thornfield', 9, 'Waterdeep', 9, 10, 2),
    ('Seraphina Dawnbringer', 1, 'Waterdeep', 2, 2, 4),
    ('Sylas Ironforge', 2, 'Icewind Dale', 5, 9, 2),
    ('Thalia Shadowstep', 5, 'Icewind Dale', 3, 19, 5),
    ('Thorne Ravenshadow', 7, 'The Underdark', 19, 3, 4),
    ('Valeria Ironthorn', 1, 'Stormwreck Isle', 17, 11, 5),
    ('Zara Moonshadow', 5, 'Neverwinter', 7, 16, 1)
GO

-- Insert data into CharacterClass
INSERT INTO DnD.CharacterClass
    (classId, characterId, level)
VALUES
    (3, 1, 3),
    (1, 2, 3),
    (12, 3, 4),
    (6, 4, 3),
    (2, 5, 1),
    (9, 6, 4),
    (10, 7, 3),
    (11, 8, 1),
    (7, 9, 3),
    (4, 10, 2),
    (18, 11, 1),
    (13, 12, 2),
    (5, 13, 2),
    (8, 14, 2),
    (17, 15, 4),
    (14, 16, 2),
    (16, 17, 5),
    (19, 18, 4),
    (15, 19, 5),
    (20, 20, 1)

-- Insert data into PlayableCharacter
INSERT INTO DnD.PlayableCharacter
    (characterSheetId, playerId)
VALUES
    (15, 1),
    (11, 2),
    (18, 3),
    (6, 4),
    (19, 5),
    (10, 6),
    (12, 7),
    (7, 8),
    (9, 9),
    (13, 10),
    (2, 11),
    (1, 12),
    (4, 13),
    (3, 14),
    (5, 15),
    (14, 16),
    (16, 17),
    (8, 18),
    (20, 19),
    (17, 20)
GO

-- CREATED BY NIKOLAAS BREMS