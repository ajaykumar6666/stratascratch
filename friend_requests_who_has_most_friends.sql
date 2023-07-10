# Write your MySQL query statement below
select id,num from(
select id, sum(counts) num,
rank() over(order by sum(counts) desc) ranks from(
select requester_id id, count(accepter_id) counts
from RequestAccepted
group by requester_id
union all
select accepter_id id , count(requester_id) counts
from RequestAccepted
group by accepter_id) a
group by id) b
where ranks=1
