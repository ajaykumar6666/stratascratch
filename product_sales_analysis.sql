# Write your MySQL query statement below

select product_id,year first_year,quantity,price from(
select sale_id,product_id,year,quantity,price,
rank() over(partition by product_id order by year asc) rnkk
from Sales)a
where rnkk=1
