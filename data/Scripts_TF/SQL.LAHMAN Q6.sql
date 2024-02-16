-- 6. Find the player who had the most success stealing bases in 2016, where __success__ is measured as the percentage of stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) Consider only players who attempted _at least_ 20 stolen bases.
	

select playerid,namegiven,sb,cs,(sb+cs) as steal_attempts ,
round(((sb::numeric/(sb+cs)::numeric)*100),2) as success
from batting
join people using(playerid)
where yearid=2016 and(sb+cs)>=20
order by success desc;