-- all of the plain inserts are to ensure each table has some meaningful data (these will all be considered one 'unique' insert)
INSERT INTO Referee
VALUES
  ('R001', 'abcd', 'John', 'Smith', 'jsmith@uwo.ca', '1980-01-01', 'TD193845748'),
  ('R002', '1234', 'Jane',  'Smith', 'jsmith1@ivey.ca','1990-10-04', 'RBC09876545'),
  ('R003', 'hello!', 'Samantha',  'Boyd', 'sboyd@gmail.com','2004-12-31', 'BMO098765456'),
  ('R004', 'pword3!', 'alex', 'roberts', 'aroberts@gmail.com', '1980-05-01', 'BMO9876545'),
  ('R005', '123enter', 'sam',  'smith', 'ssmith2@yahoo.com','1990-11-06', 'TD0987667');

SELECT * FROM Referee;

INSERT INTO Mascot
VALUES
  ('Wildcats','Red','White'),
  ('Leafs',  'Blue','White'),
  ('Flyers','Orange','Black'),
  ('Knights','Green','Yellow'),
  ('Raptors','Red','White');
  
INSERT INTO Team (teamName, leagueName, city, mascot)
VALUES
  ('Leaside Wildcats','East', 'London', 'Wildcats'),
  ('Toronto Maple Leafs', 'East', 'Toronto','Leafs'),
  ('Donmills Flyers','East', 'Toronto','Flyers'),
  ('London Knights', 'West', 'London','Knights'),
  ('Toronto Raptors','East', 'Toronto', 'Raptors');
  
INSERT INTO Facility (facilityNo, address, name)
VALUES (1, '1 York Street', 'Scotiabank Arena');

INSERT INTO MatchEvent (
    matchDate, matchTime, refID, homeTeam, awayTeam, facilityNo
) VALUES
    ('2025-10-04', '19:00:00', 'R001', 'Leaside Wildcats', 'Toronto Maple Leafs', 1),
    ('2025-10-12', '19:00:00', 'R001', 'Leaside Wildcats', 'Donmills Flyers', 1),
    ('2025-10-31', '19:00:00', 'R003', 'Donmills Flyers', 'Toronto Maple Leafs', 1),
    ('2025-09-03', '19:30:00', 'R004', 'Leaside Wildcats', 'Toronto Raptors', 1),
    ('2025-09-30', '20:00:00', 'R005', 'Toronto Raptors', 'Donmills Flyers', 1);


-- unique 1
INSERT INTO Paycheck (paymentID, refID, datePaid, paymentDueDate, amountOwed)
	SELECT
		ROW_NUMBER() OVER () + 10   AS paymentID,
		m.refID,             
		NULL AS datePaid,
		'2025-12-10' AS paymentDueDate,
		COUNT(*) * 100 AS amountOwed
	FROM MatchEvent m
	WHERE m.matchDate BETWEEN '2025-10-01' AND '2025-10-31'
	  AND m.refID IS NOT NULL
	GROUP BY m.refID;
 
 SELECT * FROM Paycheck; 
 
 
-- unique #2
INSERT INTO MatchEvent (matchDate, matchTime, refID, homeTeam, awayTeam, facilityNo)
	SELECT
		'2025-11-01'        AS matchDate,
		'19:00:00'          AS matchTime,
		'R002'              AS refID,
		h.teamName          AS homeTeam,
		a.teamName          AS awayTeam,
		1                   AS facilityNo
	FROM Team h
	JOIN Team a
	  ON h.leagueName =  a.leagueName
	 AND h.teamName <> a.teamName           -- not the same team name
	WHERE NOT EXISTS (
		SELECT 1
		FROM MatchEvent m
		WHERE m.matchDate = '2025-11-01'
		  AND m.matchTime = '19:00:00'
		  AND (
				m.homeTeam IN (h.teamName, a.teamName)
			 OR m.awayTeam IN (h.teamName, a.teamName)
		  )
	)
	LIMIT 1;
    
SELECT * FROM MatchEvent;


-- making sure each table has 5 reasonable entries
INSERT INTO Player
VALUES
  ('P1', 'Toronto Maple Leafs', 'jaime', 'anderson', '2004-10-04', '2 Bayview Road', '4169195553','jande255@uwo.ca','passpass'),
  ('P2', 'Toronto Maple Leafs', 'mara', 'sanauceanu', '2004-11-08', '3 Toronto Road', '4169047382','msanau@uwo.ca','passpass!'),
  ('P3', 'Toronto Maple Leafs', 'robbie', 'evans', '2004-03-08', '1011 Yonge Street', '6478493827','revans15@uwo.ca','password!'),
  ('P4', 'Leaside Wildcats', 'michael', 'dailo', '2004-02-09', '45 Leaside Road', '4168574832','mdaillo9@uwo.ca','secretpass'),
  ('P5', 'Leaside Wildcats', 'luke', 'pinto', '2004-04-21', '92 Mt pleasant Street', '6470987648','lpinto3@uwo.ca','hashpass');
  
INSERT INTO Paycheck
VALUES
  ('13', 'R002', NULL, '2025-12-31', 400),
  ('14', 'R004', NULL, '2025-12-31', 350),
  ('15', 'R005', '2025-09-25', '2025-10-31', 350);
  
INSERT INTO Goal (matchDate, matchTime, timeScored, facilityNo, playerID, teamName)
VALUES
  ('2025-10-04', '19:00:00', '00:05:00', 1, 'P1', 'Toronto Maple Leafs'),   -- Jaime Anderson
  ('2025-10-04', '19:00:00', '00:12:30', 1, 'P4', 'Leaside Wildcats'),      -- Michael Dailo
  ('2025-10-04', '19:00:00', '00:28:45', 1, 'P2', 'Toronto Maple Leafs'),   -- Mara Sanauceanu
  ('2025-10-04', '19:00:00', '00:34:10', 1, 'P5', 'Leaside Wildcats'),      -- Luke Pinto
  ('2025-10-04', '19:00:00', '00:51:20', 1, 'P3', 'Toronto Maple Leafs');   -- Robbie Evans
  
INSERT INTO Assist (matchDate, matchTime, timeScored, facilityNo, playerID, teamName, assistType)
VALUES
  ('2025-10-04', '19:00:00', '00:05:00', 1, 'P2', 'Toronto Maple Leafs', 'primary'),
  ('2025-10-04', '19:00:00', '00:05:00', 1, 'P3', 'Toronto Maple Leafs', 'secondary'),
  ('2025-10-04', '19:00:00', '00:12:30', 1, 'P5', 'Leaside Wildcats', 'primary'),
  ('2025-10-04', '19:00:00', '00:34:10', 1, 'P4', 'Leaside Wildcats', 'primary'),
  ('2025-10-04', '19:00:00', '00:51:20', 1, 'P1', 'Toronto Maple Leafs', 'primary');


INSERT INTO Availability (refID, availDate, startTime, endTime)
VALUES
  ('R001', '2025-10-01', '18:00:00', '21:00:00'),
  ('R001', '2025-10-03', '17:30:00', '20:30:00'),
  ('R001', '2025-10-05', '14:00:00', '18:00:00'),
  ('R001', '2025-10-08', '19:00:00', '22:00:00'),
  ('R001', '2025-10-10', '16:00:00', '19:00:00');
  
INSERT INTO Suspension (playerID, matchDate, matchTime, facilityNo, gamesInSuspension, infraction) VALUES
  ('P1', '2025-10-04', '19:00:00', 1, 1, 'Unsportsmanlike conduct'),
  ('P2', '2025-10-04', '19:00:00', 1, 2, 'Serious foul play'),
  ('P3', '2025-10-04', '19:00:00', 1, 1, 'Dissent towards referee'),
  ('P4', '2025-10-04', '19:00:00', 1, 3, 'Violent conduct'),
  ('P5', '2025-10-04', '19:00:00', 1, 1, 'Professional foul');

SELECT * FROM Referee;
SELECT * FROM Mascot;
SELECT * FROM Team;
SELECT * FROM Facility;
SELECT * FROM MatchEvent;
SELECT * FROM Paycheck;
SELECT * FROM Player;
SELECT * FROM Goal;
SELECT * FROM Suspension;
SELECT * FROM Assist;
SELECT * FROM Availability;