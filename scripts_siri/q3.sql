
--3. Find all players in the database who played at
--Vanderbilt University. 
--Create a list showing each player’s first and last names
--as well as the total salary they earned in the major leagues.
--Sort this list in descending order by the total salary earned.
--Which Vanderbilt player earned the most money in the majors?



select namefirst, namelast,
sum(salary)::numeric::money as total_salary
from people
inner join salaries using(playerid)
where playerid in (select playerid
		from collegeplaying where schoolid='vandy')
	group by namefirst,namelast
order by total_salary desc;	
