select  m.pizza_name, pz.name as pizzeria_name,  m.price
from menu m
join pizzeria pz on m.pizzeria_id = pz.id
where m.pizza_name in ('mushroom pizza', 'pepperoni pizza')
order by m.pizza_name, pz.name; 