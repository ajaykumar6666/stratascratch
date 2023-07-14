# Write your MySQL query statement below
with cte as (
select delivery_id from( 
select delivery_id, rank() over(partition by customer_id order by order_date) rnk
from Delivery) a
where rnk=1)

select round((count(*)/(select count(*) from cte))*100,2) immediate_percentage from Delivery where delivery_id in (select delivery_id from cte) and
order_date=customer_pref_delivery_date

