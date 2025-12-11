select distinct pz.name as pizzeria_name
from person_visits pv
join person p on pv.person_id = p.id
join pizzeria pz on pv.pizzeria_id = pz.id
where p.name = 'andrey'
  and not exists (
    select 1 
    from person_order po
    join menu m on po.menu_id = m.id
    where po.person_id = p.id 
      and m.pizzeria_id = pz.id
  )
order by pizzeria_name; 