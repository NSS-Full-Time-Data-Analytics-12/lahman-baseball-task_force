---11. Is there any correlation between number of wins and team salary? Use data from 2000 and later to answer this question. 
---As you do this analysis, keep in mind that salaries across the whole league tend to increase together, so you may want to look on a year-by-year basis.

-----wins and salaries for year 2000--baseline
SELECT teamid, yearid, SUM(salary)::numeric::money
FROM salaries
WHERE yearid = 2000
GROUP BY teamid, yearid			
ORDER BY SUM(salary)::numeric::money DESC;

----team salaries for year 2000 with wins
SELECT teamid, teams.yearid, w, SUM(salary)::numeric::money AS team_salary, SUM(salary)::numeric::money/w AS cost_per_w
FROM teams LEFT JOIN salaries USING (teamid, yearid)
WHERE teams.yearid = 2000
GROUP BY teamid, teams.yearid, w
ORDER BY yearid, SUM(salary)::numeric::money;

-----salaries per win all years
SELECT teamid, teams.yearid, w, SUM(salary)::numeric::money AS team_salary, SUM(salary)::numeric::money/w AS cost_per_w
FROM teams LEFT JOIN salaries USING (teamid, yearid)
WHERE teams.yearid >= 2000
GROUP BY teamid, teams.yearid, w
ORDER BY yearid, SUM(salary)::numeric::money;

------cost per win by year
SELECT teams.yearid, SUM(w) AS total_w, SUM(salary)::numeric::money AS team_salary, SUM(salary)::numeric::money/SUM(w) AS cost_per_w
FROM teams LEFT JOIN salaries USING (teamid, yearid)
WHERE teams.yearid >= 2000
GROUP BY teams.yearid
ORDER BY yearid, SUM(salary)::numeric::money;

------total teams salary by year
SELECT teams.yearid, SUM(salary)::numeric::money AS team_salary
FROM teams LEFT JOIN salaries USING (teamid, yearid)
WHERE teams.yearid >= 2000
GROUP BY teams.yearid
ORDER BY teams.yearid;

------AVG teams salary by year
SELECT teams.yearid, SUM(salary)::numeric::money AS team_salary
FROM teams LEFT JOIN salaries USING (teamid, yearid)
WHERE teams.yearid = 2000
GROUP BY teams.yearid
ORDER BY teams.yearid;

-----by team NYA
SELECT teamid, teams.yearid, w, SUM(salary)::numeric::money AS team_salary
FROM teams LEFT JOIN salaries USING (teamid, yearid)
WHERE teams.yearid >= 2000 AND teamid = 'NYA'
GROUP BY teamid, teams.yearid, w
ORDER BY yearid, SUM(salary)::numeric::money;

----
----Some years it seems favor spending more money got you more wins but there was no guarantee as large salaries usually had more than 80 wins.
