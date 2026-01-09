-- Combined Top Countries (Cases + Deaths)
-- Purpose: See overlap between high cases and high deaths
-- Technique: UNION ALL

-- Top 10 Countries by Total Cases
SELECT 
    country,
    'High Cases' AS category,
    metric_value
FROM (
    SELECT
        country,
        MAX(cumulative_total_cases) AS metric_value
    FROM CovidDeaths
    GROUP BY country
    ORDER BY metric_value DESC
    OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY
) AS TopCases

UNION ALL

-- Top 10 Countries by Total Deaths
SELECT 
    country,
    'High Deaths' AS category,
    metric_value
FROM (
    SELECT
        country,
        MAX(cumulative_total_deaths) AS metric_value
    FROM CovidDeaths
    GROUP BY country
    ORDER BY metric_value DESC
    OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY
) AS TopDeaths;
