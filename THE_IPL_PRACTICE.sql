SELECT * FROM campus_x.the_ipl;
-- 1 find the top 5 batsmen in IPL
SELECT batter , sum(batsman_run) FROM the_ipl
GROUP BY batter
ORDER BY sum(batsman_run) DESC LIMIT 5;
-- 2 find the 2nd highest 6 hitter in ipl
SELECT batter,count(*) AS 'num_sixes'  FROM the_ipl
WHERE batsman_run=6
GROUP BY batter
ORDER BY num_sixes DESC LIMIT 1,1;
-- 3 find virat kohli's performance against all ipl teama
-- what we will do this select only where batter =virat
SELECT *
FROM the_ipl
WHERE batter='V Kohli';
-- this data set doesnot contain the balling team that's why we cant solve this questions

-- 4 find the top 10 batsman with centuries in ipl
SELECT batter , FLOOR(SUM(batsman_run)/100)
FROM the_ipl
GROUP BY batter 
HAVING sum(batsman_run) >=100
ORDER BY SUM(batsman_run)/100 DESC LIMIT 10;

-- 5 find the top 5 batsman with highest strike rate who have played a minimum of 1000 balls
SELECT batter,SUM(batsman_run),COUNT(batsman_run),
ROUND((SUM(batsman_run)/COUNT(batsman_run))*100,2) AS 'sr'
FROM the_ipl
GROUP BY batter
HAVING COUNT(batsman_run)>1000
ORDER BY sr DESC LIMIT 5