select post_date,(cast(spam_posts as float)/cast(total_posts as float))*100  spam_sharefrom(
select p.post_date,
count(case when p.post_keywords ilike '%spam%' then p.post_id end) spam_posts
,count(pv.post_id) total_posts
from facebook_posts p join facebook_post_views pv
on p.post_id = pv.post_id
group by post_date)a ;
