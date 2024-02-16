-- Q6 Find the player who had the most success stealing bases in 2016, where __success__ is measured as the 
-- percentage of stolen base attempts which are successful. (A stolen base attempt results either in a 
-- stolen base or being caught stealing.) Consider only players who attempted _at least_ 20 stolen bases.

SELECT playerid, namegiven, sb, cs, (sb+cs) AS steal_attempts, 
		ROUND(((sb::numeric/(sb+cs)::numeric)*100),2) AS success
FROM batting INNER JOIN people USING(playerid)
WHERE yearid = 2016 AND (sb + cs) >= 20
ORDER BY success DESC;