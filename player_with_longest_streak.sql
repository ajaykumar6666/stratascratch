
with cte as (
select * , (row_number1-row_number2) "streak" from (
select player_id,
match_date,
match_result,
row_number() over(partition by player_id order by match_date) "row_number1",
row_number() over(partition by player_id,match_result order by match_date) "row_number2"
from players_results
order by player_id,match_date) a)

select player_id, streak_count from(
select player_id,streak, count(*) "streak_count",
rank() over(order by count(*) desc) "rnk"
from cte
where match_result='W'
group by player_id,streak
order by player_id asc, streak desc) a
where rnk=1

