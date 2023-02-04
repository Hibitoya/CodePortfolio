/*
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
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
regexp_like(city, '^(A|E|I|O|U)')
group by city
;