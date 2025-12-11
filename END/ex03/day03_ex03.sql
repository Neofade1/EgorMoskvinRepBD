select pz.name as pizzeria_name
from person_visits pv
join person p on pv.person_id = p.id
join pizzeria pz on pv.pizzeria_id = pz.id
group by pz.name
having count(*) filter (where p.gender = 'male') != count(*) filter (where p.gender = 'female')
order by pizzeria_name; 