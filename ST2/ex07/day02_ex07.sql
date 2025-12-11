select distinct pz.name
from person_visits pv
join person p on pv.person_id = p.id
join pizzeria pz on pv.pizzeria_id = pz.id
join menu m on m.pizzeria_id = pz.id
where p.name = 'dmitriy' 
  and pv.visit_date = '2022-01-08'
  and m.price < 800; 