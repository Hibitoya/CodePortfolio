/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

Input Format

The OCCUPATIONS table is described as follows:



Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

Sample Input



Sample Output

Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria
Explanation

The first column is an alphabetically ordered list of Doctor names.
The second column is an alphabetically ordered list of Professor names.
The third column is an alphabetically ordered list of Singer names.
The fourth column is an alphabetically ordered list of Actor names.
The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with NULL values.
*/

--Oracle 11g + only
SELECT Doctor, Professor, Singer, Actor
FROM
(
  SELECT ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name ASC) as rnk,
    name, occupation FROM OCCUPATIONS
)
PIVOT
(
  max(name) FOR occupation IN ('Doctor' as Doctor, 
                               'Professor' as  Professor,
                               'Singer' as Singer, 
                               'Actor' as Actor)
)
order by rnk
;

--Oracle prvious 11g
with order_list AS (
select ROWNUM as r,
ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name ASC) as rnk,
name,
OCCUPATION
from OCCUPATIONS
    order by r
),
the_data AS (
select o.r,
o2.name As Doctor,
o3.name AS Professor,
o4.name as Singer,
o5.name as Actor
from 
order_list o 
left join order_list o2 on o.r=o2.rnk AND o2.OCCUPATION = 'Doctor'
left join order_list o3 on o.r=o3.rnk AND o3.OCCUPATION = 'Professor'
left join order_list o4 on o.r=o4.rnk AND o4.OCCUPATION = 'Singer'
left join order_list o5 on o.r=o5.rnk AND o5.OCCUPATION = 'Actor'
order by r
)
select Doctor, Professor, Singer, Actor
from the_data
where Doctor is not null 
OR Professor is not null 
OR Singer is not null 
OR Actor is not null
;