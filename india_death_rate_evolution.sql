-- India death rate evolution
-- How did india's death rate change over time

SELECT 
date,
cumulative_total_cases,
    cumulative_total_deaths,
    (cumulative_total_deaths / cumulative_total_cases) * 100 AS death_percentage
FROM CovidDeaths
WHERE country = 'India' AND cumulative_total_cases > 0
ORDER BY date;