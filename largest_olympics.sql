select games,athletes_count from(
select concat(concat(year,' '),season) games,
count(distinct id) athletes_count,
rank() over (order by count(distinct id) desc)
from olympics_athletes_events
group by year,season
order by count(distinct id) desc) a
where rank=1;
