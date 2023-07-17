# Write your MySQL query statement below

with total_cte as(
  select distinct visited_on,
  sum(amount) over(
  order by visited_on asc range between interval 6 day preceding and 
  current row) amount
  from Customer
)
SELECT visited_on, amount, ROUND(amount/7, 2) AS average_amount
FROM total_cte AS a
INNER JOIN
(SELECT MIN(visited_on) AS min_visited_on FROM total_cte) AS b
ON DATEDIFF(visited_on, min_visited_on) >= 6;
