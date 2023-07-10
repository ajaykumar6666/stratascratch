with cte as(
select worker_ref_id,sum(bonus) total_bonus
from sf_bonus
group by worker_ref_id)

select se.employee_title,se.sex, avg(se.salary+cte1.total_bonus) total_compensation
from sf_employee se
join cte  cte1 on
cte1.worker_ref_id = se.id
group by se.employee_title,se.sex

