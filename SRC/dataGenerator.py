import csv
import random
from datetime import datetime, timedelta

#arb constraints set 
num_teams = 25
num_players = 350
num_refs = 50
num_facilities = 50
num_matches = 2000
max_goals_per_team = 5 #caps number of goals scored in one game by team (like a grace thing in some leagues)

#arbitrary leagues and cities to ensure we have some similarities for joins. 
LEAGUES = ["East", "West", "National", "Atlantic"]
CITIES = ["London", "Toronto", "Waterloo", "Ottawa", "Hamilton", "Kingston"]

#mascots
def gen_mascots():
    mascots = []
    for i in range(num_teams):  #just deciding to make the teams:mascot 1:1 for simplicitly
        name = f"Mascot{i+1}"
        primary = f"Colour{i+1}"
        secondary = f"ColourAlt{i+1}"
        mascots.append([name, primary, secondary])
    return mascots

def write_mascots(mascots):
    with open("Mascot.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["mascot", "primaryColor", "secondaryColor"])
        w.writerows(mascots)

#creating teams
def gen_teams(mascots):
    teams = []
    #go through the mascots to make sure they exist
    mascot_names = [m[0] for m in mascots]

    for i in range(num_teams):
        team_name = f"Team{i+1}"
        league = random.choice(LEAGUES)
        city = random.choice(CITIES)
        mascot = mascot_names[i] 
        in_playoffs = 0
        teams.append([team_name, league,in_playoffs, city, mascot])
    return teams

def write_teams(teams):
    with open("Team.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["teamName", "leagueName", "inPlayoffs", "city", "mascot"])
        w.writerows(teams)

#players
def gen_players(teams, max_per_team=15):
    players = []
    team_names = [t[0] for t in teams]

    #available slots based on how many teams there are
    slots = []
    for name in team_names:
        slots.extend([name] * max_per_team)

    #check if there are enough spots for players given
    if num_players > len(slots):
        print(f"unable to generate {num_players} with only {len(teams)} teams and {max_per_team} max per team. generating enough players to fill each team.")

    #Randomize which teams get which players
    random.shuffle(slots)

    for i in range(min(len(slots),num_players)):
        pid = f"P{i+1:04d}"
        team = slots[i]   #guaranteeing that no team will hold more than max_per_team players
        fname = f"FName{i+1}"
        lname = f"LName{i+1}"
        dob = f"19{random.randint(80, 99)}-{random.randint(1,12):02d}-{random.randint(1,28):02d}"
        addr = f"{i+1} Player St"
        phone = f"555-01{i:04d}"
        email = f"player{i+1}@example.com"
        pword = f"pword{i+1}"

        players.append([pid, team, fname, lname, dob, addr, phone, email, pword])

    return players

def write_players(players):
    with open("Player.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["playerID", "teamName", "fName", "lName",
                    "dob", "address", "phoneNum", "email", "pword"])
        w.writerows(players)

#refs
def gen_refs():
    refs = []
    for i in range(num_refs):
        rid = f"R{i+1:04d}"
        fname = f"RefF{i+1}"
        lname = f"RefL{i+1}"
        email = f"ref{i+1}@example.com"
        dob = f"19{random.randint(70, 95)}-{random.randint(1,12):02d}-{random.randint(1,28):02d}"
        bank = f"ACC{i+1:06d}"
        pword = f"refpass{i+1}"
        refs.append([rid, pword, fname, lname, email, dob, bank])
    return refs

def write_refs(refs):
    with open("Referee.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["refID", "pword", "fName", "lName", "email", "dob", "bankInfo"])
        w.writerows(refs)

#facility
def gen_facilities():
    facilities = []
    for i in range(num_facilities):
        fno = i + 2
        addr = f"{fno} Facility Rd"
        name = f"Field {fno}"
        facilities.append([fno, addr, name])
    return facilities

def write_facilities(facilities):
    with open("Facility.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["facilityNo", "address", "name"])
        w.writerows(facilities)

#matchevent
def gen_matches(teams, refs, facilities):
    matches = []
    team_names = [t[0] for t in teams]
    ref_ids = [r[0] for r in refs]
    fac_numbers = [f[0] for f in facilities]

    for i in range(num_matches):
        d = datetime.today() - timedelta(days=random.randint(0, 1825))
        matchDate = d.date().isoformat()
        matchTime = f"{10 + (i % 8):02d}:00:00"       # 10:00–17:00
        facilityNo = random.choice(fac_numbers)

        #make sure they are different teams (can't play yourself)
        homeTeam, awayTeam = random.sample(team_names, 2)
        refID = random.choice(ref_ids)

        #note --> we added a trigger in SQL to ensure no team gets scheduled to two games at the same time (as teams are not part of primary key)
        matches.append([matchDate, matchTime, refID, homeTeam, awayTeam, facilityNo])
    return matches

def write_matches(matches):
    with open("MatchEvent.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["matchDate", "matchTime", "refID",
                    "homeTeam", "awayTeam", "facilityNo"])
        w.writerows(matches)

#goal
def gen_goals(matches, players_by_team):
    goals = []

    for m in matches:
        matchDate, matchTime, refID, homeTeam, awayTeam, facilityNo = m

        home_goals = random.randint(0, max_goals_per_team)
        away_goals = random.randint(0, max_goals_per_team)

        #get players for each team - ensures that a goal recorded by a player is actually playing that game on one of the team,s
        home_players = players_by_team[homeTeam]
        away_players = players_by_team[awayTeam]

        #generate distinct minute offsets for PK uniqueness
        used_minutes = set()

        def add_goal(team_name, player_list, num_goals):
            nonlocal used_minutes
            for _ in range(num_goals):
                #ensure unique minute for goal and hour - goals can't be scored at the exact same time (choosing minutes as sig fig here for simplicity)
                while True:
                    minute = random.randint(1, 60)
                    hour = random.randint(1,2)
                    if minute not in used_minutes:
                        used_minutes.add(minute)
                        break
                #convert to time value hh:mm:ss (we’ll assume games are 2 hours for simplicity here)
                timeScored = f"{hour:02d}:{minute:02d}:00"
                player = random.choice(player_list)
                goals.append([matchDate, matchTime, timeScored,
                              facilityNo, player, team_name])

        add_goal(homeTeam, home_players, home_goals) #this ensures each goal is scored by a player on team playing match. 
        add_goal(awayTeam, away_players, away_goals)

    return goals

def write_goals(goals):
    with open("Goal.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["matchDate", "matchTime", "timeScored",
                    "facilityNo", "playerID", "teamName"])
        w.writerows(goals)

#helper to get players by team for goals table
def build_players_by_team(players):
    by_team = {}
    for p in players:
        pid, teamName = p[0], p[1]
        by_team.setdefault(teamName, []).append(pid)
    return by_team

#main method to call helpers
def main():
    mascots = gen_mascots()
    write_mascots(mascots)

    teams = gen_teams(mascots)
    write_teams(teams)

    players = gen_players(teams)
    write_players(players)

    refs = gen_refs()
    write_refs(refs)

    facilities = gen_facilities()
    write_facilities(facilities)

    matches = gen_matches(teams, refs, facilities)
    write_matches(matches)

    players_by_team = build_players_by_team(players)
    goals = gen_goals(matches, players_by_team)
    write_goals(goals)

if __name__ == "__main__":
    main()
