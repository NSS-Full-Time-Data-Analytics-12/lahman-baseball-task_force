SELECT MIN(yearid) AS first_game, MAX(yearid) AS last_game
FROM appearances 
FULL JOIN collegeplaying USING (yearid);

SELECT yearid, COUNT(playerid)
FROM appearances
GROUP BY yearid
ORDER BY yearid;

SELECT yearid, COUNT(teamid)
FROM teams
GROUP BY yearid
ORDER BY yearid;

SELECT year, COUNT(team)
FROM homegames
GROUP BY year
ORDER BY year;

SELECT yearid, COUNT(playerid)
FROM pitching
GROUP BY yearid
ORDER BY yearid;

SELECT yearid, COUNT(votes)
FROM halloffame
GROUP BY yearid
ORDER BY yearid;

SELECT yearid, COUNT(playerid)
FROM fieldingofsplit
GROUP BY yearid
ORDER BY yearid;

SELECT yearid, COUNT(playerid)
FROM collegeplaying
GROUP BY yearid
ORDER BY yearid;

SELECT *
FROM collegeplaying
ORDER BY yearid;

