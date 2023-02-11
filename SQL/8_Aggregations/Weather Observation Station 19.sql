/*
P1(a,c) / P2(b,d)
Euclidean Distance = sqrt((b1 - a2)^2 + (d1 - c2)^2)
*/
select round(
                sqrt(
                        power((max(LAT_N)-min(LAT_N)),2) 
                        + 
                        power((max(LONG_W)-min(LONG_W)),2)
                )
            ,4) as test
from station
;