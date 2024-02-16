/*
12. In this question, you will explore the connection between number of wins and attendance.
    <ol type="a">
      <li>Does there appear to be any correlation between attendance at home games and number of wins? </li>
      <li>Do teams that win the world series see a boost in attendance the following year?
	  What about teams that made the playoffs?
	  Making the playoffs means either being a division winner or a wild card winner.</li>
    </ol>*/
	
	
	
	
	select * from homegames;
	select * from teams;
	
	
	select h.attendance,teamid,
	--t.name,
	t.w,t.yearid from homegames as h
	join teams as t on h.team=t.teamid
	group by t.teamid,t.yearid;
	
	
	
	select team, year,games,attendance from homegames;
	
	
	
	
	select  teamid,yearid, w,attendance,ghome from teams
		where ghome is not null
		group by teamid,yearid, w,attendance,ghome
			order by yearid;
			
			
			select 

with abc as
(select playerid,hr,max(hr) from batting
--where yearid=2016
group by playerid,yearid,hr
order by max(hr) desc) 

select hr,
playerid from batting
group by playerid,hr
having count(yearid)>10
order by hr desc;








select distinct playerid from batting;
