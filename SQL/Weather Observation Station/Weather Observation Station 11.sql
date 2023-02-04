/*
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
Your result cannot contain duplicates.

Input Format

The STATION table is described as follows:

Station.jpg

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

--Oracle
select city
from station
where 
NOT regexp_like(UPPER(city), '^(A|E|I|O|U)')
OR NOT regexp_like(UPPER(city), '(A|E|I|O|U)$')
group by city
order by city
;