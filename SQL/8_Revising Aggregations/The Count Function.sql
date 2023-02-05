/*
Query a count of the number of cities in CITY having a Population larger than .

Input Format

The CITY table is described as follows:
*/
select count(name)
from city
where Population > 100000
;