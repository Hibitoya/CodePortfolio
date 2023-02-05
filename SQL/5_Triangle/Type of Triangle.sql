/*
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with 3 sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
Input Format

The TRIANGLES table is described as follows:



Each row in the table denotes the lengths of each of a triangle's three sides.

Sample Output

Isosceles
Equilateral
Scalene
Not A Triangle

*/
select
case 
when ( A=B and B=C ) then 'Equilateral'
when ( (A+B) <= C OR (A+C) <= B OR (B+C) <= A ) then 'Not A Triangle'
when ( (A<>B AND B<>C AND A<>C) ) then 'Scalene'
when ( A IS NULL OR B IS NULL OR C IS NULL ) then NULL
else 'Isosceles'
end as triangle_type
from TRIANGLES
;