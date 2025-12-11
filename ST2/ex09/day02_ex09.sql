select p.name
from person p
join person_order po on p.id = po.person_id
join menu m on po.menu_id = m.id
where p.gender = 'female'and m.pizza_name = 'pepperoni pizza'
intersect
select p.name
from person p
join person_order po on p.id = po.person_id
join menu m on po.menu_id = m.id
where p.gender = 'female'and m.pizza_name = 'cheese pizza'
order by name; 