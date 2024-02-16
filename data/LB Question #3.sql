SELECT *
FROM collegeplaying 
	LEFT JOIN schools USING (schoolid)
WHERE schoolname ILIKE 'Vanderbilt University';
	
	
SELECT DISTINCT playerid, schoolname 
FROM collegeplaying 
	LEFT JOIN schools USING (schoolid)
WHERE schoolname = 'Vanderbilt University';


SELECT DISTINCT playerid, schoolname, people.namefirst, people.namelast  
FROM collegeplaying 
	LEFT JOIN schools USING (schoolid)
	LEFT JOIN people USING (playerid)
WHERE schoolname = 'Vanderbilt University';


SELECT DISTINCT playerid, schoolname, people.namefirst, people.namelast, CAST(SUM(salaries.salary)AS money) AS total_salary
FROM collegeplaying 
	LEFT JOIN schools USING (schoolid)
	LEFT JOIN people USING (playerid)
	LEFT JOIN salaries USING (playerid)
WHERE schoolname = 'Vanderbilt University'
GROUP BY playerid, schoolname, people.namefirst, people.namelast
ORDER BY total_salary DESC NULLS LAST;