# Write your MySQL query statement below
select customer_number from(
select customer_number,
rank() over(order by count(customer_number) desc) rnk
from Orders
group by customer_number having count(customer_number)>1)a
where rnk=1;
