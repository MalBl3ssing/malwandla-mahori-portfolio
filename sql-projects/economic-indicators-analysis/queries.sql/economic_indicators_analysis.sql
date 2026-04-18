-- ============================================
-- Project: Economic Indicators Analysis (SQL)
-- Author: Malwandla Blessing Mahori
-- Date: January 2026
-- Description:
-- This project analyzes global unemployment data using SQL.
-- It demonstrates data filtering, aggregation, CASE logic,
-- window functions, and joins to extract meaningful insights.
-- ============================================

-- 1. Database & Schema Initialization
-- Establishing the environment for the raw dataset

CREATE DATABASE portfolio_project;
USE portfolio_project;

CREATE TABLE unemployment_stats (
    country VARCHAR(100),
    country_code VARCHAR(10),
    year INT,
    unemployment_rate DECIMAL(5,2)
);

-- 2. Basic Filtering & Market Analysis
-- Extracting time-series data for specific regional markets

SELECT *
FROM unemployment_stats
WHERE country_name = 'South Africa'
ORDER BY year;

-- Identifying high-impact areas based on mean unemployment rates

SELECT country_name, AVG(unemployment_rate) AS avg_unemployment
FROM unemployment_stats
GROUP BY country_name
ORDER BY avg_unemployment DESC
LIMIT 5;

-- 3. Aggregation & Global Comparisons
-- Aggregating metrics by country to determine historical averages

SELECT country_name, AVG(unemployment_rate) AS avg_unemployment
FROM unemployment_stats
GROUP BY country_name
ORDER BY avg_unemployment DESC;

-- 4. Trend Analysis (Time-Series)
-- Grouping data by year to observe global economic fluctuations

SELECT year, AVG(unemployment_rate) AS avg_unemployment
FROM unemployment_stats
GROUP BY year
ORDER BY year;

-- 5. Data Categorization (Conditional Logic)
-- Using CASE statements to create segments for classification analysis

SELECT country_name, year, unemployment_rate,
CASE 
    WHEN unemployment_rate > 10 THEN 'High'
    WHEN unemployment_rate BETWEEN 5 AND 10 THEN 'Medium'
    ELSE 'Low'
END AS unemployment_level
FROM unemployment_stats;

-- 6. Analytical Window Functions
-- Implementing partition-based calculations for granular trend tracking
-- This shows you can calculate running averages without changing the row count.
-- Crucial for detecting long-term economic shifts.

SELECT country_name, year, unemployment_rate,
AVG(unemployment_rate) OVER (PARTITION BY country_name ORDER BY year) AS running_avg
FROM unemployment_stats;

-- 7. Relational Database Design (JOINs)
-- Demonstrating the ability to normalize data and join multi-source tables

 CREATE TABLE regions (
     country VARCHAR(100),
    region VARCHAR(100)
 );
 
-- Populating dimension table with geographic metadata

 INSERT INTO regions VALUES
 ('South Africa','Africa'),
 ('United States','North America'),
 ('India','Asia'),
 ('Brazil','South America'),
 ('Germany','Europe');

-- Executing the JOIN to merge metrics with regional data

SELECT u.country_name, r.region, u.year, u.unemployment_rate
FROM unemployment_stats u
JOIN regions r 
ON u.country_name = r.country;