select m.pizza_name, pz.name as pizzeria_name
from person_order po
join person p on po.person_id = p.id
join menu m on po.menu_id = m.id
join pizzeria pz on m.pizzeria_id = pz.id
where p.name in ('denis', 'anna')
order by m.pizza_name, pz.name; 