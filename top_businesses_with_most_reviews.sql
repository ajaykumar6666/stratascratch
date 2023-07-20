select name, sum(review_count) review_count
from yelp_business
group by name
order by sum(review_count) desc limit 5;
