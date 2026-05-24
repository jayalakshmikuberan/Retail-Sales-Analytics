-- =========================================

-- 1. Total Unique Customers

SELECT 
	COUNT(DISTINCT customer_id) as unique_customers
FROM retail_sales

-- 2. Total Unique Customers By Product Category
SELECT 
    product_category,
    COUNT(DISTINCT customer_id) as unique_customers
FROM retail_sales
GROUP BY product_category
ORDER BY unique_customers DESC

-- =========================================

-- 3. Top Spending Customers

SELECT TOP 10
    customer_id,
    SUM(total_amount) as total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC

-- =========================================

-- 4. Average Spending Per Customer

SELECT 
    customer_id,
    ROUND(AVG(total_amount), 2) as avg_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY avg_spent DESC

-- =========================================

-- 5. Most Frequent Customers

SELECT TOP 10
    customer_id,
    COUNT(*) as purchase_count
FROM retail_sales
GROUP BY customer_id
ORDER BY purchase_count DESC

-- =========================================

-- 6. Gender-Based Customer Analysis

SELECT 
    gender,
    COUNT(customer_id) as total_customers
FROM retail_sales
GROUP BY gender
ORDER BY total_customers DESC

-- =========================================

-- 7. Gender-Based Spending Analysis

SELECT
    gender,
    SUM(total_amount) as total_spent
FROM retail_sales
GROUP BY gender
ORDER BY total_spent DESC

-- =========================================

-- 8. Average Spending Per Gender

SELECT
    gender,
    ROUND(AVG(total_amount), 2) as avg_spent
FROM retail_sales
GROUP BY gender
ORDER BY avg_spent DESC

-- =========================================

-- 9. Age Group Analysis

SELECT
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 and over'
    END AS age_group,
    COUNT(customer_id) as total_customers
FROM retail_sales
GROUP BY
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 and over'
    END
ORDER BY total_customers DESC

-- =========================================

-- 10. Age Group Spending Analysis 

SELECT
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 and over'
    END AS age_group,
    SUM(total_amount) as total_spent
FROM retail_sales
GROUP BY
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 and over'
    END
ORDER BY total_spent DESC

-- =========================================

-- 11. Average Spending Per Age Group

SELECT
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 and over'
    END AS age_group,
    ROUND(AVG(total_amount), 2) as avg_spent
FROM retail_sales
GROUP BY
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 and over'
    END
ORDER BY avg_spent DESC
