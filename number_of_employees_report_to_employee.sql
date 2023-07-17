# Write your MySQL query statement below

select distinct e1.employee_id,e1.name,count(e2.employee_id) reports_count,
round(avg(e2.age)) average_age
from Employees e1, Employees e2
where e1.employee_id = e2.reports_to
group by e1.employee_id
order by e1.employee_id
