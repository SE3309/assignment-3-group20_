CREATE TABLE Mascot(
	mascot VARCHAR(50) NOT NULL,
    primaryColor VARCHAR(50) NOT NULL,
    secondaryColor VARCHAR(50),
    PRIMARY KEY (mascot)
);

DESCRIBE Mascot;

CREATE TABLE Team(
	teamName VARCHAR(100) NOT NULL, 
    leagueName VARCHAR(50) NOT NULL, 
    inPlayoffs BOOLEAN NOT NULL DEFAULT(0),
    city VARCHAR(50),
    mascot VARCHAR(50),
    PRIMARY KEY (teamName),
    FOREIGN KEY (mascot) REFERENCES Mascot (mascot)
);

ALTER TABLE Team 
DROP FOREIGN KEY fk_team_mascot;

ALTER TABLE Team
ADD CONSTRAINT fk_team_mascot
FOREIGN KEY (mascot)
REFERENCES Mascot(mascot)
ON DELETE SET NULL
ON UPDATE CASCADE;

DESCRIBE Team;


CREATE TABLE Player (
	playerID VARCHAR(10) NOT NULL,
    teamName VARCHAR(100),
    fName VARCHAR(30) NOT NULL,
    lName VARCHAR(30),
    dob DATE,
    address VARCHAR(255),
    phoneNum VARCHAR(20),
    email VARCHAR(255) UNIQUE NOT NULL,
    pword VARCHAR(255) NOT NULL,
    PRIMARY KEY (playerID),
    FOREIGN KEY (teamName) REFERENCES Team(teamName)
		ON UPDATE CASCADE
        ON DELETE SET NULL
);

DESCRIBE Player;

CREATE TABLE Referee (
	refID VARCHAR(10) NOT NULL,
    pword VARCHAR(255) NOT NULL,
    fName VARCHAR(30) NOT NULL,
    lName VARCHAR(30),
    email VARCHAR(255) UNIQUE NOT NULL,
    dob DATE,
    bankInfo VARCHAR(255) UNIQUE,
    PRIMARY KEY (refID)
);

DESCRIBE Referee;

CREATE TABLE Availability(
	refID VARCHAR(10) NOT NULL,
    availDate DATE NOT NULL,
    startTime TIME NOT NULL,
    endTime TIME NOT NULL,
    PRIMARY KEY (refID, availDate, startTime),
    FOREIGN KEY (refID) REFERENCES Referee (refID)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);
DESCRIBE Availability;

CREATE TABLE Facility(
	facilityNo INT NOT NULL, 
    address VARCHAR(255) NOT NULL,
    name VARCHAR(100),
    PRIMARY KEY (facilityNo)
);

DESCRIBE Facility;

CREATE TABLE MatchEvent(
	matchDate DATE NOT NULL,
    matchTime TIME NOT NULL,
    refID VARCHAR(10),
    homeTeam VARCHAR(100),			
    awayTeam VARCHAR(100),
    facilityNo INT NOT NULL,
    PRIMARY KEY (matchDate, matchTime, facilityNo),
    FOREIGN KEY (refID) REFERENCES Referee (refID)
		ON DELETE SET NULL
        ON UPDATE CASCADE,
	FOREIGN KEY (facilityNo) REFERENCES Facility (facilityNo)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (homeTeam) REFERENCES Team (teamName)
		ON DELETE SET NULL
        ON UPDATE CASCADE,
	FOREIGN KEY (awayTeam) REFERENCES Team (teamName)
		ON DELETE SET NULL
        ON UPDATE CASCADE
);

DESCRIBE MatchEvent;

CREATE TABLE Goal (
	matchDate DATE NOT NULL,
    matchTime TIME NOT NULL,
    timeScored TIME NOT NULL,
    facilityNo INT NOT NULL, 
    playerID VARCHAR(10) NOT NULL,
    teamName VARCHAR(100),
    PRIMARY KEY (matchDate, matchTime, timeScored, facilityNo),
    FOREIGN KEY (matchDate, matchTime, facilityNo) REFERENCES MatchEvent (matchDate, matchTime, facilityNo)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY (playerID) REFERENCES Player (playerID)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

ALTER TABLE Goal
DROP FOREIGN KEY Goal_ibfk_2;

ALTER TABLE Goal
MODIFY playerID VARCHAR(10) NULL;

ALTER TABLE Goal
ADD CONSTRAINT fk_goal_player
FOREIGN KEY (playerID)
REFERENCES Player(playerID)
ON DELETE SET NULL
ON UPDATE CASCADE;

DESCRIBE Goal;

CREATE TABLE Assist(
	matchDate DATE NOT NULL,
    matchTime TIME NOT NULL,
    timeScored TIME NOT NULL,
    facilityNo INT NOT NULL, 
    playerID VARCHAR(10) NOT NULL,
    teamName VARCHAR(100),
    assistType VARCHAR(15),
    PRIMARY KEY (matchDate, matchTime, timeScored, facilityNo, playerID),
    FOREIGN KEY (playerID) REFERENCES Player (PlayerID)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (matchDate, matchTime, timeScored, facilityNo) REFERENCES Goal (matchDate, matchTime, timeScored, facilityNo)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
    CHECK (assistType IN ('primary', 'secondary'))
);

DESCRIBE Assist;

CREATE TABLE Suspension(
	playerID VARCHAR(10) NOT NULL,
    matchDate DATE NOT NULL,
    matchTime TIME NOT NULL,
    facilityNo INT NOT NULL, 
    gamesInSuspension INT NOT NULL, 
    infraction VARCHAR(255),
    PRIMARY KEY(matchDate, playerId),
    FOREIGN KEY (playerID) REFERENCES Player (PlayerID)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY (matchDate, matchTime, facilityNo) REFERENCES MatchEvent (matchDate, matchTime, facilityNo)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	CHECK (gamesInSuspension>=0)
);

DESCRIBE Suspension;

CREATE TABLE Paycheck(
	paymentID INT NOT NULL,
    refID VARCHAR(10),
    datePaid DATE,
    paymentDueDate DATE,
    amountOwed INT,
    PRIMARY KEY (paymentID),
    FOREIGN KEY (refID) REFERENCES Referee(refID)
		ON UPDATE CASCADE
        ON DELETE SET NULL
);

DESCRIBE Paycheck;

DELIMITER $$
CREATE TRIGGER prevent_team_double_booking
BEFORE INSERT ON MatchEvent
FOR EACH ROW
BEGIN
    -- Home team clash
    IF NEW.homeTeam IS NOT NULL THEN
        IF EXISTS (
            SELECT 1
            FROM MatchEvent
            WHERE matchDate = NEW.matchDate
              AND matchTime = NEW.matchTime
              AND (homeTeam = NEW.homeTeam OR awayTeam = NEW.homeTeam)
        ) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Home team already has a match at this date/time';
        END IF;
    END IF;

    -- Away team clash
    IF NEW.awayTeam IS NOT NULL THEN
        IF EXISTS (
            SELECT 1
            FROM MatchEvent
            WHERE matchDate = NEW.matchDate
              AND matchTime = NEW.matchTime
              AND (homeTeam = NEW.awayTeam OR awayTeam = NEW.awayTeam)
        ) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Away team already has a match at this date/time';
        END IF;
    END IF;
END$$
DELIMITER ;





