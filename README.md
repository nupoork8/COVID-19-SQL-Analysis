# COVID -19-SQL-Analysis

## 📊 Project Overview

This project analyzes global COVID-19 data using SQL to uncover patterns and insights about the pandemic's impact, with a special focus on India's experience. Through 10 comprehensive SQL queries, I explored infection rates, mortality trends, and comparative country analysis.

## Project Goal: 
Build practical SQL skills while telling a data-driven story about COVID-19's impact globally and in India.

## 👨‍💻 About This Project

This is my first SQL project as part of my journey to become a data analyst. I chose to analyze COVID-19 data because of its relevance and the opportunity it provides to work with real-world, time-series data at scale.

Through this project, I aimed to answer practical questions about the pandemic while building hands-on SQL skills that are essential for data analysis roles.

**What I Learned:**
- How to import and clean large datasets
- Writing complex SQL queries for analysis
- Using aggregate functions and GROUP BY effectively
- Applying UNION to combine result sets
- Telling a data-driven story through queries

I'm excited to continue building my data analytics skills and welcome any feedback!

## 🎯 Key Questions Answered

1. What is the scope of the COVID-19 dataset?
2. How did the pandemic evolve in India?
3. What was India's death rate over time?
4. Which months were worst for India?
5. When did India experience peak infections?
6. Which countries were most affected globally?
7. How do death rates compare across countries?
8. Which countries appear in both high-case and high-death categories?

---

## 🛠️ Tools & Technologies

- **Database:** SQL Server Management Studio 2022
- **Language:** T-SQL (Transact-SQL)
- **Dataset:** Worldometer COVID-19 Daily Data (Kaggle)
- **Skills Demonstrated:** Data import, querying, aggregation, filtering, grouping, UNION operations

---

## 📁 Dataset Information

**Source:** [Kaggle - Worldometer Coronavirus Dataset](https://www.kaggle.com/)

**Dataset Details:**
- **Records:** 184,787 rows
- **Countries:** 200+ countries
- **Time Period:** January 2020 - December 2023
- **Update Frequency:** Daily

**Columns:**
- `date` - Daily timestamp
- `country` - Country name
- `cumulative_total_cases` - Running total of confirmed cases
- `daily_new_cases` - New cases reported per day
- `active_cases` - Currently infected individuals
- `cumulative_total_deaths` - Running total of deaths
- `daily_new_deaths` - New deaths reported per day

---

## 🔍 Analysis Framework

### **Phase 1: Data Exploration**
Understanding the dataset scope and structure

### **Phase 2: India Deep Dive**
Analyzing India's COVID journey in detail

### **Phase 3: Global Comparisons**
Comparing countries and identifying patterns

### **Phase 4: Advanced Analysis**
Death rate comparisons and combined insights

---

## 📊 Key Findings

### **Query 1: Dataset Overview**

**SQL Query:**
```sql
-- Total records
SELECT COUNT(*) AS total_records FROM CovidDeaths;

-- Date range
SELECT MIN(date) AS first_date, MAX(date) AS last_date FROM CovidDeaths;

-- Total countries
SELECT COUNT(DISTINCT country) AS total_countries FROM CovidDeaths;

-- Global totals
SELECT 
    SUM(daily_new_cases) AS total_global_cases,
    SUM(daily_new_deaths) AS total_global_deaths
FROM CovidDeaths;
```

**Insights:**
- Dataset covers nearly 4 years of the pandemic
- Comprehensive global coverage across continents
- Daily granularity allows for detailed time-series analysis

---

### **Query 2: India's COVID Timeline**

**SQL Query:**
```sql
SELECT TOP 20
    date,
    country,
    cumulative_total_cases,
    daily_new_cases,
    cumulative_total_deaths,
    daily_new_deaths
FROM CovidDeaths
WHERE country = 'India'
ORDER BY date;
```

**Insights:**
- India's first COVID cases appeared in [Month/Year]
- Early cases were concentrated and controlled
- Daily new cases showed increasing trend

---

### **Query 3: India's Death Rate Evolution**

**SQL Query:**
```sql
SELECT 
    date,
    cumulative_total_cases AS total_cases,
    cumulative_total_deaths AS total_deaths,
    (cumulative_total_deaths / cumulative_total_cases) * 100 AS death_percentage
FROM CovidDeaths
WHERE country = 'India' AND cumulative_total_cases > 0
ORDER BY date;
```

**Insights:**
- India's death rate evolved as healthcare systems adapted
- Lower death rates in later phases suggest improved treatment protocols
- Death percentage decreased as testing increased (more cases detected)

---

### **Query 4: India's Daily Case Trends**

**SQL Query:**
```sql
SELECT 
    date,
    daily_new_cases,
    cumulative_total_cases
FROM CovidDeaths
WHERE country = 'India'
ORDER BY date;
```

**Insights:**
- India experienced multiple distinct pandemic waves
- Daily cases showed high volatility during peak periods
- Recovery periods allowed healthcare system to stabilize

---

### **Query 5: India's Monthly Summary**

**SQL Query:**
```sql
SELECT 
    YEAR(date) AS year,
    MONTH(date) AS month,
    SUM(daily_new_cases) AS monthly_cases,
    SUM(daily_new_deaths) AS monthly_deaths
FROM CovidDeaths
WHERE country = 'India'
GROUP BY YEAR(date), MONTH(date)
ORDER BY year, month;
```


**Insights:**
- Monthly aggregation reveals clear wave patterns
- Certain months showed both high cases AND high deaths

---

### **Query 6: India's Peak Day**

**SQL Query:**
```sql
SELECT TOP 1
    date,
    daily_new_cases
FROM CovidDeaths
WHERE country = 'India'
ORDER BY daily_new_cases DESC;
```


**Insights:**
- This peak day marked the height of India's pandemic crisis
- Healthcare systems were under maximum pressure
- National response was mobilized during this period

---

### **Query 7: Top 10 Countries by Total Cases**

**SQL Query:**
```sql
SELECT TOP 10 
    country,
    MAX(cumulative_total_cases) AS highest_cases
FROM CovidDeaths
GROUP BY country
ORDER BY highest_cases DESC;
```

**Top 5 Countries:**
1. [USA] - [84209473] cases
2. [India] - [43121599] cases
3. [Brazil] - [30682094] cases
4. [France] - [29160802] cases
5. [Germany] - [25774509] cases

**India's Ranking:** [2] globally

**Insights:**
- Large population countries dominate the top rankings
- India ranks among the most affected nations globally
- Top 10 countries account for majority of global cases

---

### **Query 8: Top 10 Countries by Total Deaths**

**SQL Query:**
```sql
SELECT TOP 10 
    country,
    MAX(cumulative_total_deaths) AS highest_deaths
FROM CovidDeaths
GROUP BY country
ORDER BY highest_deaths DESC;
```

**Top 5 Countries:**
1. [USA] - [84209473] cases
2. [India] - [43121599] cases
3. [Brazil] - [30682094] cases
4. [France] - [29160802] cases
5. [Germany] - [25774509] cases

**Insights:**
- Death rankings somewhat differ from case rankings
- Some countries had high cases but relatively lower deaths
- Healthcare infrastructure quality impacts mortality

---

### **Query 9: Combined Rankings (UNION)**

**SQL Query:**
```sql
-- Top 10 by Cases
SELECT 
    country,
    'High Cases' AS category,
    metric_value
FROM (
    SELECT country, MAX(cumulative_total_cases) AS metric_value
    FROM CovidDeaths
    GROUP BY country
    ORDER BY metric_value DESC
    OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY
) AS TopCases

UNION ALL

-- Top 10 by Deaths
SELECT 
    country,
    'High Deaths' AS category,
    metric_value
FROM (
    SELECT country, MAX(cumulative_total_deaths) AS metric_value
    FROM CovidDeaths
    GROUP BY country
    ORDER BY metric_value DESC
    OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY
) AS TopDeaths;
```

**Key Observation:**
- Some countries appear in BOTH categories (high cases AND high deaths)
- Countries appearing twice: [List them]
- This indicates both widespread infection and high mortality

**Insights:**
- UNION allows us to see overlap between categories
- Most severely affected countries appear in both lists
- Some countries had high cases but managed deaths better

---

### **Query 10: Death Rate Comparison**

**SQL Query:**
```sql
SELECT TOP 20
    country,
    MAX(cumulative_total_cases) AS total_cases,
    MAX(cumulative_total_deaths) AS total_deaths,
    (MAX(cumulative_total_deaths) / MAX(cumulative_total_cases)) * 100 AS death_rate_percentage
FROM CovidDeaths
WHERE cumulative_total_cases >= 10000
GROUP BY country
ORDER BY death_rate_percentage DESC;
```

---


### **Data Limitations:**

- Dataset does not include vaccination data
- No population data for per-capita analysis
- Reporting standards vary by country
- Testing capacity affects case detection rates

---

## 🛠️ Technical Skills Demonstrated

### **SQL Concepts Applied:**

✅ **Data Definition Language (DDL)**
- Database creation
- Table creation and schema design

✅ **Data Manipulation Language (DML)**
- SELECT statements
- Filtering with WHERE clause
- Sorting with ORDER BY

✅ **Aggregate Functions**
- COUNT, SUM, MAX, MIN, AVG
- GROUP BY with multiple columns
- HAVING clause for filtered aggregations

✅ **Advanced Techniques**
- UNION and UNION ALL operations
- Date functions (YEAR, MONTH)
- Calculated fields and percentages
- Subqueries


✅ **Data Analysis Skills**
- Time-series analysis
- Comparative analysis across dimensions
- Trend identification
- Statistical calculations

---



## 🚀 How to Use This Project

### **Prerequisites:**
- SQL Server Management Studio (SSMS)
- Basic understanding of SQL

### **Steps to Reproduce:**

1. **Clone the repository**
```bash
   git clone https://github.com/yourusername/COVID-19-SQL-Analysis.git
```

2. **Create the database**
```sql
   -- Run: 00_creating_database.sql
```

3. **Create tables**
```sql
   -- Run: 01_creating_tables.sql
```

4. **Import the dataset**
   - Use SQL Server Management Studio 22
   - Import `worldometer_coronavirus_daily_data.csv` into `CovidDeaths` table

5. **Run the queries**

---

*This project was created as part of my data analytics learning journey to demonstrate SQL proficiency and data analysis capabilities.*
