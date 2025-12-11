select missing_date::date from generate_series('2022-01-01', '2022-01-10', interval '1 day') as missing_date
left join (select distinct visit_date from person_visits where person_id in (1, 2)) as visited_dates on missing_date = visited_dates.visit_date
where visited_dates.visit_date is null
order by missing_date; 