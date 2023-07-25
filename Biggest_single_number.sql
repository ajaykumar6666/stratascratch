# Write your MySQL query statement below
select 
case when num is not null then num else null end num
from(
select  num,count(num) from MyNumbers
group by num
having count(num)=1
order by num desc limit 1)a;
