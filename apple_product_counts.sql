select pu.language "language",
count (distinct case when pe.device in ('macbook pro','iphone 5s','ipad air') then 
pu.user_id else null end) "n_apple_users",
count (distinct case when pe.device is not null then pu.user_id else null end) "n_total_users"
from playbook_events pe
join playbook_users pu
on pe.user_id = pu.user_id
group by pu.language
order by n_apple_users desc,n_total_users desc



