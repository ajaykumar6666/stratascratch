with cte as (
select client_id,
avg(case when event_type in ('video call received','video call sent',
'voice call received','voice call sent') then 1 else 0 end) subset
from fact_events
group by client_id)

select * from cte
select client_id
from cte
where subset/(select sum(subset) from cte)>0.50 ;
