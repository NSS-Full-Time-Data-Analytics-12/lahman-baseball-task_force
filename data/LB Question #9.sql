---9. Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? 
---Give their full name and the teams that they were managing when they won the award.

SELECT *
FROM awardsmanagers;

SELECT DISTINCT playerid, namefirst, namelast, COUNT(awardid)
FROM awardsmanagers INNER JOIN people USING (playerid)
WHERE awardid = 'TSN Manager of the Year'
GROUP BY playerid, namefirst, namelast
ORDER BY COUNT(awardid) DESC;

SELECT playerid, COUNT(awardid)
FROM awardsmanagers
GROUP BY playerid
ORDER BY COUNT(awardid) DESC

