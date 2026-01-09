-- Show COVID data for india

SELECT TOP 20
    date,
    country,
    cumulative_total_cases,
        daily_new_cases,
        cumulative_total_deaths,
        daily_new_deaths
FROM CovidDeaths
WHERE country = 'India'
ORDER BY date;