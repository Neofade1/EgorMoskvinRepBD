select action_date,(select name from person where id = t.person_id) as person_name
from (select order_date as action_date, person_id from person_order intersect select visit_date, person_id  from person_visits) as t
order by action_date, person_name desc; 