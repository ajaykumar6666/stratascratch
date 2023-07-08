select concat(year, '-', case when month < 10 then '0' end, month) "year_month",
round(((this_month -last_month)/last_month)*100,2) "revenue_diff_pct"from (
select extract(year from created_at) "year",
extract(month from created_at) "month",
sum(value) "this_month",
lag(sum(value)) over (partition by 1,2) "last_month"
from sf_transactions
group by year,month
order by year,month) a;

