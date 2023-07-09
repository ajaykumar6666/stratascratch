select cast(active_count as float)/cast(total_count as float) "active_users_share"
from(
select country,count(user_id) "total_count",
count(case when status='open' then user_id end) "active_count"
from fb_active_users
where country='USA'
group by country
order by active_count desc) a;