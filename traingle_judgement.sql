# Write your MySQL query statement below

select x,y,z,
case when z<(x+y) and x<(y+z) and y<(x+z)  then "Yes"  
else "No"
end "triangle"
from Triangle;