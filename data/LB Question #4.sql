SELECT playerid, yearid, pos, po,
CASE WHEN pos = 'OF' THEN 'Outfield'
			 WHEN pos = 'P' OR pos = 'C' THEN 'Battery'
			 ELSE 'Infield' END AS postion_groups
FROM fielding
WHERE yearid = 2016
ORDER BY pos;



SELECT SUM(po) AS total_po,
		CASE WHEN pos = 'OF' THEN 'Outfield'
			 WHEN pos = 'P' OR pos = 'C' THEN 'Battery'
			 ELSE 'Infield' END AS postion_groups
FROM fielding
WHERE yearid = 2016
GROUP BY postion_groups
ORDER BY total_po DESC;
