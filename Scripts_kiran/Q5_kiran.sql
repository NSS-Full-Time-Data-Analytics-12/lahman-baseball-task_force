-- 5. Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. 
-- Do the same for home runs per game. Do you see any trends?

-- for Strikeouts:

SELECT ROUND(SUM(so)::numeric /sum(g)::numeric, 2) as avg_so,
	CASE WHEN yearid BETWEEN 1920 and 1929 THEN '20s'
		WHEN yearid BETWEEN 1930 and 1939 THEN '30s' 
		WHEN yearid BETWEEN 1940 and 1949 THEN '40s'
		WHEN yearid BETWEEN 1950 and 1959 THEN '50s'
		WHEN yearid BETWEEN 1960 and 1969 THEN '60s'
		WHEN yearid BETWEEN 1970 and 1979 THEN '70s'
		WHEN yearid BETWEEN 1980 and 1989 THEN '80s'
		WHEN yearid BETWEEN 1990 and 1999 THEN '90s'
		WHEN yearid BETWEEN 2000 and 2009 THEN '2000s'
		WHEN yearid BETWEEN 2010 and 2016 THEN '2010s' END AS decade
		
FROM teams
WHERE yearid > 1920
GROUP BY decade 
ORDER BY decade DESC;

-- for homeruns

SELECT ROUND(SUM(hr)::numeric /sum(g)::numeric, 2) as avg_hr,
	CASE WHEN yearid BETWEEN 1920 and 1929 THEN '20s'
		WHEN yearid BETWEEN 1930 and 1939 THEN '30s' 
		WHEN yearid BETWEEN 1940 and 1949 THEN '40s'
		WHEN yearid BETWEEN 1950 and 1959 THEN '50s'
		WHEN yearid BETWEEN 1960 and 1969 THEN '60s'
		WHEN yearid BETWEEN 1970 and 1979 THEN '70s'
		WHEN yearid BETWEEN 1980 and 1989 THEN '80s'
		WHEN yearid BETWEEN 1990 and 1999 THEN '90s'
		WHEN yearid BETWEEN 2000 and 2009 THEN '2000s'
		WHEN yearid BETWEEN 2010 and 2016 THEN '2010s' END AS decade
		
FROM teams
WHERE yearid > 1920
GROUP BY decade 
ORDER BY decade DESC;



	
