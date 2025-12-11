select distinct p.name
from person p
join person_order po on p.id = po.person_id
join menu m on po.menu_id = m.id
where p.gender = 'male'and p.address in ('moscow', 'samara')and m.pizza_name in ('pepperoni pizza', 'mushroom pizza')
order by p.name desc; 