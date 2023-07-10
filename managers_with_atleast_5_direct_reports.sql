# Write your MySQL query statement below
select name from(
select e1.name name,count(e2.name)  from Employee e1
join Employee e2
on e1.id=e2.managerId
group by e1.name
having count(e2.name)>=5
)a;
