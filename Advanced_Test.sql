
--https://github.com/CuriosityLeonardo/HackerrankCertifications

--1. Crypto Market Algorithms Report Solution

select c.algorithm, 
    sum(case when QUARTER(t.dt) = 1 then t.volume else 0 end) AS Q1, 
    sum(case when QUARTER(t.dt) = 2 then t.volume else 0 end) AS Q2, 
    sum(case when QUARTER(t.dt) = 3 then t.volume else 0 end) AS Q3, 
    sum(case when QUARTER(t.dt) = 4 then t.volume else 0 end) AS Q4
    from transactions t LEFT JOIN coins c ON c.code = t.coin_code 
    where YEAR(t.dt) = 2020
    group by c.algorithm
    order by substr(UPPER(algorithm),1,2) ASC
    ;


--===============================================

--2. Crypto Market Transaction Monitoring 

with difference as (

SELECT
		*,
        DATEDIFF(minute,lag(dt) OVER (ORDER BY sender,dt),dt) as difF_minute,
  		ROW_NUMBER() OVER(ORDER BY sender,dt) as rownumber
FROM    transactions
--ORDER BY sender,dt
  
)
,rn as (
SELECT
		rownumber
FROM    difference
WHERE   rownumber IN(
  SELECT
  		 rownumber
  FROM   transactions
  WHERE  abs(diff_minute) < 60
)
--order by sender,dt
)

,sequences as ( 
SELECT 
		*
FROM    difference
WHERE rownumber IN(
SELECT 
		rownumber 
FROM    rn
UNION
SELECT rownumber - 1 as rownumber
FROM   rn
 )
--order by sender,dt
)
SELECT 
       sender,
       MIN(dt) as Sequence_start,
       MAX(dt) as Sequence_end,
       COUNT(rownumber) as transactions_count,
       SUM(amount) as transactions_sum
FROM   sequences
GROUP BY sender
HAVING SUM(amount) >= 150
order by sender,MIN(dt),MAX(dt)
Footer