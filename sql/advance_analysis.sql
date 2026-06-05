USE eCommerce;

-- =====================================================
-- ADVANCED RETAIL ANALYTICS
-- =====================================================

-- =====================================================
-- 1. HIGH-VALUE CUSTOMERS (PARETO ANALYSIS)
-- =====================================================

SELECT
    customer_id,
    SUM(total_amount) AS revenue
FROM retail_sales
GROUP BY customer_id
ORDER BY revenue DESC;

-- =====================================================
-- 2. ONE-TIME VS REPEAT CUSTOMERS
-- =====================================================

SELECT
    CASE
        WHEN order_count = 1 THEN 'One-Time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS customers
FROM (
    SELECT
        customer_id,
        COUNT(*) AS order_count
    FROM retail_sales
    GROUP BY customer_id
) x
GROUP BY customer_type;

-- =====================================================
-- 3. AVERAGE QUANTITY PER ORDER
-- =====================================================

SELECT
    AVG(quantity) AS avg_quantity
FROM retail_sales;

-- =====================================================
-- 4. REVENUE BY BASKET SIZE
-- =====================================================

SELECT
    quantity,
    SUM(total_amount) AS revenue
FROM retail_sales
GROUP BY quantity
ORDER BY quantity;

-- =====================================================
-- 5. REVENUE BY AGE GROUP AND GENDER
-- =====================================================

SELECT
    gender,

    CASE
        WHEN age < 25 THEN '18-24'
        WHEN age < 35 THEN '25-34'
        WHEN age < 45 THEN '35-44'
        ELSE '45+'
    END AS age_group,

    SUM(total_amount) AS revenue

FROM retail_sales
GROUP BY gender, age_group;

-- =====================================================
-- 6. AVERAGE SPEND PER AGE GROUP
-- =====================================================

SELECT
    CASE
        WHEN age < 25 THEN '18-24'
        WHEN age < 35 THEN '25-34'
        WHEN age < 45 THEN '35-44'
        ELSE '45+'
    END AS age_group,

    AVG(total_amount) AS avg_spend

FROM retail_sales
GROUP BY age_group;

-- =====================================================
-- 7. CATEGORY REVENUE CONTRIBUTION (%)
-- =====================================================

SELECT
    product_category,

    ROUND(
        SUM(total_amount) * 100 /
        (SELECT SUM(total_amount)
         FROM retail_sales),
         2
    ) AS contribution_pct

FROM retail_sales
GROUP BY product_category
ORDER BY contribution_pct DESC;

-- =====================================================
-- 8. CATEGORY PERFORMANCE BY MONTH
-- =====================================================

SELECT
    YEAR(transaction_date) AS year,
    MONTH(transaction_date) AS month,
    product_category,
    SUM(total_amount) AS revenue

FROM retail_sales
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date),
    product_category

ORDER BY year, month;

-- =====================================================
-- 9. TOP 10 HIGHEST VALUE TRANSACTIONS
-- =====================================================

SELECT *
FROM retail_sales
ORDER BY total_amount DESC
LIMIT 10;

-- =====================================================
-- 10. REVENUE DISTRIBUTION BUCKETS
-- =====================================================

SELECT

    CASE
        WHEN total_amount < 100 THEN '0-100'
        WHEN total_amount < 500 THEN '100-500'
        ELSE '500+'
    END AS revenue_bucket,

    COUNT(*) AS transactions

FROM retail_sales
GROUP BY revenue_bucket;

-- =====================================================
-- 11. TRANSACTION VALUE STATISTICS
-- =====================================================

SELECT
    AVG(total_amount) AS avg_sales,
    STDDEV(total_amount) AS std_sales,
    MIN(total_amount) AS min_sales,
    MAX(total_amount) AS max_sales
FROM retail_sales;

-- =====================================================
-- 12. OUTLIER TRANSACTIONS
-- =====================================================

SELECT *
FROM retail_sales
WHERE total_amount >
(
    SELECT
        AVG(total_amount)
        + 2 * STDDEV(total_amount)
    FROM retail_sales
);

-- =====================================================
-- 13. CUSTOMER LIFETIME VALUE (CLV)
-- =====================================================

SELECT
    customer_id,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS lifetime_value

FROM retail_sales
GROUP BY customer_id
ORDER BY lifetime_value DESC;

-- =====================================================
-- 14. RFM ANALYSIS
-- =====================================================

SELECT
    customer_id,

    DATEDIFF(
        MAX(transaction_date),
        MIN(transaction_date)
    ) AS recency,

    COUNT(*) AS frequency,

    SUM(total_amount) AS monetary

FROM retail_sales
GROUP BY customer_id;

-- =====================================================
-- 15. DATA FRESHNESS CHECK
-- =====================================================

SELECT
    MIN(transaction_date) AS oldest_record,
    MAX(transaction_date) AS latest_record
FROM retail_sales;

-- =====================================================
-- 16. DATA COMPLETENESS CHECK
-- =====================================================

SELECT
    ROUND(
        COUNT(customer_id) * 100.0 /
        COUNT(*),
        2
    ) AS completeness_percentage
FROM retail_sales;
