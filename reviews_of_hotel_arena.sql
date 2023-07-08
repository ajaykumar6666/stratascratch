select hotel_name,reviewer_score,count(reviewer_score) "score" from hotel_reviews where hotel_name='Hotel Arena'
group by hotel_name,reviewer_score;