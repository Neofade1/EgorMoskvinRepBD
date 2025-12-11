select coalesce(p.name, '-') as person_name,pv.visit_date, coalesce(pz.name, '-') as pizzeria_name
from (select person_id, pizzeria_id, visit_date from person_visits where visit_date between '2022-01-01' and '2022-01-03') pv
full join person p on pv.person_id = p.id
full join pizzeria pz on pv.pizzeria_id = pz.id
order by visit_date,case when p.name is null then 1 else 0 end,person_name,pizzeria_name; 