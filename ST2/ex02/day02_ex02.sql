SELECT COALESCE(p.name, '-') AS person_name,pv.visit_date, COALESCE(pz.name, '-') AS pizzeria_name
FROM (SELECT person_id, pizzeria_id, visit_date FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') pv
FULL JOIN person p ON pv.person_id = p.id
FULL JOIN pizzeria pz ON pv.pizzeria_id = pz.id
ORDER BY visit_date,CASE WHEN p.name IS NULL THEN 1 ELSE 0 END,person_name,pizzeria_name;