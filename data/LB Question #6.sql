SELECT *
FROM teams 
WHERE yearid = 2016;

SELECT playerid, namefirst, namelast, sb,cs, sb+cs AS attempts, ROUND((sb::numeric/(sb+cs)::numeric), 4)*100 AS percent_of_success
FROM batting LEFT JOIN people USING (playerid)
WHERE yearid = 2016 AND sb > 10
ORDER BY percent_of_success DESC;

--------6 Chris Owings 21 sb, 2 cs for a 91.3%
