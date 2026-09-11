/*

Queries used for Tableau Project

*/



-- 1. 

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From [Portfolio project]..CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2



--Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
--From PortfolioProject..CovidDeaths
----Where location like '%states%'
--where location = 'World'
----Group By date
--order by 1,2


-- 2. 



Select country, SUM(cast(new_deaths as int)) as TotalDeathCount
From [Portfolio project]..CovidDeaths
--Where location like '%states%'
Where continent is null 
and country not in ('World', 'European Union', 'International')
Group by country
order by TotalDeathCount desc


-- 3.

Select country, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From [Portfolio project]..CovidDeaths
--Where location like '%states%'
Group by country, Population
order by PercentPopulationInfected desc


-- 4.


Select country, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From [Portfolio project]..CovidDeaths
--Where location like '%states%'
Group by country, Population, date
order by PercentPopulationInfected desc












