-- =========================================

-- 1.Sales by Day of Week

SELECT DATENAME(weekday,transaction_date) AS day_name,
       SUM(total_amount) AS revenue
FROM retail_sales
GROUP BY DATENAME(weekday,transaction_date);

-- =========================================

-- 2.Weekend vs Weekday Sales

SELECT
    CASE
        WHEN DATEPART(WEEKDAY,transaction_date) IN (1,7)
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,

    SUM(total_amount) AS revenue
FROM retail_sales
GROUP BY CASE
        WHEN DATEPART(WEEKDAY,transaction_date) IN (1,7)
        THEN 'Weekend'
        ELSE 'Weekday'
    END ;

-- =========================================

-- 3. Running Revenue Total

SELECT transaction_date,
       SUM(total_amount) AS daily_sales,

       SUM(SUM(total_amount))
       OVER (ORDER BY transaction_date) AS running_total
FROM retail_sales
GROUP BY transaction_date;

-- =========================================

-- 4. Monthly Sales Trends

SELECT MONTH(transaction_date) AS month,
       SUM(total_amount) AS monthly_revenue
FROM retail_sales
GROUP BY month
ORDER BY month;

-- =========================================

-- 5. Yearly Sales Trends

SELECT YEAR(transaction_date) AS year,
       SUM(total_amount) AS yearly_revenue
FROM retail_sales
GROUP BY year
ORDER BY year;
