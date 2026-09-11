# COVID-19 Data Analysis & Tableau Dashboard

## Project Overview

This project analyzes global COVID-19 data to understand the spread of the pandemic, death rates, infection levels, and vaccination progress across different countries and continents.

The project demonstrates an end-to-end data analysis workflow using **SQL for data exploration and analysis** and **Tableau for interactive data visualization**.

The main goal was to transform raw COVID-19 data into meaningful insights that can be explored through an interactive dashboard.

## Business Questions

The analysis focuses on questions such as:

* What was the likelihood of death after contracting COVID-19?
* Which countries had the highest infection rates relative to their population?
* Which countries recorded the highest total number of deaths?
* How did COVID-19 cases and deaths vary across countries and continents?
* What percentage of the population received COVID-19 vaccinations?
* How did vaccination progress change over time?

## Tools & Technologies

* **SQL Server** – Data exploration and analysis
* **Tableau** – Interactive dashboard and visualization
* **Excel** – Supporting data preparation
* **GitHub** – Project documentation and version control

## Analysis Performed

### 1. COVID-19 Death Analysis

Calculated the percentage of reported cases that resulted in death using:

`Total Deaths / Total Cases × 100`

The analysis also included a focused examination of Nepal's COVID-19 data.

### 2. Infection Analysis

Compared total COVID-19 cases with population to calculate the percentage of the population reported as infected.

### 3. Country-Level Analysis

Identified countries with:

* Highest infection counts
* Highest infection rates relative to population
* Highest total death counts

### 4. Continental Analysis

Compared COVID-19 death counts across continents to identify differences in the pandemic's impact.

### 5. Global Analysis

Calculated global totals for:

* New COVID-19 cases
* New deaths
* Global death percentage

### 6. Vaccination Analysis

Combined COVID-19 death and vaccination datasets using SQL joins and calculated cumulative vaccinations using SQL window functions.

The project uses a rolling vaccination total to understand vaccination progress over time.

## SQL Skills Demonstrated

This project helped me practice and apply:

* SELECT statements
* Filtering with WHERE
* GROUP BY and aggregate functions
* JOINs
* Common Table Expressions (CTEs)
* Temporary tables
* Window functions
* Rolling calculations
* Data type conversion
* NULL handling
* Creating SQL views

For example, a window function was used to calculate cumulative vaccinations by country over time.

## Tableau Dashboard

The SQL analysis was used to create an interactive Tableau dashboard for exploring COVID-19 trends and statistics.

**View the interactive dashboard:**

[COVID-19 Tableau Dashboard](https://public.tableau.com/app/profile/reena.khadka/viz/CovidDashboardProject_17889714685770/Dashboard1?publish=yes)

## Key Takeaways

The analysis provides a country- and continent-level view of:

* COVID-19 infection rates
* Death counts and death percentages
* Global COVID-19 trends
* Vaccination progress
* Differences in pandemic impact between countries

## Project Files

* `Covid project data exploration.sql` – SQL analysis
* `tableausql.sql` – SQL queries used for Tableau analysis
* `Covid Dashboard Project.twbx` – Tableau workbook
* `covid death.csv.gz` – COVID-19 dataset
* `tableau1.xlsx` and supporting Excel files – Data used for Tableau visualizations
* `Screenshot...png` – Dashboard preview

## What I Learned

Through this project, I strengthened my ability to:

* Work with real-world datasets
* Write SQL queries for analytical questions
* Combine datasets using JOINs
* Use CTEs and window functions
* Calculate cumulative metrics
* Prepare analytical datasets for visualization
* Communicate analytical findings through dashboards

## Limitations

COVID-19 reporting varied between countries, and reported cases, deaths, and vaccinations may not represent the complete real-world numbers.

Therefore, the results should be interpreted as an analysis of the available reported data rather than an exact measurement of the total impact of COVID-19.

## Author

**Reena Khadka**

Aspiring Data Analyst/Scientist | SQL | Python | Excel | Tableau | Power BI

