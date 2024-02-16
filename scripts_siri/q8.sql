/*8. Using the attendance figures from the homegames table, 
find the teams and parks which had the top 5 average attendance per game in 2016 
(where average attendance is defined as total attendance divided by number of games).
Only consider parks where there were at least 10 games played.
Report the park name, team name, and average attendance.
Repeat for the lowest 5 average attendance.*/


select * from homegames;
select * from teams;


select t.name,t.park ,(attendance/games) as avg_attendance  from homegames as h
join teams as t using(attendance)
				 where year=2016 and games>10
				 order by avg_attendance desc
limit 5;



select t.name,t.park ,(attendance/games) as avg_attendance  from homegames as h
join teams as t using(attendance)
				 where year=2016 and games>10
				 order by avg_attendance 
limit 5;
