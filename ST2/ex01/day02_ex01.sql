SELECT missing_date::date FROM generate_series('2022-01-01', '2022-01-10', INTERVAL '1 day') AS missing_date
LEFT JOIN (SELECT DISTINCT visit_date FROM person_visits WHERE person_id IN (1, 2)) AS visited_dates ON missing_date = visited_dates.visit_date
WHERE visited_dates.visit_date IS NULL
ORDER BY missing_date;