-- 9.-- Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)?
-- -Give their full name and the teams that they were managing when they won the award


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
ORDER BY am.playerid