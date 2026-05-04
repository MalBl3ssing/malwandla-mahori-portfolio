## 📊 Economic Indicators Analysis (Project Showcase)
## 👩🏽‍💻 Author
**Malwandla Blessing Mahori**  
Dec 2025 

### 🚀 Project Overview
This project analyzes global unemployment data (1991-2021) using SQL to identify trends across countries and over time. The analysis demonstrates key data analytics skills including data filtering, aggregation, classification, window functions, and relational joins. The goal was to take a complex multi-year dataset and extract actionable insights using advanced SQL techniques. I focused on ensuring **Data Integrity** and creating **Analytical Pipelines** that could easily be connected to visualization tools like Power BI.

---
## 🎯 Objectives
- Explore and understand the structure of the dataset  
- Analyze unemployment trends across different countries  
- Compare average unemployment rates  
- Classify unemployment levels using conditional logic  
- Demonstrate advanced SQL techniques such as window functions and joins

---
## 🛠️ Tools & Technologies
- MySQL Workbench  
- SQL  

---

## 📂 Dataset
The dataset contains global unemployment statistics with the following fields:

- `country_name` – Name of the country  
- `country_code` – Country code  
- `year` – Year of observation  
- `unemployment_rate` – Percentage of unemployment  

---
## ⚙️ SQL Techniques Used

### 🔹 Data Exploration
Basic queries were used to inspect and understand the dataset structure.

### 🔹 Data Filtering
Filtered data for specific countries to analyze trends over time.

### 🔹 Aggregation
Used `AVG()` and `GROUP BY` to calculate average unemployment rates by country and year.

### 🔹 CASE Statements
Categorized unemployment rates into:
- Low  
- Medium  
- High  

### 🔹 Window Functions
Applied functions such as:
- `AVG() OVER()`  
- `RANK() OVER()`  

to analyze trends without losing row-level detail.

### 🔹 Joins
Created a secondary table to assign regions and used `INNER JOIN` to combine datasets.

---

#### 📊 Results & Outputs
* Query results have been exported and compiled into a summary document.
* Screenshots of query execution and outputs are included in the repository.

### 🧠 Key Insights
* **Regional Disparities:** Identified significant variations in unemployment averages across different continents through aggregated joins.
* **Economic Volatility:** Used trend analysis to pinpoint specific years where global unemployment spiked significantly.
* **Segmented Risk:** Classified over 7,000 data points to identify "High Risk" economic zones for deeper analysis.





### 🔍 Featured Queries & Logic
#### 1. Granular Trend Tracking (Window Functions)
To analyze how a country performs against its own historical average without losing row-level detail, I implemented a **Running Average** using Window Functions. This is a key skill for detecting economic shifts over time.

```sql
SELECT 
    country_name, 
    year, 
    unemployment_rate,
    AVG(unemployment_rate) OVER (PARTITION BY country_name ORDER BY year) AS running_avg
FROM unemployment_stats;```

---


### 2. Risk Classification (CASE Statements)
I developed a classification system to segment countries into "High," "Medium," and "Low" categories. This logic serves as the foundation for dynamic filtering in a Business Intelligence (BI) environment.

```sql
SELECT 
    country_name, 
    year, 
    unemployment_rate,
    CASE 
        WHEN unemployment_rate > 10 THEN 'High'
        WHEN unemployment_rate BETWEEN 5 AND 10 THEN 'Medium'
        ELSE 'Low'
    END AS unemployment_level
FROM unemployment_stats;```


### 3. Multi-Source Data Integration (Relational JOINs)
By creating a separate regions table, I demonstrated the ability to normalize a database. I used an INNER JOIN to merge the unemployment metrics with geographic metadata for more comprehensive regional reporting.

```sql
SELECT u.country_name, r.region, u.year, u.unemployment_rate
FROM unemployment_stats u
JOIN regions r ON u.country_name = r.country;```

---

