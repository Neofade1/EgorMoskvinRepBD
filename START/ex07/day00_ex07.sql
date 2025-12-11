select id,name,
case when age >= 18 and age <= 28 then 'interval #1' when age > 28 and age < 24 then 'interval #2'  
else 'interval #3'
end as interval_info
from person
order by interval_info;    