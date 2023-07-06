select * from (
select ff.date,
sum(case when dd.paying_customer='yes' then ff.downloads end) "preemium",
sum(case when dd.paying_customer='no' then ff.downloads end)"freemium"
from ms_user_dimension d
join ms_acc_dimension dd
on d.acc_id=dd.acc_id
join ms_download_facts ff
on d.user_id=ff.user_id
group by ff.date) a
where a.freemium>a.preemium
order by a.date;


