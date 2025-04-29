CREATE TABLE customers (
    CustomerId VARCHAR(50) PRIMARY KEY,
    "Full Name" VARCHAR(255),
    Age INTEGER,
    "Age Group" VARCHAR(50),
    "Date of Birth" DATE,
    Gender VARCHAR(10),
    "Marital Status" VARCHAR(50),
    "Number of Dependents" INTEGER,
    Occupation VARCHAR(100),
    "Income" VARCHAR(100),
    "Income Gap" VARCHAR(100),
    "Education Level" VARCHAR(100),
    Address VARCHAR(255),
    "Contact Information" VARCHAR(100),
    "Customer Tenure" INTEGER,
    "Tenure Category" VARCHAR(50),
    "Customer Segment" VARCHAR(100),
    Communication VARCHAR(100),
    "Credit Score" INTEGER,
    "Credit History" INTEGER,
    "Outstanding Loans" FLOAT,
    "Churn Flag" INTEGER,
    "Churn Reason" VARCHAR(255),
    "Churn Date" DATE,
    "Balance" VARCHAR(100),
    "Num of Products" INTEGER,
    "Num of Complaints" INTEGER,
    "Risk Indicator" VARCHAR(50),
    "Balance-Income Ratio" VARCHAR(50),
    "Balance-Income Ratio Category" VARCHAR(50),
    "Churn Status" VARCHAR(50),
    "Credit Utilization Ratio" VARCHAR(50),
    "Complaint Rate" FLOAT,
    "Loan to Income Ratio" VARCHAR(50)
);

/*========================================================================
                     Exploratory Data Analysis (EDA) 
========================================================================*/

-- Retrieve all columns and rows from the Netflix dataset. 

SELECT * 
FROM customers; 

-- 1. Total number of customers.

SELECT 
	COUNT(*) AS total_customers
FROM customers;

-- 2. Total churned vs active customers.

SELECT 
  "Churn Status",
  COUNT(*) AS customer_count
FROM customers
GROUP BY "Churn Status";

-- 3. Average customer income.

SELECT 
  ROUND(AVG(REPLACE(REPLACE("Income", '$', ''), ',', '')::NUMERIC),2) AS avg_income
FROM customers;

-- 4. Highest customer balance.

SELECT 
  MAX(REPLACE(REPLACE("Balance", '$', ''), ',', '')::NUMERIC) AS highest_balance
FROM customers;

-- 5. Lowest customer balance.

SELECT 
  MIN(REPLACE(REPLACE("Balance", '$', ''), ',', '')::NUMERIC) AS lowest_balance
FROM customers;

-- 6. Average credit score.

SELECT 
  ROUND(AVG("Credit Score"),2) AS avg_credit_score
FROM customers;

-- 7. Max and Min number of products held by a customer.

SELECT 
  MAX("Num of Products") AS max_products, 
  MIN("Num of Products") AS min_products
FROM customers;

-- 8. Total no of people per age group.

SELECT 
  "Age Group",
  COUNT(*) AS count_agegroup
FROM customers
GROUP BY "Age Group";

-- 9. Top 10 occupation among customers.

SELECT 
  occupation,
  COUNT(*) AS count_occupation
FROM customers
GROUP BY occupation
ORDER BY count_occupation DESC
LIMIT 10;

-- 10. Total complaints received.

SELECT 
  ROUND(SUM("Complaint Rate")) AS total_complaints
FROM customers;

-- 11. Highest customer income.

SELECT 
  ROUND(MAX(REPLACE(REPLACE("Income", '$', ''), ',', '')::NUMERIC),2) AS max_income
FROM customers;

-- 12. Lowest customer income.

SELECT 
  ROUND(MIN(REPLACE(REPLACE("Income", '$', ''), ',', '')::NUMERIC),2) AS min_income
FROM customers;

-- 13. Overall churn rate.

SELECT 
  ROUND(100.0 * COUNT(*) FILTER (WHERE "Churn Status" = 'Churned') / COUNT(*), 2) AS churn_rate_percentage
FROM customers;

-- 14. Average income by age group.

SELECT 
  "Age Group", 
  ROUND(AVG(REPLACE(REPLACE("Income", '$', ''), ',', '')::NUMERIC), 0) AS avg_income
FROM customers
GROUP BY "Age Group";

-- 15. Gender-wise churn rate.

SELECT 
  Gender,
  ROUND(100.0 * COUNT(*) FILTER (WHERE "Churn Status" = 'Churned') / COUNT(*), 2) AS churn_rate_percentage
FROM customers
GROUP BY Gender;

-- 16. Churn rate by marital status.

SELECT 
  "Marital Status",
  ROUND(100.0 * COUNT(*) FILTER (WHERE "Churn Status" = 'Churned') / COUNT(*), 2) AS churn_rate_percentage
FROM customers
GROUP BY "Marital Status";

-- 17. Distribution across risk levels.

SELECT 
  "Risk Indicator", 
  COUNT(*) AS customer_count
FROM customers
GROUP BY "Risk Indicator";

-- 18. Generate a Report that shows all key business metrics.

SELECT 'Total Customers' AS measure_name, COUNT(customerid) AS measure_value 
FROM customers
UNION ALL
SELECT 'Total Complaint Rate' , ROUND(SUM("Complaint Rate"))   
FROM customers
UNION ALL
SELECT 'Average Income', ROUND(AVG(REPLACE(REPLACE("Income", '$', ''), ',', '')::NUMERIC), 0) 
FROM customers
UNION ALL
SELECT 'Average Credit Score', ROUND(AVG("Credit Score"),2)
FROM customers
UNION ALL
SELECT 'Overall Churn Rate', ROUND(100.0 * COUNT(*) FILTER (WHERE "Churn Status" = 'Churned') / COUNT(*), 2)
FROM customers;

-- 19. Churn across occupations.

SELECT 
  occupation,
  ROUND(100.0 * COUNT(*) FILTER (WHERE "Churn Status" = 'Churned') / COUNT(*), 2) AS churn_rate_percentage
FROM customers
GROUP BY occupation
ORDER BY churn_rate_percentage DESC;

-- 20. Impact of number of products on churn.

SELECT 
  "Num of Products",
  ROUND(100.0 * COUNT(*) FILTER (WHERE "Churn Status" = 'Churned') / COUNT(*), 2) AS churn_rate_percentage
FROM customers
GROUP BY "Num of Products"
ORDER BY "Num of Products";

-- 21. Avg credit score of churned vs active customers.

SELECT 
  "Churn Status",
  ROUND(AVG("Credit Score"),2) AS avg_credit_score
FROM customers
GROUP BY "Churn Status";

-- 22. Balance-Income ratio category vs churn.

SELECT 
  "Balance-Income Ratio Category",
  ROUND(100.0 * COUNT(*) FILTER (WHERE "Churn Status" = 'Churned') / COUNT(*), 2) AS churn_rate_percentage
FROM customers
GROUP BY "Balance-Income Ratio Category"
ORDER BY churn_rate_percentage DESC;

-- 23. Complaint rate among churned vs active.

SELECT 
  "Churn Status",
  ROUND(AVG("Complaint Rate")::NUMERIC, 1) AS avg_complaint_rate
FROM customers
GROUP BY "Churn Status";

-- 24. Age group + Risk level vulnerable to churn.

SELECT 
  "Age Group",
  "Risk Indicator",
  ROUND(100.0 * COUNT(*) FILTER (WHERE "Churn Status" = 'Churned') / COUNT(*), 2) AS churn_rate_percentage
FROM customers
GROUP BY 
	"Age Group", 
	"Risk Indicator"
ORDER BY churn_rate_percentage DESC;

-- 25. Churn trend by balance-income ratio.

SELECT 
  "Balance-Income Ratio Category",
  COUNT(*) AS total_customers,
  COUNT(*) FILTER (WHERE "Churn Status" = 'Churned') AS churned_customers,
  ROUND(100.0 * COUNT(*) FILTER (WHERE "Churn Status" = 'Churned') / COUNT(*), 2) AS churn_rate_percentage
FROM customers
GROUP BY "Balance-Income Ratio Category"
ORDER BY churn_rate_percentage DESC;

-- 26. Credit utilization vs churn.

SELECT 
  "Churn Status",
  ROUND(AVG(REPLACE("Credit Utilization Ratio", '%', '')::NUMERIC), 2) AS avg_credit_utilization
FROM customers
GROUP BY "Churn Status";

-- 27. Loan-to-income ratio impact.

SELECT 
  "Churn Status",
  ROUND(AVG(REPLACE(REPLACE("Loan to Income Ratio", '$', ''), ',', '')::NUMERIC),2) AS avg_loan_income_ratio
FROM customers
GROUP BY "Churn Status";

-- 28. Income bracket and churn.

SELECT 
  CASE 
      WHEN REPLACE(REPLACE("Income", '$', ''), ',', '')::NUMERIC < 30000 THEN 'Low Income'
      WHEN REPLACE(REPLACE("Income", '$', ''), ',', '')::NUMERIC BETWEEN 30000 AND 70000 THEN 'Middle Income'
      ELSE 'High Income'
  END AS income_bracket,
  ROUND(100.0 * COUNT(*) FILTER (WHERE "Churn Status" = 'Churned') / COUNT(*), 2) AS churn_rate_percentage
FROM customers
GROUP BY income_bracket
ORDER BY churn_rate_percentage DESC;

-- 29. High complaint rate and churn.

SELECT 
  CASE 
  	  WHEN "Complaint Rate" > 1 THEN 'High Complaints' 
	  ELSE 'Low Complaints' 
  END AS complaint_level,
  "Churn Status",
  COUNT(*)
FROM customers
GROUP BY complaint_level, "Churn Status";

-- 30. Dependents influence churn.

SELECT 
  "Number of Dependents",
  ROUND(100.0 * COUNT(*) FILTER (WHERE "Churn Status" = 'Churned') / COUNT(*), 2) AS churn_rate_percentage
FROM customers
GROUP BY "Number of Dependents"
ORDER BY "Number of Dependents";

-- 31. Avg balance of churned vs active customers across risk categories.

SELECT 
  "Risk Indicator",
  "Churn Status",
  ROUND(AVG(REPLACE(REPLACE("Balance", '$', ''), ',', '')::NUMERIC), 2) AS avg_balance
FROM customers
GROUP BY "Risk Indicator", "Churn Status"
ORDER BY avg_balance DESC;

-- 32. Complaints vs Credit Score for churned customers.

SELECT 
  "Credit Score",
  "Complaint Rate"
FROM customers
WHERE "Churn Status" = 'Churned'
ORDER BY "Credit Score" DESC;

-- 33. Most profitable and loyal customer cluster.

SELECT 
  "Age Group",
  "Marital Status",
  occupation,
  "Risk Indicator",
  AVG(REPLACE(REPLACE("Income", '$', ''), ',', '')::NUMERIC) AS avg_income,
  ROUND(100.0 * COUNT(*) FILTER (WHERE "Churn Status" = 'Churned') / COUNT(*), 2) AS churn_rate_percentage
FROM customers
GROUP BY 
	"Age Group", 
	"Marital Status", 
	occupation,
	"Risk Indicator"
ORDER BY 
	avg_income DESC, 
	churn_rate_percentage ASC;
