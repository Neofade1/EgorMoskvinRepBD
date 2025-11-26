WITH days AS (SELECT generate_series('2022-01-01', '2022-01-10', INTERVAL '1 day')::date AS missing_date),visited_dates AS (SELECT DISTINCT visit_dateFROM person_visits WHERE person_id = 1 OR person_id = 2)
SELECT days.missing_date
FROM days
LEFT JOIN visited_dates ON days.missing_date = visited_dates.visit_date
WHERE visited_dates.visit_date IS NULL
ORDER BY days.missing_date; 