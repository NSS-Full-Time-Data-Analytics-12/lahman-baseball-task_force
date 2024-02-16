-- Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team 
-- for which he played?

SELECT p.playerid, namegiven, height AS min_height, COUNT(a.g_all) AS games_played, t.teamid, t.name
FROM people AS p INNER JOIN appearances AS a USING(playerid)
INNER JOIN teams AS t USING(teamid)
WHERE height = (SELECT MIN(height) FROM people)
group by p.playerid, p.namegiven, p.height, t.teamid, t.name


-- crosschecking the number of games played by 
SELECT g_all AS games_played
from appearances 
where playerid = 'gaedeed01'

SELECT * from teams

