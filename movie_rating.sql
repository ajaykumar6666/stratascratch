# Write your MySQL query statement below
select name results from(
select u.name,count(movie_id),
rank() over(order by count(movie_id) desc , u.name asc) rnk
from Users u join MovieRating mr
on u.user_id= mr.user_id
group by u.name)a
where rnk=1
union all
select title results from(
select title,
rank() over(order by average desc, title asc) rnk
from(
select m.title,
EXTRACT(YEAR from mr.created_at) year,
EXTRACT(MONTH from mr.created_at) month,
avg(mr.rating) average
from Movies m
join MovieRating mr on
m.movie_id=mr.movie_id
group by m.title,
EXTRACT(YEAR from mr.created_at),
EXTRACT(MONTH from mr.created_at))c
where year=2020 and month=2)d
where rnk=1
