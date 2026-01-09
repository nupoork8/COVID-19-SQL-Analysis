-- India's Worst Single Day
-- Purpose: When did India have maximum daily cases?


SELECT TOP 1
date,
daily_new_cases
FROM CovidDeaths
WHERE country = 'India'
ORDER BY daily_new_cases DESC

