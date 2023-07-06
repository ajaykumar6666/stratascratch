select * from(
select user_id,
count(case when session_type='streamer' then user_id end)
"number_of_streaming_sessions",
count(case when session_type='viewer' then user_id end) "number_of_viewing_sessions"
from twitch_sessions
group by user_id) a
where a.number_of_streaming_sessions>a.number_of_viewing_sessions;