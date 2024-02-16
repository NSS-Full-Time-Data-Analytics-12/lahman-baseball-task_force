-- 8. Using the attendance figures from the homegames table, find the teams and parks which had the top 5 average attendance per game in 2016 (where average attendance is defined as total attendance divided by number of games). Only consider parks where there were at least 10 games played. Report the park name, team name, and average attendance. Repeat for the lowest 5 average attendance.

SELECT games
FROM homegames;

SELECT *
FROM teams;

SELECT name AS team_name, 
       t.park AS park_name,
	   (attendance/games)::numeric AS avg_attendance
FROM homegames AS h INNER JOIN teams AS t USING(attendance)
WHERE games >=10 AND year = 2016
GROUP BY name, t.park, attendance, games
ORDER BY avg_attendance DESC
LIMIT 5;

SELECT name AS team_name, 
       t.park AS park_name,
	   (attendance/games)::numeric AS avg_attendance
FROM homegames AS h INNER JOIN teams AS t USING(attendance)
WHERE games >=10 AND year = 2016
-- GROUP BY name, t.park, attendance, games
ORDER BY avg_attendance 
LIMIT 5;