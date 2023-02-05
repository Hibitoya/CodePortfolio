/*
Query the average population of all cities in CITY where District is California.

Input Format

The CITY table is described as follows:
*/
select avg(population)
from city
where 'California' = District
;