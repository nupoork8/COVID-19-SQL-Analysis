-- What's the date range of our data ?

SELECT 
    MIN(date) AS first_date,
    MAX(date) AS last_date
FROM CovidDeaths;