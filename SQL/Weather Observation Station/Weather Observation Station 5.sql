/*
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
The STATION table is described as follows:

Station.jpg

where LAT_N is the northern latitude and LONG_W is the western longitude.

Sample Input

For example, CITY has four entries: DEF, ABC, PQRS and WXY.

Sample Output

ABC 3
PQRS 4
Explanation

When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths  and . The longest name is PQRS, but there are  options for shortest named city. Choose ABC, because it comes first alphabetically.

Note
You can write two separate queries to get the desired output. It need not be a single query.
*/

select city, len from (
select 
city,
length(city) as len,
ROW_NUMBER() OVER(PARTITION BY length(city) ORDER BY city ASC) as rnk
from station
where 
length(city) = (select min(length(city)) from station)
)
where rnk = 1
UNION ALL
select city, len from (
select 
city,
length(city) as len,
ROW_NUMBER() OVER(PARTITION BY length(city) ORDER BY city ASC) as rnk
from station
where 
length(city) = (select max(length(city)) from station)
)
where rnk = 1
Order by len
;
