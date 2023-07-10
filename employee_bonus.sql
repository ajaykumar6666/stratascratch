# Write your MySQL query statement below

select name, 
bonus from(
select e.name name,
case when b.bonus is not null then bonus else null end bonus 
from Employee e
left join Bonus b
on e.empId = b.empId)a
where bonus is null or bonus<1000;
