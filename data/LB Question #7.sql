------needs work
WITH wins AS (SELECT yearid, MAX(w) AS max_w
				FROM teams 
				WHERE yearid > 1969
				GROUP BY yearid)
SELECT yearid, max_w, name
FROM teams INNER JOIN wins USING (yearid)
WHERE yearid > 1969;


SELECT teamid, yearid, MAX(w) AS max_w, wswin
FROM teams
WHERE yearid >1969
GROUP BY yearid, teamid, wswin
ORDER BY yearid, max_w DESC;


----WS wins by year.
SELECT name, teamid, yearid, wswin, w
FROM teams
WHERE yearid > 1969 AND wswin = 'Y';

----needs work
SELECT t2.name, t2.teamid, t2.wswin, t1.yearid, MAX(t1.w) AS max_w 
FROM teams AS t1 INNER JOIN teams AS t2 ON t1.yearid = t2.yearid
WHERE t1.yearid >1969 AND t2.wswin = 'Y'
GROUP BY t2.name, t2.teamid, t1.yearid, t2.wswin
ORDER BY yearid;