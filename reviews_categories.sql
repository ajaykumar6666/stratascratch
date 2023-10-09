WITH cte AS
  (SELECT unnest(string_to_array(categories, ';')) AS category,
          review_count
   FROM yelp_business)
   
   
select category, sum(review_count) from cte
group by category
order by sum(review_count) desc