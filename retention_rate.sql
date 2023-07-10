with cte as (
select *
from(
select account_id,
count(case when year_month='2020-12' then user_id end) as december,
count(case when year_month='2021-1' then user_id end) as  january,
count(case when year_month='2021-2' then user_id end) as february
from(
select account_id,user_id,
concat(concat(extract(YEAR from date),'-'),extract(MONTH from date)) year_month from
sf_events) a
group by account_id
order by account_id) bb)

select account_id,january_retent/december_retent retention from(
select account_id,january/december december_retent,
february/january january_retent
from(
select account_id,
case when december>0 then 1 else 0 end december,
case when january>0 then 1 else 0 end january,
case when february>0 then 1 else 0 end february
from cte) ab) ll;

