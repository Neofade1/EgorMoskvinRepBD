select piz.name,piz.rating
from pizzeria piz
left join person_visits pv on piz.id = pv.pizzeria_id
where pv.pizzeria_id is null; 