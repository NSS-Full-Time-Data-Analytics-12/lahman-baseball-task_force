/*
9. Which managers have won the TSN Manager of the Year award in both
the National League (NL) and the American League (AL)? 
Give their full name and the teams that they were managing when they won the award.
*/


select * from managers;
select * from teams;
select * from awardsmanagers;
select * from people;
/*
--playerid for  managers have won the TSN Manager of the Year award in both
--the National League (NL) and the American League (AL)
with tsn_managers as
(select playerid from awardsmanagers
where awardid='TSN Manager of the Year'and lgid='NL'
intersect
select playerid from awardsmanagers
where awardid='TSN Manager of the Year'and lgid='AL')
*/

with tsn_managers as
(select playerid,namegiven from awardsmanagers 
join people using(playerid)
where awardid='TSN Manager of the Year'and lgid='NL'
 intersect
select playerid,namegiven from awardsmanagers 
join people using(playerid)
where awardid='TSN Manager of the Year'and lgid='AL')

select playerid,namegiven,teamid,name from managers 
inner join teams using (teamid)
inner join tsn_managers using(playerid)
group by teamid,playerid,namegiven,name
;



