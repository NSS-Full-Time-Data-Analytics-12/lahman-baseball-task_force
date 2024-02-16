
-- 2. Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played?

SELECT MIN(height), p.namegiven, COUNT(a.g_all), a.teamid, t.name
FROM people AS p INNER JOIN appearances AS a USING(playerid)
				 INNER JOIN teams AS t USING(teamid)
GROUP BY height, namegiven, a.teamid, t.name
ORDER BY height
LIMIT 1




