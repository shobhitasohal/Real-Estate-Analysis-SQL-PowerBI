# 🏠 Tennessee Real Estate Market Analysis | SQL + Power BI

## 📋 Project Summary

| | |
|---|---|
| **Business Context** | Tennessee's real estate market lacked a centralized, clean data source — leaving agents, investors, and county assessors unable to make data-driven decisions on pricing, sales trends, or market distribution |
| **Objective** | Clean 56,000+ raw property records using SQL and build an interactive Power BI dashboard delivering actionable insights into market trends, city-level pricing, and property type performance across Tennessee (2013–2016) |
| **Solution** | Executed a two-phase pipeline: SQL data cleaning (6 issue categories resolved, 103 duplicates removed) followed by a two-page interactive Power BI dashboard with DAX measures and cross-filtering slicers |
| **Business Outcome** | Delivered a dashboard tracking $18.4B in total property sales across 56,000+ transactions — enabling stakeholders to identify high-value markets, monitor YoY growth, and assess pricing gaps across property categories |

---

## 🔍 Business Problem

Tennessee's real estate market data existed in raw, inconsistent form — with missing property addresses, combined address fields, inconsistent date formats, duplicate records, and unstandardized values. Stakeholders including real estate agents, investors, and county assessors could not make informed decisions without reliable, structured data to analyze sales trends, pricing patterns, and market distribution across cities and property types.

**The goal:** Transform 56,374 raw property records into a clean, analysis-ready dataset and deliver an interactive Power BI dashboard enabling data-driven insights across Tennessee's real estate market from 2013 to 2016.

---

## 💡 Solution

This project was executed in two phases:

### Phase 1 — Data Cleaning (SQL)

A structured SQL pipeline was built in Microsoft SQL Server to resolve 6 categories of data quality issues:

| Issue | Resolution |
|---|---|
| Inconsistent date formats | Converted `SaleDate` to standard DATE format using `CONVERT` |
| Missing property addresses | Imputed NULLs using a self-join on `ParcelID` — same ParcelID always shares the same address |
| Combined address fields | Split into Street and City columns using `PARSENAME` for granular city-level analysis |
| Inconsistent Yes/No values | Standardized `SoldAsVacant` field from binary (0/1) to readable (Y/N) using `CASE` statements |
| 103 duplicate records | Identified and safely removed using `RANK()` window function across multiple columns |
| Redundant columns | Dropped non-essential fields using `ALTER` and `DROP` to streamline the dataset |

**SQL Concepts Applied:** SELECT · Self-JOIN · String Manipulation (PARSENAME) · Window Functions (RANK) · CTEs · UPDATE · DROP · ALTER · Data Type Conversion

### Phase 2 — Reporting (Power BI)

An interactive two-page dashboard was built on the cleaned dataset:

- **Data Model:** Connected cleaned dataset to Power BI with a calendar table for time-based trend analysis
- **DAX Measures:** Median Sale Price, Total Transactions, Average Assessment Gap %, YoY Sales Growth
- **Page 1 — Market Overview:** KPI cards for total transactions and median price, sales price trend by year, median price by city, and sales volume by property category
- **Page 2 — Sales Analysis:** YoY sales trend by city, vacant vs. improved property split, top cities by transaction value, and average price by property category
- **Interactivity:** Cross-filtering slicers for Year and City enable dynamic exploration across both dashboard pages

---

## 📊 Business Outcome

The cleaned dataset and Power BI dashboard enabled the following insights across **56,374 property transactions** and **$18.4B in total sales value**:

- 🏙️ **Nashville dominated with 40,216 transactions (71% of total market)** — followed by Antioch (6,286) and Hermitage (3,126), revealing clear market concentration for investment targeting
- 💰 **Median sale price of $205,700** established as the market benchmark — enabling price comparison across cities and property types
- 📈 **Sales volume grew 48% from 2013 to 2015** (11,292 → 16,734 transactions) — peak market activity identified for trend and forecasting analysis
- 🏡 **Single Family homes account for 60.5% of all transactions** (34,120 records) — the dominant property category driving market activity
- 📉 **Assessment gap monitoring** enabled stakeholders to identify properties where assessed value diverged from sale price — supporting pricing and investment decisions
- 🔎 **103 duplicate records removed** and all missing address data resolved — delivering a fully clean, analysis-ready dataset

---

## 📁 Repository Contents

| File | Description |
|---|---|
| `TN_Real_Estate_EDA.sql` | Full SQL script with all 6 data cleaning steps |
| `TN_Real_Estate_Market_and_Sales_Report.pptx` | Full project presentation with SQL walkthrough and Power BI dashboard |
| `Real_Estate_EDA.csv` | Cleaned dataset output (56,374 records) |
| `TN_Real_Estate.pbix` | Interactive Power BI dashboard file |

---

## 🔗 Connect

[LinkedIn](http://www.linkedin.com/in/shobhitasohal)
