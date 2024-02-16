
--
--1. What range of years for baseball games played does the provided database cover? 


select min(yearid),max(yearid) from teams;


select max(year) from homegames;

select max(yearid) from pitching;
select max(yearid) from fielding;
select min(yearid),max(yearid) from awardsmanagers;
select min(yearid),max(yearid) from collegeplaying;
select min(yearid),max(yearid) from allstarfull;
select min(yearid),max(yearid) from awardssharemanagers;
select min(yearid),max(yearid) from appearances;
select min(yearid),max(yearid) from awardsplayers;
select min(yearid),max(yearid) from batting;
select min(yearid),max(yearid) from battingpost;
select min(yearid),max(yearid) from fieldingpost;
select min(yearid),max(yearid) from fieldingofsplit;
select min(yearid),max(yearid) from halloffame;--1936,2017
select min(yearid),max(yearid) from managers;--1871,2016
select min(yearid),max(yearid) from managershalf;--1892,1981



select min(yearid),max(yearid) from collegeplaying
full join teams using(yearid);
