# Telangana Tourism Analytics
SQL + Power BI Project

## Project Overview

This project analyzes Telangana tourism data (2016–2019) using MySQL and Power BI to identify tourism trends, visitor growth patterns, district-level performance, and forecasting insights.


---
## Live Dashboard

[View Interactive Dashboard](https://app.powerbi.com/view?r=eyJrIjoiMGZjN2Y2OTUtZjE3Zi00YzdjLTg2ODctYzEwMDBlMDU4NmJmIiwidCI6ImM2ZTU0OWIzLTVmNDUtNDAzMi1hYWU5LWQ0MjQ0ZGM1YjJjNCJ9)

---

The project covers the complete analytics workflow including:

* Data Cleaning
* Data Integration
* Views & Aggregation
* KPI Calculations
* CAGR Analysis
* Stored Procedures
* Forecasting Analysis
* Dashboard Visualization

---

# Tools & Technologies Used

* MySQL
* SQL
* Power BI
* Excel / CSV

---

# Dataset Information

The dataset contains Telangana tourism records including:

* Domestic Visitors Data from 2016 to 2019
* Foreign Visitors Data from 2016 to 2019


Yearly domestic tourism datasets from 2016–2019 were appended into a consolidated table and cleaned for further analysis.

---

# Data Preparation Process

## 1. Data Collection

Imported domestic and foreign tourism datasets from CSV files into power query.

## 2. Data Integration

Appended yearly domestic visitor datasets (2016–2019) into a single consolidated table.

Tabels:domestiv_visitors,foreign_visitors

## 3. Data Cleaning & Validation

Performed:

* NULL value checking
* Datatype correction
* Record validation
* Data consistency checks

## 4. Data Transformation

Prepared cleaned datasets for analytical queries and dashboard reporting.

---

# Project Workflow

```text
Raw CSV Files
      ↓
Data Import 
      ↓
Data Cleaning & Validation
      ↓
Data Integration / Appending
      ↓
Views & Aggregation
      ↓
Analytical Tables
      ↓
CAGR Calculation
      ↓
Stored Procedures
      ↓
Forecasting Analysis
      ↓
Power BI Dashboard
```

---

# Views Created

| View Name         | Description                                                    |
| -------------------- | -------------------------------------------------------------- |
| total_visitors       | Total domestic + foreign visitors grouped by district and year |
| total_do_visitors    | Total domestic visitors grouped by district and year           |
| total_fo_visitors    | Total foreign visitors grouped by district and year            |
| cagr_domestic        | CAGR analysis for domestic visitors                            |
| cagr_foreign         | CAGR analysis for foreign visitors                             |
| total_domestic_table | Total domestic visitors grouped by district                    |
| total_foreign_table  | Total foreign visitors grouped by district                     |
---

# Analytical Tables Created

| Table Name           | Description                                               |
| -------------------- | --------------------------------------------------------- |
| total_domestic_table | Total domestic visitors grouped by district               |
| total_foreign_table  | Total foreign visitors grouped by district                |
| cagr_domestic        | Stores CAGR values calculated using domestic visitor data |
| cagr_foreign         | Stores CAGR values calculated using foreign visitor data  |

---

# SQL Concepts Used

* Joins
* CTEs
* Aggregate Functions
* Views
* Stored Procedures
* KPI Calculations
* Forecasting Logic
* CAGR Analysis

---

# Business Questions Solved

1. Which districts have the highest domestic visitors?
2. Which districts have the highest foreign visitors?
3. Which districts show the highest tourism growth?
4. What is the domestic-to-foreign visitor ratio by district?
5. Which districts have the highest tourist-to-population footfall ratio?
6. What is the estimated domestic visitor growth for future years?
7. What is the estimated foreign visitor growth for future years?

---

# Stored Procedures

Parameterized stored procedures were created to answer dynamic business questions and forecasting analysis.

## Example Procedures

```sql
CALL top_domestic_to_foreign_ratio(2019, 'DESC', 3);

CALL tourist_population_footfall_ratio(2019, 'DESC', 5);

CALL estimate_domestic_visitor_growth('Hyderabad', 2025);

call tour.estimate_foreign_visitors_growth('Hyderabad', 2026);
```

---

# CAGR Formula Used

CAGR was calculated to measure tourism growth trends between years.

Formula:

```text
CAGR = ((Ending Value / Beginning Value) ^ (1 / Number of Years)) - 1
```

# Estimate Grow Formula Used

Formula:

```text
Estimated Visitors=Current Visitors×(1+CAGR)n
```

---

# Key Insights

* Hyderabad recorded the highest overall tourism contribution among districts.
* Domestic tourism contributed significantly more visitors compared to foreign tourism.
* Several districts showed strong CAGR growth trends between 2016–2019.
* Tourism growth patterns varied considerably across districts.
* Tourist-to-population footfall ratio analysis highlighted districts experiencing higher tourism pressure.
* Forecasting analysis estimated future domestic and foreign visitor growth using CAGR-based calculations.

---

# Dashboard Features

The Power BI dashboard includes:

* Total Visitors KPI
* Domestic Visitors KPI
* Foreign Visitors KPI
* CAGR Comparison
* Tourist-to-Population Footfall Ratio




------

# Dashboard Notes

The dashboard displays selected analytical query outputs and KPI summaries generated using SQL queries and stored procedures.

Due to dashboard visualization limitations, complete SQL queries and detailed stored procedure logic are documented separately in the GitHub repository.

---

#Screeshots

###Tourist_population_footfall_ratio

![tourist_population_footfall_ratio](/screenshot/tourist_population_footfall_ratio.JPG)

###Estimate_foreign_visitor&revenue_in_2026

![estimate_foreign_visitor&revenue_in_2026](/screenshot/estimate_foreign_visitor&revenue_in_2026.JPG)

###CAGR domestic VS foreign

![CAGR domestic VS foreign](/screenshot/CAGR_domestic_VS_foreign.JPG)

# Project Structure

```text
telangana-tourism-sql-analysis/
│
├── dataset/
│     ├── domestic_visitors.csv
│     ├── foreign_visitors.csv
│
├── SQL/
│     ├── data_cleaning
│     ├── views.sql
│     ├── business_questions.sql
│     ├── storedProcedures.sql
│

│
├── screenshots/
│
├── README.md
```

---

# Future Improvements

* Add advanced Power BI interactions
* Improve forecasting visualizations
* Add advanced DAX measures
* Add more dynamic dashboard filtering

---

# Conclusion

This project helped in understanding real-world SQL analytics workflows including:

* Data preprocessing
* Aggregation
* KPI analysis
* Forecasting
* Dashboard reporting

using MySQL and Power BI.
# Telangana-Tourism-Analytics


Connect With Me

LinkedIn: [www.linkedin.com/in/dudekula-safinabegum]

If you found this project interesting, feel free to explore the repository and connect with me.
