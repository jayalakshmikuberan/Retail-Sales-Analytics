USE eCommerce;

-- =========================================

-- 1. TOTAL REVENUE

SELECT SUM(total_amount) AS total_revenue
FROM retail_sales;

-- =========================================

-- 2. CATEGORY DISTRIBUTION

SELECT product_category,
       COUNT(*) AS total_records
FROM retail_sales
GROUP BY product_category;

-- =========================================

-- 3. TOP SELLING CATEGORY

SELECT product_category,
       SUM(quantity) AS total_quantity_sold
FROM retail_sales
GROUP BY product_category
ORDER BY total_quantity_sold DESC;

-- =========================================

-- 4. MONTHLY SALES ANALYSIS

SELECT YEAR(transaction_date) AS sales_year,
       MONTH(transaction_date) AS sales_month,
       SUM(total_amount) AS monthly_revenue
FROM retail_sales
GROUP BY YEAR(transaction_date),
         MONTH(transaction_date)
ORDER BY sales_year,
         sales_month;

-- =========================================

-- 5. Average Order Value (AOV)
SELECT AVG(total_amount) AS avg_order_value
FROM retail_sales;

-- =========================================

-- 6.Highest Sale Transaction
SELECT TOP 1 *
FROM retail_sales
ORDER BY total_amount DESC;

-- =========================================

-- 7.Daily Sales Trend

SELECT transaction_date,
       SUM(total_amount) AS daily_sales
FROM retail_sales
GROUP BY transaction_date
ORDER BY transaction_date;

-- =========================================
