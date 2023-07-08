
# Write your MySQL query statement below

select email "Email" from (
select email, count(email) from Person
group by email having count(email)>1) a ;