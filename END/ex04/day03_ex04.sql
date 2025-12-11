with female_orders as (
    select distinct m.pizzeria_id
    from person_order po
    join person p on po.person_id = p.id
    join menu m on po.menu_id = m.id
    where p.gender = 'female'
),
male_orders as (
    select distinct m.pizzeria_id
    from person_order po
    join person p on po.person_id = p.id
    join menu m on po.menu_id = m.id
    where p.gender = 'male'
),
female_only as (
    select pizzeria_id 
    from female_orders
    except
    select pizzeria_id
    from male_orders
),
male_only as (
    select pizzeria_id
    from male_orders
    except
    select pizzeria_id
    from female_orders
)
select pz.name as pizzeria_name
from female_only
join pizzeria pz on female_only.pizzeria_id = pz.id
union
select pz.name as pizzeria_name
from male_only
join pizzeria pz on male_only.pizzeria_id = pz.id
order by pizzeria_name;