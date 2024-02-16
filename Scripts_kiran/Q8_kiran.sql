--Q8 Using the attendance figures from the homegames table, find the teams and parks which had the top 5 average attendance per game 
-- in 2016 (where average attendance is defined as total attendance divided by number of games). Only consider parks where there 
-- were at least 10 games played. Report the park name, team name, and average attendance. 
-- Repeat for the lowest 5 average attendance.

SELECT * FROM homegames;

-- Avg attendance

SELECT year, team, park,(attendance/games)::numeric AS avg_attendance
FROM homegames
WHERE year = 2016 AND games>=10
ORDER BY avg_attendance DESC

-- Joining for team and park name:

SELECT name AS team_name, t.park AS park_name,(attendance/games)::numeric AS avg_attendance
FROM homegames AS h
INNER JOIN teams AS t USING(attendance)
WHERE year = 2016 AND games>=10
ORDER BY avg_attendance DESC
LIMIT 5;

SELECT name, t.park,(attendance/games)::numeric AS avg_attendance
FROM homegames AS h
INNER JOIN teams AS t USING(attendance)
WHERE year = 2016 AND games>=10
ORDER BY avg_attendance ASC
LIMIT 5;

--both outputs:

