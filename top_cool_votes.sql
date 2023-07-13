with cte as (select business_name from(
select business_name,
sum(cool),
rank() over(order by sum(cool) desc) rnk
from yelp_reviews
group by business_name
order by sum(cool) desc)a
where rnk=1)

select business_name,review_text from yelp_reviews where business_name in
(select business_name from cte)
