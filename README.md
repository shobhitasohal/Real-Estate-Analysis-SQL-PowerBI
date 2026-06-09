# 🏠 Real Estate EDA | SQL — Nashville Housing Dataset

---

## 🔍 Business Problem

Real estate firms rely on accurate, consistent data to make pricing decisions, identify market trends, and allocate resources effectively. The Nashville Housing dataset contained raw, uncleaned data with missing property addresses, inconsistent formats, duplicate records, and combined fields — making it unsuitable for any meaningful analysis.

**The goal:** Transform this messy dataset into a clean, reliable, analysis-ready resource that can support decisions around property valuation, sales trends, and market segmentation.

---

## 🛠️ How It Was Solved

A structured SQL-based data cleaning pipeline was applied across 6 key problem areas:

| Problem | Solution |
|---|---|
| Inconsistent date formats | Converted SaleDate to standard DATE format using CONVERT |
| Missing property addresses | Imputed NULLs using a self-join on ParcelID |
| Combined address fields | Split into Street, City, and State columns using SUBSTRING and PARSENAME |
| Inconsistent Yes/No values | Standardized SoldAsVacant field using CASE statements |
| Duplicate records | Identified and removed using ROW_NUMBER() window function |
| Redundant columns | Dropped unused fields to streamline the dataset |

**SQL Concepts Applied:**

- JOIN for NULL imputation
- SUBSTRING, CHARINDEX, PARSENAME for string manipulation
- ROW_NUMBER() window function for duplicate detection
- CASE statements for value standardization
- CONVERT for data type transformation

---

## 📊 Output

The cleaned dataset is fully structured and ready for analysis, enabling:

- 📈 Sales trend analysis across time periods
- 🏡 Property value comparisons by location and type
- 🗺️ Geographic segmentation of Nashville's housing market
- 📋 Accurate reporting without data quality issues skewing results

---

## 📁 Files in This Repository

| File | Description |
|---|---|
| Data Cleaning Project.sql | Full SQL script with all cleaning steps |
| Data Cleaning Project.pptx | Presentation walkthrough of the project |
| Final Output - Nashville Housing Data_cleaned.csv.xlsx | Final cleaned dataset |
