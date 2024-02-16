
3. Find all players in the database who played at Vanderbilt University. Create a list showing each playerâ€™s first and last names as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?


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
