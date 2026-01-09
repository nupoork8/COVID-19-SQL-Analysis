-- Average death rate in india

-- Average death rate in India
SELECT 

    AVG((cumulative_total_deaths / cumulative_total_cases) * 100) AS avg_death_rate
FROM CovidDeaths
WHERE country = 'India' 
    AND cumulative_total_cases > 0
