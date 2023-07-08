
# Write your MySQL query statement below
select d.name as "Department",aa.name as "Employee",
aa.salary as "Salary" from(
select *,dense_rank() over(partition by departmentId order by salary desc) as "rank" from Employee e) aa
join Department d
on aa.departmentId = d.id
where aa.rank<4;