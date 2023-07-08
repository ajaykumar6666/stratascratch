
select dense_rank() over(order by sum_n_messages desc),* 
from(
select id_guest,sum(n_messages) "sum_n_messages" from airbnb_contacts
group by id_guest) a;


## dense_rank is useful if you don't want to skip the rows