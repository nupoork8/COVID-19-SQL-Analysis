-- Death rate by country 
-- Overall Death Statistics
SELECT TOP 20
     country,
     MAX(cumulative_total_cases) AS total_cases,
     MAX(cumulative_total_deaths) AS total_deaths,
     (MAX(cumulative_total_deaths) / MAX (cumulative_total_cases)) * 100 AS death_rate
FROM CovidDeaths
WHERE cumulative_total_cases > 10000
GROUP BY country
ORDER BY death_rate DESC;