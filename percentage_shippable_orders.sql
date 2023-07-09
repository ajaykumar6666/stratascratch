select cast(shippable_orders as float)/cast(total_orders as float)*100 "percent_shippable" from(
select count(o.cust_id) "total_orders", 
count(case when c.address is not null then o.cust_id end) "shippable_orders"
from orders o inner join customers c
on o.cust_id=c.id) a;


# if you don't use cast, the return value will be 0