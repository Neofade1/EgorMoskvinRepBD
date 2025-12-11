select  m.pizza_name, m.price, pz.name as pizzeria_name
from menu m
join pizzeria pz on m.pizzeria_id = pz.id
where m.id not in (select menu_id from person_order)
order by m.pizza_name, m.price; 