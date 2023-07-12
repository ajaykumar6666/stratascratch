# Write your MySQL query statement below
 WITH lead_table AS(
     SELECT player_id,
         LEAD(event_date, 1) OVER(PARTITION BY player_id ORDER BY event_date) AS next_day,
         MIN(event_date) OVER(PARTITION BY player_id) AS first_login
     FROM Activity)

select round(count(distinct player_id)/(select count(distinct player_id) from Activity),2) fraction
from lead_table WHERE DATEDIFF(next_day, first_login) = 1;
