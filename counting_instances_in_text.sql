select word,nentry from(
select 'bear' word,
count(case when contents ilike '%bear%' then filename end) nentry
from google_file_store
union
select 'bull' word,
count(case when contents ilike '%bull%' then filename end) nentry
from google_file_store) a
order by nentry desc;


