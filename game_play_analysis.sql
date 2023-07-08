
select player_id,event_date as "first_login" from
(select player_id,
event_date,rank() over(partition by player_id order by event_date) "ranks"
from Activity ) a
where a.ranks=1;