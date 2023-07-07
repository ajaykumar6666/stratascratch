select a.user_id,avg(b.exit_time-a.load_time) from
(select user_id,date(timestamp) "date" ,max(timestamp) "load_time"
from facebook_web_log
where action = 'page_load'
group by user_id,date
) as a,
(select user_id,date(timestamp) ,min(timestamp) "exit_time"
from facebook_web_log
where action ='page_exit'
group by user_id,date) as b
where a.user_id=b.user_id and a.date=b.date 
group by a.user_id