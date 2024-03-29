-- 1. What range of years for baseball games played does the provided database cover? 

SELECT MAX(yearid), MIN(yearid)
FROM appearances FULL JOIN collegeplaying USING(yearid);


-- 2. Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played?

SELECT MIN(height), p.namegiven, COUNT(a.g_all), a.teamid, t.name
FROM people AS p INNER JOIN appearances AS a USING(playerid)
				 INNER JOIN teams AS t USING(teamid)
GROUP BY height, namegiven, a.teamid, t.name
ORDER BY height
LIMIT 1;

-- 3. Find all players in the database who played at Vanderbilt University. Create a list showing each playerâ€™s first and last names as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?

SELECT namefirst, namelast, 
	   SUM(salaries.salary)::numeric::money AS tot_sal
FROM people
FULL JOIN salaries USING (playerid)
WHERE playerid IN (SELECT DISTINCT playerid
FROM collegeplaying
WHERE schoolid = 'vandy')
GROUP BY namefirst, namelast
ORDER BY tot_sal DESC NULLS LAST;


-- SELECT playerid, 
--        p.namefirst AS first_name, 
-- 	   p.namelast AS last_name,
-- 	   SUM(salary)::numeric::money AS total_salary
-- FROM people AS p INNER JOIN collegeplaying AS c USING(playerid)
-- 				 INNER JOIN schools AS sc USING(schoolid)
-- 				 FULL JOIN salaries USING(playerid)
-- WHERE schoolname = 'Vanderbilt University'
-- GROUP BY playerid, 
--          p.namefirst, 
-- 	     p.namelast 
-- ORDER BY total_salary DESC NULLS LAST;

-- 4. Using the fielding table, group players into three groups based on their position: label players with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as "Infield", and those with position "P" or "C" as "Battery". Determine the number of putouts made by each of these three groups in 2016.

SELECT SUM(po) AS total_po,
	CASE WHEN pos = 'OF' THEN 'Outfield'
	     WHEN pos IN ('SS','1B','2B','3B') THEN 'Infield'
	     WHEN pos IN ('P','C') THEN 'Battery' END AS positions
FROM fielding
WHERE yearid= 2016
GROUP BY positions
ORDER BY total_po DESC;

-- 7. From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? What is the smallest number of wins for a team that did win the world series? Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case. Then redo your query, excluding the problem year. How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? What percentage of the time?

SELECT wswin, MAX(w) AS win, yearid, teamid
FROM teams
where wswin = 'N' AND yearid BETWEEN '1970' AND '2016'
GROUP BY w,wswin, yearid,teamid
ORDER BY w DESC;

SELECT wswin, MIN(w),yearid, teamid
FROM teams
where wswin = 'Y' AND yearid BETWEEN '1970' AND '2016' 
GROUP BY w,wswin,yearid, teamid
ORDER BY w;

SELECT wswin, MIN(w),yearid, teamid, name
FROM teams
where wswin = 'Y' AND yearid BETWEEN '1970' AND '2016' AND yearid <> '1981'
GROUP BY w,wswin,yearid, teamid, name
ORDER BY w;


SELECT wswin, MAX(w) AS win, yearid, teamid
FROM teams
where wswin = 'Y' AND yearid BETWEEN '1970' AND '2016'
GROUP BY w,wswin, yearid,teamid
ORDER BY w DESC;


SELECT COUNT(*),(COUNT(*)::decimal/(2016-1970)*100) AS percent
FROM teams AS t1
WHERE t1.w = (SELECT  MAX(w) AS wins
FROM teams AS t2
where t2.yearid = t1.yearid) AND t1.yearid BETWEEN '1970' AND '2016' AND wswin = 'Y';

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

-- 9.-- Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)?
---Give their full name and the teams that they were managing when they won the award.

SELECT *
FROM awardsmanagers;

SELECT *
FROM people;

SELECT DISTINCT am.lgid, 
       am.playerid,
	   p.namefirst, 
	   p.namelast,
	   t.name AS team_name
FROM awardsmanagers AS am INNER JOIN people AS p USING (playerid)
						  INNER JOIN teams AS t USING(lgid) 
WHERE am.awardid = 'TSN Manager of the Year' 
AND (am.lgid = 'NL' OR am.lgid = 'AL')
GROUP BY am.playerid, am.lgid, p.namefirst, p.namelast,t.name
HAVING COUNT(DISTINCT am.lgid) = 2
ORDER BY am.playerid;


-- 13. It is thought that since left-handed pitchers are more rare, causing batters to face them less often, that they are more effective. Investigate this claim and present evidence to either support or dispute this claim. First, determine just how rare left-handed pitchers are compared with right-handed pitchers. Are left-handed pitchers more likely to win the Cy Young Award? Are they more likely to make it into the hall of fame?

-- determine just how rare left-handed pitchers are compared with right-handed pitchers. 
SELECT (SELECT COUNT(throws)
               FROM people
               WHERE throws= 'L'
               GROUP BY throws)::numeric/COUNT(throws)::numeric * 100
FROM people
WHERE throws = 'R';
-- Are left-handed pitchers more likely to win the Cy Young Award?                 

WITH left_hand_cy AS (SELECT playerid
FROM people
WHERE throws= 'L'
INTERSECT
SELECT playerid
FROM awardsshareplayers
WHERE awardid = 'Cy Young')

SELECT  COUNT(playerid)
FROM left_hand_cy INNER JOIN awardsshareplayers AS ASP USING(playerid)
GROUP BY playerid

SELECT COUNT(awardid)
FROM awardsshareplayers
WHERE awardid = 'Cy Young'

