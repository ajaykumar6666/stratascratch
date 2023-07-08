
select t1.date,
count(t2.user_id_receiver)/(cast(count(t1.user_id_sender) as decimal)) "percentage_acceptance" from 
(SELECT date, user_id_sender,
                user_id_receiver
   FROM fb_friend_requests
   WHERE action='sent') t1
  left join
(SELECT date, user_id_sender,
                user_id_receiver
   FROM fb_friend_requests
   WHERE action='accepted') t2
 on t1.user_id_sender=t2.user_id_sender and t1.user_id_receiver=t2.user_id_receiver
 group by t1.date


