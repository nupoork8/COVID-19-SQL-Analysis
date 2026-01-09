--India Monthly Summary
-- Purpose: Identify worst months


SELECT 
    YEAR(date) AS year,
    MONTH(date) AS month,
    SUM(daily_new_cases) AS monthly_cases,
    SUM(daily_new_deaths) AS monthly_deaths
FROM CovidDeaths
WHERE country = 'India'
GROUP BY 
    YEAR(date),
    MONTH(date)
ORDER BY 
    year,
    month;