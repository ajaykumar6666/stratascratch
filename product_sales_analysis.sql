# Write your MySQL query statement below

select product_name,year,price from(
select s.sale_id, p.product_name,s.year,s.price from Product p
join Sales s on p.product_id = s.product_id
group by s.sale_id)a
