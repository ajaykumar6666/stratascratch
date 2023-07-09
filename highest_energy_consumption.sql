
with cte as(
select * from fb_eu_energy
union all
select * from fb_asia_energy
union all
select * from fb_na_energy)

select date,total_energy from(
select date, sum(consumption) "total_energy",
rank() over(order by sum(consumption) desc) "rnk" from cte
group by date) a
where rnk=1
