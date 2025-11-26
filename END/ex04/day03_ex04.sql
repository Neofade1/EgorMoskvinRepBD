WITH female_orders AS (
    SELECT DISTINCT m.pizzeria_id
    FROM person_order po
    JOIN person p ON po.person_id = p.id
    JOIN menu m ON po.menu_id = m.id
    WHERE p.gender = 'female'
),
male_orders AS (
    SELECT DISTINCT m.pizzeria_id
    FROM person_order po
    JOIN person p ON po.person_id = p.id
    JOIN menu m ON po.menu_id = m.id
    WHERE p.gender = 'male'
),
female_only AS (
    SELECT pizzeria_id 
    FROM female_orders
    EXCEPT
    SELECT pizzeria_id
    FROM male_orders
),
male_only AS (
    SELECT pizzeria_id
    FROM male_orders
    EXCEPT
    SELECT pizzeria_id
    FROM female_orders
)
SELECT pz.name AS pizzeria_name
FROM female_only
JOIN pizzeria pz ON female_only.pizzeria_id = pz.id
UNION
SELECT pz.name AS pizzeria_name
FROM male_only
JOIN pizzeria pz ON male_only.pizzeria_id = pz.id
ORDER BY pizzeria_name;