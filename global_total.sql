-- Global totals
SELECT 
    SUM(daily_new_cases) AS total_global_cases,
    SUM(daily_new_deaths) AS total_global_deaths
FROM CovidDeaths;