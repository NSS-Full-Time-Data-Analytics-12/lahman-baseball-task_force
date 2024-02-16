-- 13. It is thought that since left-handed pitchers are more rare, causing batters to face them less often, that they are more effective. Investigate this claim and present evidence to either support or dispute this claim. First, determine just how rare left-handed pitchers are compared with right-handed pitchers. Are left-handed pitchers more likely to win the Cy Young Award? Are they more likely to make it into the hall of fame?

SELECT *
FROM people;
SELECT *
FROM awardsshareplayers;

-- determine just how rare left-handed pitchers are compared with right-handed pitchers. 
SELECT (SELECT COUNT(throws)
               FROM people
               WHERE throws= 'L'
               GROUP BY throws)::numeric/COUNT(throws)::numeric * 100
FROM people
WHERE throws = 'R';
-- Are left-handed pitchers more likely to win the Cy Young Award?                 

WITH left_hand_cy AS (SELECT playerid
FROM people
WHERE throws= 'L'
INTERSECT
SELECT playerid
FROM awardsshareplayers
WHERE awardid = 'Cy Young')

SELECT  COUNT(playerid)
FROM left_hand_cy INNER JOIN awardsshareplayers AS ASP USING(playerid)
GROUP BY playerid

SELECT COUNT(awardid)
FROM awardsshareplayers
WHERE awardid = 'Cy Young'
