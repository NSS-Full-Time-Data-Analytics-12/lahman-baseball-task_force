/*From 1970 – 2016, what is the largest number of wins for a team that did not win the world series?
What is the smallest number of wins for a team that did win the world series? 
Doing this will probably result in an unusually small number of wins for a world series champion
– determine why this is the case. Then redo your query, excluding the problem year. 
How often from 1970 – 2016 was it the case that a team with the most wins also won the world series?
What percentage of the time?*/



select * from teams;


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
where t2.yearid = t1.yearid) AND t1.yearid BETWEEN '1970' AND '2016' AND wswin = 'Y'