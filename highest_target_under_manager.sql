select first_name,target from(
select first_name,target,
rank() over(order by target desc) "rank"
from salesforce_employees where manager_id=13) a
where rank=1;