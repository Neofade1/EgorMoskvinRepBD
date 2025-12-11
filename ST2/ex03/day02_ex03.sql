with days as (select generate_series('2022-01-01', '2022-01-10', interval '1 day')::date as missing_date),visited_dates as (select distinct visit_datefrom person_visits where person_id = 1 or person_id = 2)
select days.missing_date
from days
left join visited_dates on days.missing_date = visited_dates.visit_date
where visited_dates.visit_date is null
order by days.missing_date; 