-- =====================================
-- 1. Overall Churn Rate
-- =====================================

SELECT
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Churn = TRUE THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(
    100 * SUM(CASE WHEN Churn = TRUE THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS churn_rate_percent
FROM `hale-acumen-474604-c5.telco_project.telco_churn`;


-- =====================================
-- 2. Churn by Contract Type
-- =====================================

SELECT
  Contract,
  COUNT(*) AS customers,
  SUM(CASE WHEN Churn = TRUE THEN 1 ELSE 0 END) AS churned,
  ROUND(
    100 * SUM(CASE WHEN Churn = TRUE THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS churn_rate_percent
FROM `hale-acumen-474604-c5.telco_project.telco_churn`
GROUP BY Contract
ORDER BY churn_rate_percent DESC;


-- =====================================
-- 3. Churn by Payment Method
-- =====================================

SELECT
  PaymentMethod,
  COUNT(*) AS customers,
  SUM(CASE WHEN Churn = TRUE THEN 1 ELSE 0 END) AS churned,
  ROUND(
    100 * SUM(CASE WHEN Churn = TRUE THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS churn_rate_percent
FROM `hale-acumen-474604-c5.telco_project.telco_churn`
GROUP BY PaymentMethod
ORDER BY churn_rate_percent DESC;

-- =====================================
-- 4. Churn by Tenure Group
-- =====================================

SELECT
  CASE
    WHEN tenure <= 12 THEN '0-12 months'
    WHEN tenure <= 24 THEN '13-24 months'
    WHEN tenure <= 48 THEN '25-48 months'
    ELSE '49-72 months'
  END AS tenure_group,
  COUNT(*) AS customers,
  SUM(CASE WHEN Churn = TRUE THEN 1 ELSE 0 END) AS churned,
  ROUND(
    100 * SUM(CASE WHEN Churn = TRUE THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS churn_rate_percent
FROM `hale-acumen-474604-c5.telco_project.telco_churn`
GROUP BY tenure_group
ORDER BY churn_rate_percent DESC;

-- =====================================
-- 5. Monthly Revenue by Churn Status
-- =====================================

SELECT
  Churn,
  COUNT(*) AS customers,
  ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue,
  ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
FROM `hale-acumen-474604-c5.telco_project.telco_churn`
GROUP BY Churn
ORDER BY monthly_revenue DESC;

-- =====================================
-- 6. Lost Monthly Revenue by Contract Type
-- =====================================

SELECT
  Contract,
  COUNT(*) AS churned_customers,
  ROUND(SUM(MonthlyCharges), 2) AS lost_monthly_revenue,
  ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
FROM `hale-acumen-474604-c5.telco_project.telco_churn`
WHERE Churn = TRUE
GROUP BY Contract
ORDER BY lost_monthly_revenue DESC;

-- =====================================
-- 7. Lost Monthly Revenue by Payment Method
-- =====================================

SELECT
  PaymentMethod,
  COUNT(*) AS churned_customers,
  ROUND(SUM(MonthlyCharges), 2) AS lost_monthly_revenue,
  ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
FROM `hale-acumen-474604-c5.telco_project.telco_churn`
WHERE Churn = TRUE
GROUP BY PaymentMethod
ORDER BY lost_monthly_revenue DESC;

-- =====================================
-- 8. Top 10 Highest Monthly Charge Customers Who Churned
-- =====================================

SELECT
  customerID,
  tenure,
  Contract,
  PaymentMethod,
  MonthlyCharges,
  TotalCharges
FROM `hale-acumen-474604-c5.telco_project.telco_churn`
WHERE Churn = TRUE
ORDER BY MonthlyCharges DESC
LIMIT 10;

-- =====================================
-- 9. High-Risk Customer Segment
-- =====================================

SELECT
  COUNT(*) AS high_risk_customers,
  SUM(CASE WHEN Churn = TRUE THEN 1 ELSE 0 END) AS churned_high_risk_customers,
  ROUND(
    100 * SUM(CASE WHEN Churn = TRUE THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS churn_rate_percent
FROM `hale-acumen-474604-c5.telco_project.telco_churn`
WHERE Contract = 'Month-to-month'
  AND PaymentMethod = 'Electronic check'
  AND tenure <= 12;

-- =====================================
-- 10. Revenue of High-Risk Segment
-- =====================================

SELECT
  COUNT(*) AS customers,
  ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue,
  ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
FROM `hale-acumen-474604-c5.telco_project.telco_churn`
WHERE Contract = 'Month-to-month'
  AND PaymentMethod = 'Electronic check'
  AND tenure <= 12;