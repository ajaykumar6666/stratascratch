with cte as (
select tiv_2015 from(
select tiv_2015, sum(tiv_2016),count(pid)
from Insurance group by tiv_2015
having count(pid)>1)a)


select round(sum(tiv_2016),2) tiv_2016 from Insurance
where tiv_2015 in (select tiv_2015 from cte)
and (lat,lon) not in (select lat,lon from(
select lat,lon, count(lat) from Insurance
group by lat,lon
having count(lat)>1) b)
