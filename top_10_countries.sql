-- which countires had the most COVID cases

SELECT TOP 10 
country,
MAX(cumulative_total_cases) AS highest_cases
FROM CovidDeaths
GROUP BY country
ORDER BY highest_cases DESC;