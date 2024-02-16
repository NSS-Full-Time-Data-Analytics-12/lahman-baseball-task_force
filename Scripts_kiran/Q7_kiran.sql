-- Q7  From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? 
-- What is the smallest number of wins for a team that did win the world series? Doing this will probably result in an unusually
-- small number of wins for a world series champion – determine why this is the case. Then redo your query, excluding the 
-- problem year. 
-- How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? What percentage of the 
-- time?

SELECT * FROM teams;

-- From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? 

SELECT yearid, teamid, MAX(w) AS max_wincount
FROM teams
WHERE WSWin = 'N' AND yearid BETWEEN 1970 AND 2016
GROUP BY yearid, teamid
ORDER BY max_wincount DESC;

-- What is the smallest number of wins for a team that did win the world series.

SELECT yearid, teamid, MIN(w) AS min_wincount
FROM teams
WHERE WSWin = 'Y' AND yearid BETWEEN 1970 AND 2016
GROUP BY yearid, teamid
ORDER BY min_wincount ASC;

-- determine why this is the case. Then redo your query, excluding the problem year. 

SELECT yearid, teamid, MIN(w) AS min_wincount
FROM teams
WHERE WSWin = 'Y' AND yearid BETWEEN 1970 AND 2016 AND yearid <> 1981
GROUP BY yearid, teamid
ORDER BY min_wincount ASC;

-- How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? What percentage of the 
-- time?

-- WS wins:

SELECT name, teamid, yearid, wswin, MAX(w) AS max_win
FROM teams as t
WHERE yearid BETWEEN 1970 AND 2016 AND yearid <> 1981 AND wswin = 'Y'
GROUP BY t.name, t.teamid, t.yearid, t.wswin
ORDER BY max_win DESC;

SELECT COUNT(*) AS total_wins, ROUND((count(*)::decimal/(2016-1970)*100),0) AS percent_win
FROM teams AS t
WHERE t.w IN (SELECT MAX(w) AS win
				 FROM teams as t2
				 WHERE t2.yearid = t.yearid)AND t.yearid BETWEEN 1970 AND 2016 AND yearid <> 1981 AND wswin = 'Y';
				 
				 
				 
				 
				 