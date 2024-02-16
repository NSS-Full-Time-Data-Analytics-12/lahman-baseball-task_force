
--4. Using the fielding table, group players into three groups
--based on their position: label players with
--position OF as "Outfield", those with
--position "SS","1B", "2B", and "3B" as "Infield", and those with
--position "P" or "C" as "Battery".
--Determine the number of putouts made by each of these three groups in 2016.


with putouts as
(select *,
case when pos in ('OF') then 'outfield' 
     when pos in('SS','1B','2B','3B') then 'Infield'
	 when pos in('P','C')then 'Battery'end as player_label
	 from fielding)

select 
sum(po),player_label from putouts
where yearid=2016
group by player_label

;


