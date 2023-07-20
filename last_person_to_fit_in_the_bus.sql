# Write your MySQL query statement below
select person_name from (
select person_name,weight, turn,
sum(weight) over(order by turn asc) ordeer 
from Queue)a
where ordeer<=1000
order by ordeer desc
limit 1
