select name,rating 
from pizzeria 
where  rating <= 5 and rating >= 3.5
order by rating;

select name,rating
FROM pizzeria
WHERE rating BETWEEN 3.5 AND 5
order by rating; 