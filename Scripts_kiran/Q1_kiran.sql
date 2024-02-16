--Q1) What range of years for baseball games played does the provided database cover? earliest year - 1864;  latest - 2016

SELECT MIN(c.yearid) AS earliest_year, MAX(t.yearid )AS latest_year
FROM collegeplaying AS c FULL JOIN teams AS t USING(yearid)



