-- Q10 Find all players who hit their career highest number of home runs in 2016. Consider only players who 
-- have played in the league for at least 10 years, and who hit at least one home run in 2016. 
-- Report the players' first and last names and the number of home runs they hit in 2016.

SELECT * FROM pitching;
SELECT * FROM teams;
SELECT * FROM people;
SELECT * FROM batting WHERE playerid = 'aybarer01'
AND YEARID = 2016

--select playerid, count(*)
--from (
with cte as 
(
		select playerid, yearid, sum(hr) yearlyhr
		from   batting a
		where 
				exists ( -- Players who played in 2016 and had atleast 1 homerun
					select b.playerid
					from   batting b
					where  b.playerid = a.playerid
					and    b.yearid = 2016
					--and    b.yearid = a.yearid
					and    b.hr > 0
				)
		and 
				exists ( -- Players who have played atleast 10 years
					select c.playerid
					from   batting c
					where  c.playerid = a.playerid
					group by c.playerid
					having COUNT(DISTINCT c.yearid) >= 10
				)
		--and a.yearid = 2016
		group by playerid, yearid
)
	select --cte2016.playerid, 
	       --cte2016.yearid, 
		   people.namefirst "First Name", 
		   people.namelast "Last Name",
		   cte2016.yearlyhr "HR in 2016"
	from cte as cte2016
		inner join people USING(playerid)
			--on people.playerid = cte2016.playerid
	where cte2016.yearid = 2016
	and not exists ( -- There are no records for other years with a yearly home run count 
		             -- equal to or higher than the yearly home run count in 2016
						select 1
						from   cte ctenot2016
						where  ctenot2016.yearid <> 2016
						and    ctenot2016.playerid = cte2016.playerid
						and    cte2016.yearlyhr <= ctenot2016.yearlyhr
				   )
-- 		inner join (select playerid, max(yearlyhr) yearlyhr 
-- 					from cte 
-- 					where yearid <> 2016 
-- 					group by playerid) as ctenot2016
-- 					    on ctenot2016.playerid = cte2016.playerid
-- 						and cte2016.yearlyhr > ctenot2016.yearlyhr
-- -- 		inner join cte as ctenot2016
-- -- 			on     ctenot2016.playerid = cte2016.playerid
-- -- 			   and ctenot2016.yearid <> 2016 and cte016.yearid = 2016
-- -- 			   and cte2016.yearlyhr > ctenot2016.yearlyhr
 	where cte2016.playerid = 'canoro01'


order by playerid, yearid
--) group by playerid

-- Using window function
/*
select row_number over (partition by ) 
*
from batting
with cte as (

	select playerid,
	       yearid,
	       sum(hr) yearlyhr,
	       AVG(hr),
	       count(*)
	from batting
	group by playerid, yearid
)
	select *
	from (
		select row_number() over (partition by playerid order by yearlyhr desc, yearid desc) rownum,
			   *
		from cte
	) as outertable
	where playerid = 'canoro01'
	where outertable.rownum = 1
	order by playerid*/

















SELECT *
FROM   (
			SELECT COUNT(DISTINCT yearid) NumberYrsPlayed,
				   playerid
			FROM batting
			GROUP BY playerid
			HAVING count(DISTINCT yearid) >= 10
		) AS NBR_YRS
			INNER JOIN (
						SELECT yearid,
							   playerid,
							   SUM(hr) yr_hr
						FROM batting
						WHERE yearid = 2016
						AND   hr > 0
						GROUP BY playerid, yearid
			) AS YR_2016 
				ON YR_2016.playerid = NBR_YRS.playerid
			INNER JOIN (
						SELECT playerid,
						       yearid,
							   MAX(hr) maxhrplayerid
						FROM batting
						--WHERE yearid <> 2016
						GROUP BY playerid, yearid
			) AS MAX_HR 
				ON  MAX_HR.playerid = YR_2016.playerid
				AND MAX_HR.maxhrplayerid < YR_2016.yr_hr
order by YR_2016.playerid 



-- finding players have played in leagues for at least 10 years; there highest hr in 2016

WITH abv_ten AS 
(
	SELECT playerid, COUNT(DISTINCT yearid) AS tot_leagues_played
	FROM batting
	GROUP BY playerid
	HAVING COUNT(DISTINCT yearid) >=10
)

SELECT playerid, namefirst, namelast, MAX(hr)AS highest_hr_2016
FROM batting INNER JOIN abv_ten USING(playerid)
	INNER JOIN people USING(playerid)
WHERE yearid = 2016 
GROUP BY playerid, namefirst, namelast

SELECT playerid, hr as hr_2016
from batting as year2016
WHERE yearid = 2016 AND hr > 0 
GROUP BY playerid, hr
-- HAVING MAX(hr)>15




