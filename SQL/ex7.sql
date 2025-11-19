-- first view: GameResults (this matches with our derived attributes from our last ER diagram)
CREATE VIEW GameResults AS
WITH goals_per_team AS (
    SELECT
        matchDate,
        matchTime,
        facilityNo,
        teamName,
        COUNT(*) AS goals
    FROM Goal
    GROUP BY
        matchDate,
        matchTime,
        facilityNo,
        teamName
)
SELECT
    m.matchDate,
    m.matchTime,
    m.refID,
    m.homeTeam,
    m.awayTeam,
    m.facilityNo,
    gh.goals AS homeGoals,
    ga.goals AS awayGoals,
    CASE
        WHEN gh.goals > ga.goals THEN 2
        WHEN gh.goals = ga.goals THEN 1
        ELSE 0
    END AS homeTeamPoints,
    CASE
        WHEN ga.goals > gh.goals THEN 2
        WHEN ga.goals = gh.goals THEN 1
        ELSE 0
    END AS awayTeamPoints
FROM MatchEvent m
LEFT JOIN goals_per_team gh
  ON  m.matchDate  = gh.matchDate
  AND m.matchTime  = gh.matchTime
  AND m.facilityNo = gh.facilityNo
  AND m.homeTeam   = gh.teamName
LEFT JOIN goals_per_team ga
  ON  m.matchDate  = ga.matchDate
  AND m.matchTime  = ga.matchTime
  AND m.facilityNo = ga.facilityNo
  AND m.awayTeam   = ga.teamName;
  
-- we know the results of this game are maple leafs won
SELECT * FROM GameResults WHERE matchDate = '2025-10-04';

-- second view: creating a view for a team to see their list of players (not their passwords) and how many goals each player on the team has 
CREATE VIEW Team1Roster AS (
	SELECT 
    p.playerID,
    p.fName,
    p.lName,
    p.dob,
    p.address,
    p.phoneNum, 
    p.email,
    COUNT(g.playerID) AS goalsScored
	FROM Player p
	LEFT JOIN Goal g
	  ON g.playerID = p.playerID
	WHERE p.teamName = 'Team1'
	GROUP BY
		p.playerID,
		p.fName,
		p.lName,
		p.dob,
		p.address,
		p.phoneNum, 
		p.email);
SELECT * FROM Team1Roster;

-- demonstrating update fails
INSERT INTO GameResults (
    matchDate, matchTime, facilityNo, 
    homeTeam, awayTeam,
    homeGoals, awayGoals,
    homePoints, awayPoints
)
VALUES (
    '2025-10-05', '19:00:00', 1,
    'Toronto Maple Leafs', 'Leaside Wildcats',
    4, 1,
    2, 0
);

INSERT INTO Team1Roster (
    playerID, fName, lName, dob, address, phoneNum, email, goalsScored
)
VALUES ('P1', 'jaime', 'anderson', '2004-10-04', '2 Bayview Road', '4169195553','jande255@uwo.ca',10);

