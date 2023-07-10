select salary from(
select salary,
rank() over(order by salary desc) second_highest
from employee)a 
where second_highest=2;
