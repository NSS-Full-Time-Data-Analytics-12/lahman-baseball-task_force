select * from teams;
select * from batting;



/*
--6. Find the player who had the most success stealing bases
in 2016, where __success__ is measured as the percentage of stolen
base attempts which are successful. 
(A stolen base attempt results either in a stolen base or
being caught stealing.) 
Consider only players who attempted _at least_ 20 stolen bases.
	*/
	
	
/*In baseball statistics,
stolen bases are denoted by "SB".
Attempts to steal that result in the baserunner being out are caught stealing 
("CS"). The sum of these statistics is steal attempts. Successful steals as 
a percentage of total steal attempts is called the success rate*/



select playerid,namegiven,sb,cs,(sb+cs) as steal_attempts ,
round(((sb::numeric/(sb+cs)::numeric)*100),2) as success
from batting
join people using(playerid)
where yearid=2016 and(sb+cs)>=20 
order by success desc;




select playerid,namegiven,sb,cs,(sb+cs) as steal_attempts ,
((sb/cast (sb+cs as float))*100) as success
from batting
join people using(playerid)
where yearid=2016 and(sb+cs)>=20 
order by success desc;

