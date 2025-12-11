-- 1 вариант с IN
select name
from pizzeria
where id not in (select pizzeria_id from person_visits);

-- 2 вариант с EXISTS
select name
from pizzeria
where not exists (
    select 1 
    from person_visits 
    where person_visits.pizzeria_id = pizzeria.id
);  