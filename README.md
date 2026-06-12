# 🏠 Real Estate Data Analysis | SQL + Power BI — Tennessee Real Estate Dataset

## 🔍 Business Problem

Tennessee's real estate market lacked a centralized, clean data source to analyze property sales trends, pricing patterns, and market distribution across cities and property types. Stakeholders — including real estate agents, investors, and county assessors — could not make informed decisions without reliable, structured property sales data.

**The goal:** Clean raw property records using SQL and deliver an interactive Power BI dashboard enabling data-driven insights into market trends, city-level pricing, and property type performance across Tennessee (2013–2016).

---

## 🛠️ How It Was Solved

This project was completed in two phases:

### Phase 1 — Data Cleaning (SQL)

| Problem | Solution |
|---|---|
| Inconsistent date formats | Converted `SaleDate` to standard DATE format using `CONVERT` |
| Missing property addresses | Imputed NULLs using a self-join on `ParcelID` |
| Combined address fields | Split into Street and City columns using `PARSENAME` |
| Inconsistent Yes/No values | Standardized `SoldAsVacant` field using `CASE` statements |
| 103 duplicate records | Identified and removed using `RANK()` window function |
| Redundant columns | Dropped unused fields using `ALTER` and `DROP` |

**SQL Concepts Applied:** SELECT, Self-JOIN, String Manipulation, Window Functions (RANK), CTEs, UPDATE, DROP, ALTER, Data Type Conversion

### Phase 2 — Reporting (Power BI)

- **Data Model:** Connected cleaned dataset to Power BI with a calendar table for time-based analysis
- **DAX Measures:** Median Sale Price, Total Transactions, Average Assessment Gap %, YoY Sales Growth
- **Page 1 — Market Overview:** KPI cards, sales price trend by year, median price by city, sales volume by property category
- **Page 2 — Sales Analysis:** YoY sales trend by city, vacant vs. improved property split, top cities by transaction value, average price by property category
- **Interactivity:** Cross-filtering slicers for Year and City across both dashboard pages

---

## 📊 Output

An interactive two-page Power BI dashboard enabling stakeholders to:

- 📈 Track **year-over-year sales growth** across Tennessee (2013–2016)
- 🏙️ Compare **median sale prices by city** to identify high-value markets
- 🏡 Analyze **property type performance** (vacant vs. improved, property categories)
- 💰 Monitor **assessment gaps** to support pricing and investment decisions

---

## 📁 Files in This Repository

| File | Description |
|---|---|
| `Data Cleaning Project.sql` | Full SQL script with all cleaning steps |
| `Data Cleaning Project_Updated.pptx` | Presentation walkthrough of the full project |
| `Final Output - Tennessee Real Estate Data_cleaned.xlsx` | Final cleaned dataset |
