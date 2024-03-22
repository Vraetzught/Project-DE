-- CREATED BY NIKOLAAS BREMS

-- LES 3: SELECT/WHERE
-- 1. Geef alle spelers van wie het emailadres heeft dat eindigt op "@hotmail.com".
SELECT *
FROM DnD.Player
WHERE email LIKE '%@hotmail.com'
		GO

-- 2. Geef alle karakters met level hoger dan 2.
SELECT *
FROM DnD.CharacterSheet
WHERE [level] > 2
		GO

-- 3. Geef alle achtergronden waar de 'skill profficiency' 'Investigation' bevat.
SELECT name
FROM DnD.Background
WHERE skillProficiency LIKE '´%Investigation%' OR skillProficiency LIKE '%Investigation' OR skillProficiency LIKE 'Investigation%'
		GO

-- 4. Geef alle rassen welke  een snelheidwaarde hebben van 30 of meer.
SELECT name
FROM DnD.Race
WHERE speed >= 30
		GO

-- 5. Geef alle alignments van het subtype 'evil'.
SELECT name
from DnD.Alignment
WHERE name LIKE '%evil'

-- LES 4: SCALAIRE FUNCTIES
-- 1. Geef het totaal aantal rassen met darkvision
SELECT COUNT(id) AS 'rassen met darkvision'
FROM DnD.Race
WHERE vision = 'Darkvision'
		GO

-- 2. Geef de namen van alle karakters, met hun level in een enkele string
SELECT CONCAT(name, ', level ', level) AS 'Naam en Level'
FROM DnD.CharacterSheet
		GO

-- 3. Geef alle rassen met hun Vision in title case
SELECT UPPER(CONCAT(name, ', ', vision))
FROM DnD.Race
		GO

-- 4. Geef de levels +2 van elk karakter
SELECT name, level + 2 AS 'level plus 2'
FROM DnD.CharacterSheet
		GO

-- 5. Toon de e-mailadressen van spelers met de eerste vier tekens in omgekeerde volgorde
SELECT RIGHT(REVERSE(email), 4) + RIGHT(email, LEN(email) - 4)
		AS ReversedEmail
FROM DnD.Player;
		GO

-- LES 5: JOINS
-- 1. Haal de namen van spelers, hun e-mails en de namen van de karakters die ze spelen op.
SELECT Player.name AS Speler, Player.email AS Email, CharacterSheet.name AS Personage
FROM DnD.Player
	INNER JOIN DnD.PlayableCharacter ON Player.id = PlayableCharacter.PlayerId
	INNER JOIN DnD.CharacterSheet ON PlayableCharacter.characterSheetId = CharacterSheet.id
		GO

-- 2. Geef de namen van karakters, hun levels en de bijbehorende klassen weer
SELECT CharacterSheet.name AS Naam, CharacterSheet.level AS level, Class.name as Class
FROM DnD.CharacterSheet
	INNER JOIN DnD.CharacterClass ON CharacterSheet.id = CharacterClass.characterId
	INNER JOIN DnD.Class ON CharacterClass.classid = Class.id
		GO

-- 3. Haal de namen van karakters en hun achtergronden op, inclusief de vaardigheidsbekwaamheden van die achtergronden
SELECT CharacterSheet.name AS Personage, Background.name AS Achtergrond, Background.skillProficiency AS Vaardigheden
FROM DnD.CharacterSheet INNER JOIN DnD.Background ON CharacterSheet.backgroundId = Background.id
		GO

-- 4. Toon de namen van karakters, hun rassen en de snelheid van die rassen
SELECT CharacterSheet.name AS Name, Race.name AS Race, Race.speed AS Speed
FROM DnD.CharacterSheet INNER JOIN DnD.Race
	ON CharacterSheet.raceId = Race.id
		GO

-- 5. Toon alle details van de karakters, inclusief hun naam, plaats, niveau, bijbehorende race, achtergrond en alignment
SELECT CharacterSheet.name AS Name,
	Alignment.name AS Alignment,
	CharacterSheet.place AS Location,
	Race.name AS Race,
	Background.name AS Background,
	Class.name AS Class,
	CharacterSheet.level AS Level
FROM DnD.CharacterSheet
	INNER JOIN DnD.Alignment ON CharacterSheet.alignemntId = Alignment.id
	INNER JOIN DnD.Race ON CharacterSheet.raceId = Race.id
	INNER JOIN DnD.Background ON CharacterSheet.backgroundId = Background.id
	INNER JOIN DnD.CharacterClass ON CharacterSheet.id = CharacterClass.characterId
	INNER JOIN DnD.Class ON CharacterClass.classId = Class.id
		GO

-- LES 6: SUBQUERIES
-- 1. Geef alle karakters weer die behoren tot spelers met een e-mailadres dat eindigt op ".com"
SELECT CharacterSheet.name AS Name
FROM DnD.CharacterSheet
WHERE id IN (
			SELECT playerId
FROM DnD.PlayableCharacter
WHERE characterSheetId IN (
        		SELECT id
FROM DnD.Player
WHERE email LIKE '%.com'
    		)
		)
		GO

-- 2. Haal alle achtergronden op die niet zijn toegewezen aan een karakter
SELECT Background.name as background
FROM DnD.Background
WHERE id NOT IN (
			SELECT backgroundId
FROM DnD.CharacterSheet
		)
		GO

-- 3. Haal alle personages op met een niveau hoger dan het gemiddelde niveau van alle personages
SELECT [name]
FROM DnD.CharacterSheet
WHERE [level] > (
			SELECT AVG([level])
FROM DnD.CharacterSheet
		)
		GO

-- 4. Toon alle personages en hun levels die behoren tot spelers met een e-mailadres dat eindigt op "@outlook.com"
SELECT [name], [level]
FROM DnD.CharacterSheet
WHERE id IN (
			SELECT characterSheetId
FROM DnD.PlayableCharacter
WHERE playerId IN (
				SELECT id
FROM DnD.Player
WHERE email LIKE '%@outlook.com'
			)
		)
		GO

-- 5. Toon alle spelers die minstens één personage hebben van hetzelfde ras als een personage van de speler 'Anderson, Isabella
SELECT Player.name, Player.firstName
FROM DnD.Player
	INNER JOIN DnD.PlayableCharacter ON Player.id = PlayableCharacter.playerId
	INNER JOIN DnD.CharacterSheet ON PlayableCharacter.characterSheetId = CharacterSheet.id
	INNER JOIN DnD.Race ON CharacterSheet.raceId = Race.id
WHERE Race.id IN (
			SELECT CharacterSheet.raceId
	FROM DnD.Player
		INNER JOIN DnD.PlayableCharacter ON Player.id = PlayableCharacter.playerId
		INNER JOIN DnD.CharacterSheet ON PlayableCharacter.characterSheetId = CharacterSheet.id
		INNER JOIN DnD.Race ON CharacterSheet.raceId = Race.id
	WHERE CONCAT(Player.name, ', ', Player.firstName) = 'Anderson, Isabella'
		)
	AND CONCAT(Player.name, ', ', Player.firstName) != 'Anderson, Isabella'
		GO

-- LES 6: SET_FUNCTIES
-- 1. Geef het aantal verschillende races weer in de Race-tabel
SELECT COUNT(Race.id)
FROM DnD.Race
		GO

-- 2. Toon het aantal personages per level
SELECT [level], COUNT(*) AS 'Aantal personages'
FROM DnD.CharacterSheet
GROUP BY [level]
ORDER BY [level]
		GO

-- 3. Haal het aantal personages op voor elk ras in de Race-tabel
SELECT Race.name, COUNT(CharacterSheet.id)
FROM DnD.Race
	LEFT JOIN DnD.CharacterSheet ON Race.id = CharacterSheet.raceId
GROUP BY Race.name
		GO

-- LES 7: GROUP BY
-- 1. Toon alle e-maildomeinen met minder dan drie spelers
SELECT SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email)) AS domein
FROM DnD.Player
GROUP BY SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email))
HAVING count(id) < 3
GO

-- 2. Toon het aantal achtergronden met minder dan twee personages
SELECT Background.name
FROM DnD.Background
	LEFT JOIN DnD.CharacterSheet ON Background.id = CharacterSheet.backgroundId
GROUP BY Background.name
HAVING COUNT(CharacterSheet.backgroundId) < 2
GO

-- 3. Toon alle levels waarvan het aantal personages hoger is dan het gemiddelde aantal personages
SELECT level, COUNT(*) AS numberOfCharacters
FROM DnD.CharacterSheet
GROUP BY level
HAVING COUNT(*) > (
	SELECT AVG(count)
FROM (
		SELECT COUNT(*) AS count
	FROM DnD.CharacterSheet
	GROUP BY level
	) AS GemiddeldePerLevel
)
GO

-- 4. Toon het aantal achtergronden per race
SELECT Race.name, COUNT(Background.id) as NumberOfBackgrounds
FROM DnD.Race
	LEFT JOIN DnD.CharacterSheet ON Race.id = CharacterSheet.raceId
	LEFT JOIN DnD.Background ON CharacterSheet.backgroundId = Background.id
GROUP BY Race.name
GO

-- 5. Haal het aantal personages op per ras, met alignment in de subcategorie "good".
SELECT Race.name, COUNT(CharacterSheet.id) AS GoodCharactersPerRace
FROM DnD.Race
	LEFT JOIN DnD.CharacterSheet ON Race.id = CharacterSheet.raceId
	INNER JOIN DnD.Alignment ON CharacterSheet.alignemntId = Alignment.id
WHERE Alignment.name LIKE '%good'
GROUP BY Race.name
GO

-- CREATED BY NIKOLAAS BREMS