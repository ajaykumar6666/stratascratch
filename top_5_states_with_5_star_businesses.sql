select state, n_businesses from(
select state,count(business_id) n_businesses,
dense_rank() over(order by count(business_id) desc) rank
from yelp_business
where stars=5
group by state
order by n_businesses desc) a
where rank<5;
