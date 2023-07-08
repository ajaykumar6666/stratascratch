# Write your MySQL query statement below
select distinct num "ConsecutiveNums" from
(select num,
    lead(num,1) over(order by id) "next",
    lag(num,1) over(order by id) "next_next"
    from Logs) a where num=next and next =next_next and num=next_next;