select a.company_name,(count_20-count_19) "net_products" from (
select company_name,
count(case when year=2019 then product_name end) "count_19",
count(case when year=2020 then product_name end) "count_20"
from car_launches
group by company_name) a;