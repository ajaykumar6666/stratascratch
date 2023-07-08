
select
id from
(
select *, lag(temperature, 1) over (order by recordDate) as Previous_temp,
lag(recordDate, 1) over (order by recordDate) as Previous_date
from Weather) a
where a.temperature > a.Previous_temp
and datediff(a.recordDate,a.Previous_date) = 1

## be mindful that the dates are not continuous which is the reason for having a lag for date as well