--5. Find the average number of strikeouts per game by decade
--since 1920. Round the numbers you report to 2 decimal places.
--Do the same for home runs per game. Do you see any trends?


select 
  round( (sum(so)::numeric/sum(g)::numeric),2) as avg_so ,
case when yearid between 1920 and 1929 then '20s'
     when yearid between 1930 and 1939 then '30s'
     when yearid between 1940 and 1949 then '40s'
     when yearid between 1950 and 1959 then '50s'
     when yearid between 1960 and 1969 then '60s'
     when yearid between 1970 and 1979 then '70s'
     when yearid between 1980 and 1989 then '80s'
     when yearid between 1990 and 1999 then '90s'
     when yearid between 2000 and 2010 then '2000s'
     when yearid between 2010 and 2020 then '2010s'end as decade
from teams
where yearid>1920
group by decade
order by avg_so;




select 
  round( (sum(hr)::numeric/sum(g)::numeric),2) as avg_hr ,
case when yearid between 1920 and 1929 then '20s'
     when yearid between 1930 and 1939 then '30s'
     when yearid between 1940 and 1949 then '40s'
     when yearid between 1950 and 1959 then '50s'
     when yearid between 1960 and 1969 then '60s'
     when yearid between 1970 and 1979 then '70s'
     when yearid between 1980 and 1989 then '80s'
     when yearid between 1990 and 1999 then '90s'
     when yearid between 2000 and 2010 then '2000s'
     when yearid between 2010 and 2020 then '2010s'end as decade
from teams
where yearid>1920
group by decade
order by avg_hr;
