select distinct ah.host_id,ag.guest_id from airbnb_hosts ah
join airbnb_guests ag
on ah.nationality=ag.nationality and ah.gender=ag.gender

