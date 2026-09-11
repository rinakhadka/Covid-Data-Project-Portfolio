/*
Covid 19 Data Exploration 

Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

*/
Select *
From [Portfolio project]..CovidDeaths
order by 3,4

Select *
From [Portfolio project]..CovidDeaths
Where continent is not null 
order by 3,4


-- Select Data that we are going to be starting with

Select country, date, total_cases, new_cases, total_deaths, population
From [Portfolio project]..CovidDeaths
Where continent is not null 
order by 1,2


-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country

Select country, date, total_cases, total_deaths, (total_deaths / NULLIF(total_cases, 0))*100 as DeathPercentage
From [Portfolio project]..CovidDeaths
Where country like '%nepal%'
and continent is not null 
order by 1,2


-- Total Cases vs Population
-- Shows what percentage of population infected with Covid

Select country, date, Population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
From [Portfolio project]..CovidDeaths
Where country like '%nepal%'
order by 1,2


-- Countries with Highest Infection Rate compared to Population

Select country, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From [Portfolio project]..CovidDeaths
--Where location like '%states%'
Group by country, Population
order by PercentPopulationInfected desc


-- Countries with Highest Death Count per Population

Select country, MAX(cast(Total_deaths as int)) as TotalDeathCount
From [Portfolio project]..CovidDeaths
--Where location like '%states%'
Where continent is not null 
Group by country
order by TotalDeathCount desc



-- BREAKING THINGS DOWN BY CONTINENT

-- Showing contintents with the highest death count per population

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From [Portfolio project]..CovidDeaths
--Where location like '%states%'
Where continent is not null 
Group by continent
order by TotalDeathCount desc



-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From [Portfolio project]..CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2



-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine
SELECT 
    dea.continent, 
    dea.country, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations, 
    SUM(TRY_CONVERT(bigint, vac.new_vaccinations)) OVER (
        PARTITION BY CAST(dea.country AS nvarchar(100)) 
        ORDER BY CAST(dea.country AS nvarchar(100)), CAST(dea.date AS date)
        ROWS UNBOUNDED PRECEDING
    ) AS RollingPeopleVaccinated
FROM [Portfolio project]..CovidDeaths dea
JOIN [Portfolio project]..CovidVaccinations vac
    ON dea.country = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL 
ORDER BY 2, 3


-- Using CTE to perform Calculation on Partition By in previous query

With PopvsVac (Continent, country, Date, Population, New_Vaccinations, RollingPeopleVaccinated) as (
    SELECT 
        dea.continent, 
        dea.country, 
        dea.date, 
        dea.population, 
        vac.new_vaccinations, 
        SUM(TRY_CONVERT(bigint, vac.new_vaccinations)) OVER (
            PARTITION BY CAST(dea.country AS nvarchar(100)) 
            ORDER BY CAST(dea.country AS nvarchar(100)), CAST(dea.date AS date)
            ROWS UNBOUNDED PRECEDING
        ) AS RollingPeopleVaccinated
    FROM [Portfolio project]..CovidDeaths dea
    JOIN [Portfolio project]..CovidVaccinations vac
        ON dea.country = vac.location
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL 
)
Select *, (RollingPeopleVaccinated/Population)*100 From PopvsVac ORDER BY 2, 3


-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
country nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT 
    dea.continent, 
    dea.country, 
    dea.date, 
    dea.population, 
    TRY_CONVERT(numeric, vac.new_vaccinations), 
    SUM(TRY_CONVERT(bigint, vac.new_vaccinations)) OVER (
        PARTITION BY CAST(dea.country AS nvarchar(100)) 
        ORDER BY CAST(dea.country AS nvarchar(100)), CAST(dea.date AS date)
        ROWS UNBOUNDED PRECEDING
    ) AS RollingPeopleVaccinated
FROM [Portfolio project]..CovidDeaths dea
JOIN [Portfolio project]..CovidVaccinations vac
    ON dea.country = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL

SELECT *, (RollingPeopleVaccinated / NULLIF(Population, 0)) * 100 AS PercentPopulationVaccinated
FROM #PercentPopulationVaccinated




-- Creating View to store data for later visualizations
CREATE VIEW PercentPopulationVaccinated AS
SELECT 
    dea.continent, 
    dea.country, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations, 
    SUM(TRY_CONVERT(bigint, vac.new_vaccinations)) OVER (
        PARTITION BY CAST(dea.country AS nvarchar(100)) 
        ORDER BY CAST(dea.country AS nvarchar(100)), CAST(dea.date AS date)
        ROWS UNBOUNDED PRECEDING
    ) AS RollingPeopleVaccinated
FROM [Portfolio project]..CovidDeaths dea
JOIN [Portfolio project]..CovidVaccinations vac
    ON dea.country = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL



SELECT * FROM PercentPopulationVaccinated
