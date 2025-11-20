







SELECT person_id
FROM person_order
WHERE order_date = '2022-01-07'
EXCEPT ALL
SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-07';

SELECT  p.id AS person_id, p.name AS person_name, p.age,p.gender, p.address, pz.id AS pizzeria_id, pz.name AS pizzeria_name, pz.rating
FROM person p
CROSS JOIN pizzeria pz
ORDER BY p.id, pz.id;

SELECT po.order_date AS action_date, p.name AS person_name
FROM person_order po
JOIN person p ON po.person_id = p.id
ORDER BY po.order_date ASC, p.name DESC;

SELECT po.order_date,CONCAT(p.name, ' (age:', p.age, ')') AS person_information
FROM person_order po
JOIN person p ON po.person_id = p.id
ORDER BY po.order_date ASC, person_information ASC;

SELECT order_date,CONCAT(name, ' (age:', age, ')') AS person_information
FROM (SELECT id AS person_id, name, age FROM person) AS p
NATURAL JOIN person_order
ORDER BY order_date ASC, person_information ASC;

-- 1 Вариант с IN
SELECT name
FROM pizzeria
WHERE id NOT IN (SELECT pizzeria_id FROM person_visits);

-- 2 Вариант с EXISTS
SELECT name
FROM pizzeria
WHERE NOT EXISTS (
    SELECT 1 
    FROM person_visits 
    WHERE person_visits.pizzeria_id = pizzeria.id
);

SELECT p.name AS person_name, m.pizza_name AS pizza_name, pz.name AS pizzeria_name
FROM person_order po
JOIN person p ON po.person_id = p.id
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY  person_name ASC,  pizza_name ASC, 
pizzeria_name ASC;