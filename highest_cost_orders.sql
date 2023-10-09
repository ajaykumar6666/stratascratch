select c.first_name,o.order_date,sum(total_order_cost)
from customers c
inner join orders o
on c.id=o.cust_id
where o.order_date>='2019-02-01' and o.order_date<='2019-05-01'
group by c.first_name,o.order_date
order by sum(total_order_cost) desc
limit 1;
