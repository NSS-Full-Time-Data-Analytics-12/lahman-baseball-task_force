-- 1. What range of years for baseball games played does the provided database cover? 

SELECT MAX(yearid), MIN(yearid)
FROM appearances FULL JOIN collegeplaying USING(yearid);



