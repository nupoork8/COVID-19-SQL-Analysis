-- Death percentage in India 
SELECT 
    date,
    cumulative_total_cases AS total_cases,
    cumulative_total_deaths AS total_deaths,
    (cumulative_total_deaths / cumulative_total_cases) * 100 AS death_percentage
FROM CovidDeaths
WHERE country = 'India'
ORDER BY date;

