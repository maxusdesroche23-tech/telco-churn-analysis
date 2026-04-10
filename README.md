#  Telco Customer Churn Analysis

##  Project Overview

This project analyzes customer churn using the Telco Customer Churn dataset.
The goal is to understand **why customers leave**, identify **high-risk segments**, and estimate the **financial impact of churn**.

The project combines:

* Data cleaning and preprocessing
* Exploratory data analysis (EDA)
* Business insights
* Financial impact analysis
* SQL-based analysis (BigQuery)
* Predictive modeling

---

##  Objectives

* Identify key drivers of customer churn
* Segment customers based on behavior and risk
* Quantify revenue loss caused by churn
* Build a predictive model to detect high-risk customers
* Demonstrate SQL and Python skills used in real-world analytics

---

##  Project Structure

```
telco-churn-analysis/
│
├── Data/
│   └── telco_churn_cleaned.csv
│
├── Notebooks/
│   ├── 1_data_cleaning.ipynb
│   ├── 2_exploratory_analysis.ipynb
│   ├── 3_business_analysis.ipynb
│   ├── 4_financial_analysis.ipynb
│   └── 5_churn_prediction.ipynb
│
├── SQL/
│   └── churn_queries.sql
│
└── README.md
```

---

##  Data Cleaning

* Handled missing values
* Converted `TotalCharges` to numeric
* Removed invalid records
* Created a clean dataset for downstream analysis

 Output: `telco_churn_cleaned.csv`

---

##  Exploratory Data Analysis

* Dataset structure and distributions
* Customer demographics
* Service usage patterns
* Initial churn trends

---

##  Business Analysis

* Churn rate by contract type
* Churn by payment method
* Churn by tenure group
* Churn by monthly charges

 Key insight:
Customers with **month-to-month contracts** and **short tenure** are more likely to churn.

---

##  Financial Analysis

* Revenue comparison (active vs churned customers)
* Monthly revenue loss estimation
* Revenue loss by contract and payment method
* High-risk segment financial exposure

 Key insight:
A significant portion of revenue loss is concentrated in a small group of high-risk customers.

---

## SQL Analysis (BigQuery)

SQL queries were used to simulate real-world data extraction workflows.

Main queries include:

* Overall churn rate
* Churn by contract and payment method
* Revenue loss by segment
* High-risk customer identification

 File: `SQL/churn_queries.sql`

---

## Predictive Modeling

* Logistic Regression model
* Feature selection and preprocessing
* Model evaluation (accuracy, precision, recall)

 Goal: Identify customers likely to churn before they leave.

---

## Tools & Technologies

* Python (pandas, numpy, matplotlib, seaborn, scikit-learn)
* SQL (Google BigQuery)
* Jupyter Notebook
* GitHub

---

## Key Insights

* Churn rate is approximately **26%**, indicating a significant retention issue
* Month-to-month customers have the highest churn risk
* Electronic check users are more likely to churn
* Early-stage customers (low tenure) are the most vulnerable
* High-paying customers contribute significantly to revenue loss when they churn

---

## How to Run the Project

1. Clone the repository
2. Open notebooks in order:

   * Data Cleaning
   * EDA
   * Business Analysis
   * Financial Analysis
   * Prediction
3. Run each notebook sequentially

---

## Future Improvements

* Improve predictive model performance
* Add feature engineering for better segmentation
* Integrate dashboard (Power BI / Tableau)
* Deploy model for real-time predictions

---

##  Author

Max Desroches
Aspiring Data Analyst

---

