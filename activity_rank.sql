select from_user,count(day) "total_emails",
row_number() over(order by count(day) desc ,from_user asc) "row_number"
from google_gmail_emails
group by from_user
order by count(day) desc