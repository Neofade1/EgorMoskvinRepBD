select person.id as "person.id",person.name as "person.name",  person.age, person.gender, person.address,pizzeria.id as "pizzeria.id", pizzeria.name as "pizzeria.name", pizzeria.rating
from person, pizzeria
order by person.id, pizzeria.id; 