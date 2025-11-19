-- Insert via subquery: insert player into team with the smallest roster
INSERT INTO Player (playerID, teamName, fName, lName, dob, email, pword)
SELECT 
    'P901', 
    t.teamName,
    'Macy',
    'Matt',
    '2001-10-12',
    'macy.m@example.com',
    'pass123'
FROM Team t
ORDER BY (
    SELECT COUNT(*) 
    FROM Player p 
    WHERE p.teamName = t.teamName
) ASC
LIMIT 1;
-- checks to see player was added to correct team
SELECT 
    t.teamName,
    COUNT(p.playerID) AS rosterSize
FROM Team t
LEFT JOIN Player p ON t.teamName = p.teamName
GROUP BY t.teamName
ORDER BY rosterSize ASC;

SELECT * 
FROM Player
WHERE playerID = 'P901';

-- Update multiple rows at once: updates all referees who have not been paid by Dec 31 due date by adding a late-penalty of 10%.

SELECT * FROM Paycheck WHERE paymentDueDate < "2025-12-31";

SET SQL_SAFE_UPDATES=0;
UPDATE Paycheck
SET amountOwed = amountOwed * 1.10
WHERE paymentDueDate < "2025-12-31"
  AND datePaid IS NULL;
  
SELECT * FROM Paycheck; -- check updated paycheck table

-- Delete multiple rows: delete game suspension if game 
SELECT * FROM Suspension;

DELETE s
FROM Suspension s
WHERE EXISTS (
    SELECT *
    FROM MatchEvent m
    WHERE m.matchDate > s.matchDate
      AND (
            m.homeTeam IN (
                SELECT teamName FROM Player WHERE playerID = s.playerID
          ) OR
            m.awayTeam IN (
                SELECT teamName FROM Player WHERE playerID = s.playerID
          )
      )
)
AND s.gamesInSuspension = 1;
