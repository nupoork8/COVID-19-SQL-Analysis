-- Creating tables

-- 1. Create the Deaths Table
CREATE TABLE covid_deaths (
    iso_code NVARCHAR(50),
    continent NVARCHAR(50),
    location NVARCHAR(50),
    date DATETIME,
    population FLOAT,
    total_cases FLOAT,
    new_cases FLOAT,
    total_deaths FLOAT,
    new_deaths FLOAT
);

-- 2. Create the Vaccinations Table
CREATE TABLE covid_vaccinations (
    iso_code NVARCHAR(50),
    continent NVARCHAR(50),
    location NVARCHAR(50),
    date DATETIME,
    new_tests FLOAT,
    total_tests FLOAT,
    total_vaccinations FLOAT,
    people_vaccinated FLOAT
);