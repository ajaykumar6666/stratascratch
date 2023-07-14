# Write your MySQL wquery statement below
with cte as(
select product_id, price from(
select product_id,new_price as price,change_date, rank() over(partition by product_id order by change_date desc) rnk
from Products where change_date <= '2019-08-16')a
where rnk=1)


select distinct p.product_id,
case when cc.price is not null then cc.price else 10 end price
from Products p
left join cte cc
on cc.product_id=p.product_id;
