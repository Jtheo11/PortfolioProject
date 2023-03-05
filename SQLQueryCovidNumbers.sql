select *
from PortfolioProject..[Covid_deaths ]
Where continent is not null
Order By 3,4

--select *
--From PortfolioProject..Covid_Vaccinations
--Order By 3,4

-- select Data that we are going to be using

select location, date, total_cases, new_cases, total_deaths, population
from PortfolioProject..[Covid_deaths ]
Order by 1,2


--Looking at total case vs total deaths

--Below shows liklehood of dying if you contract COVID in your country
select location, date, total_cases, total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..[Covid_deaths ]
where location like '%states%'
Where continent is not null
Order by 1,2

--Looking at Total Cases VS Population
select location, date, total_cases, population, (total_cases/population)*100 as InfectedPopulationPercentage
from PortfolioProject..[Covid_deaths ]
where location like '%states%'
Where continent is not null
Order by 1,2


-- Looking at countries with highest infection rate compared to population
select location, MAX(total_cases) as HighestInfectionCount, population, MAX((total_cases/population))*100 as InfectedPopulationPercentage
from PortfolioProject..[Covid_deaths ]
--where location like '%states%'
Group By Location, population
Order by InfectedPopulationPercentage desc

--Showing countries with the highest death count per population

select location, MAX(cast(total_deaths as  int)) as TotalDeathCount
from PortfolioProject..[Covid_deaths ]
--where location like '%states%'
Where continent is not null
Group By Location, population
Order by TotalDeathCount desc

--Splitting up by continent now

select continent, MAX(cast(total_deaths as  int)) as TotalDeathCount
from PortfolioProject..[Covid_deaths ]
--where location like '%states%'
Where continent is not null
Group By continent
Order by TotalDeathCount desc



-- Global numbers

select date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
from PortfolioProject..[Covid_deaths ]
--where location like '%states%'
Where continent is not null
Group by date
Order by 1,2

--Looking at total population vs vaccinations

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.location Order by dea.location, dea.date)
from PortfolioProject..[Covid_deaths ] dea
join PortfolioProject..Covid_Vaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
Order by 2,3

