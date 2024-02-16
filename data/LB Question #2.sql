SELECT playerid, namefirst, namelast, namegiven, MIN(height) AS player_height 
FROM people
GROUP BY playerid 
ORDER BY player_height
LIMIT 1;


SELECT *
FROM teams;


SELECT playerid, namegiven, MIN(height) AS player_height, g_all, teamid, teams.name
FROM people LEFT JOIN appearances USING (playerid)
	 			LEFT JOIN teams USING (teamid)
WHERE playerid = 'gaedeed01'
GROUP BY playerid, namegiven, g_all, teamid, teams.name;


SELECT namegiven, MIN(height) AS player_height, g_all AS total_games_played, teams.name AS team_name
FROM people LEFT JOIN appearances USING (playerid)
	 			LEFT JOIN teams USING (teamid)
WHERE playerid = 'gaedeed01'
GROUP BY playerid, namegiven, g_all, teamid, teams.name;