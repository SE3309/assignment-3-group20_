-- first query (the simple one without interesting feature): Select all players from the Leaside Wildcats and order by first name:
SELECT
	* FROM Player 
    WHERE teamName = 'Leaside Wildcats'
    ORDER BY fName;
    
-- second query: select how many goals each team scored in every match in October 2024:
SELECT 
    matchDate,
    matchTime,
    facilityNo,
    teamName,
    COUNT(*) AS goalsScored
FROM Goal
WHERE matchDate < '2024-11-01' AND matchDate >= '2024-10-01'
GROUP BY
    matchDate,
    matchTime,
    facilityNo,
    teamName
ORDER BY
    matchDate,
    matchTime,
    teamName;
    
-- third query: select all the ref information for refs that officiated at least one game in October 2025:
SELECT refID, fName, lName
FROM Referee
WHERE refID IN (
    SELECT DISTINCT refID
    FROM MatchEvent
    WHERE matchDate BETWEEN '2025-10-01' AND '2025-10-31'
      AND refID IS NOT NULL
);

-- fourth query: select all players that have scored a goal and an assist in the same game 
SELECT DISTINCT
    p.playerID,
    p.fName,
    p.lName,
    p.teamName
FROM Player p
WHERE EXISTS (
    SELECT 1
    FROM Goal g
    JOIN Assist a
      ON  a.matchDate  = g.matchDate
      AND a.matchTime  = g.matchTime
      AND a.facilityNo = g.facilityNo
    WHERE g.playerID = p.playerID
      AND a.playerID = p.playerID
);

-- Query 5: Select a count of total teams and total goals per league
SELECT
    t.leagueName,
    COUNT(*) AS totalGoals,
    COUNT(DISTINCT t.teamName) AS numTeams
FROM Team t
JOIN Goal g
  ON t.teamName = g.teamName
GROUP BY
    t.leagueName
ORDER BY
    totalGoals DESC;
    
-- query 6: average goals per game (in games where the team scored) per team:
SELECT
    teamName,
    AVG(goalsInGame) AS avgGoalsPerGame
FROM (
    SELECT
        matchDate,
        matchTime,
        facilityNo,
        teamName,
        COUNT(*) AS goalsInGame
    FROM Goal
    GROUP BY
        matchDate,
        matchTime,
        facilityNo,
        teamName
) AS per_game
GROUP BY
    teamName
ORDER BY
    avgGoalsPerGame DESC;
    
-- Query7: Players and their total assists (ordered by most number of assists)
SELECT 
    p.playerID,
    p.fName,
    p.lName,
    p.teamName,
    COUNT(a.playerID) AS
    totalAssists
FROM Player p
LEFT JOIN Assist a
  ON p.playerID = a.playerID
GROUP BY
    p.playerID, p.fName, p.lName, p.teamName
ORDER BY
    totalAssists DESC
    LIMIT 10;


