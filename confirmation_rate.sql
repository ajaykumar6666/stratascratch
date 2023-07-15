# Write your MySQL query statement below

select user_id,round(confirmed_requests/total_confirmations,2) confirmation_rate from(
select s.user_id,
count(case when c.action='confirmed' then 1 end) confirmed_requests,
count(*) total_confirmations
from Signups s left join Confirmations c
on s.user_id=c.user_id
group by s.user_id)a;
