# Write your MySQL query statement below
with cte as(
select
year,
case when month <10 then concat('0',month) else month end month,
country,
trans_count,
approved_count,
trans_total_amount,
approved_total_amount
from(
select extract(year from trans_date) as year,
extract(month from trans_date) month,
country,
count(*) trans_count,
count(case when state='approved' then 1 end) approved_count,
sum(amount) trans_total_amount,
sum(case when state='approved' then amount end) approved_total_amount
from 
Transactions
group by year,month,country)a)


select concat(concat(year,'-'),month) month,country,
trans_count,approved_count,trans_total_amount,
case when approved_total_amount is null then 0 else approved_total_amount end
approved_total_amount
from cte;
