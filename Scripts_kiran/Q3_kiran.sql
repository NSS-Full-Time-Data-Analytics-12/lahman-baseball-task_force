-- Q3: Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names 
-- as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. 
-- Which Vanderbilt player earned the most money in the majors?


SELECT DISTINCT people.playerid, namefirst, namelast, schoolname
FROM people
INNER JOIN collegeplaying ON people.playerid = collegeplaying.playerid
INNER JOIN schools ON collegeplaying.schoolid = schools.schoolid
WHERE schoolname = 'Vanderbilt University';

--Salary for all players; This gives incorrect salary
SELECT DISTINCT namefirst, namelast, schoolname, SUM(salaries.salary) AS tot_sal
FROM people
INNER JOIN collegeplaying ON people.playerid = collegeplaying.playerid
INNER JOIN schools ON collegeplaying.schoolid = schools.schoolid
FULL JOIN salaries ON people.playerid = salaries.playerid 
WHERE schoolname = 'Vanderbilt University'
GROUP BY namefirst, namelast, schoolname
ORDER BY tot_sal DESC NULLS LAST;


SELECT namefirst, namelast, SUM(salaries.salary)::numeric::money AS tot_sal
FROM people
FULL JOIN salaries USING (playerid)
WHERE playerid IN (SELECT playerid
FROM collegeplaying
WHERE schoolid = 'vandy')
GROUP BY namefirst, namelast
ORDER BY tot_sal DESC NULLS LAST


