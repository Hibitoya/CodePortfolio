/*
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. 
Truncate your answer to 4 decimal places.

Input Format

The STATION table is described as follows:

Station.jpg

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
select round(sum(LAT_N),4) as lat 
from STATION 
WHERE LAT_N BETWEEN 38.7880 AND 137.2345
;