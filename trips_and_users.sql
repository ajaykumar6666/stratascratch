

select 
t.request_at Day, 
round(sum(case when t.status = 'completed' then 0 else 1 end) / count(*), 2) Cancellation Rate
from Trips t
inner join Users u 
on t.client_id= u.users_id
where t.request_at between '2013-10-01' and '2013-10-03'
and t.client_id in (select users_id from Users where banned='No')
and t.driver_id  in (select users_id from Users where banned='No')
group by t.request_at






