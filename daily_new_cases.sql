-- How did daily infections trend in India?
SELECT 
    date,
    daily_new_cases,
    cumulative_total_cases
FROM CovidDeaths
WHERE country = 'India'
ORDER BY date;