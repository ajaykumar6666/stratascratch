select user_id, count(session_id) "number of sessions" from twitch_sessions
where session_type='streamer' and user_id in (select user_id from twitch_sessions where session_start in(select min(session_start) from twitch_sessions
group by user_id) and session_type='viewer')
group by user_id
order by 2 DESC,1 ASC;