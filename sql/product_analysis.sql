-- =========================================

-- 1. Total Revenue Per Category

SELECT 
	product_category,
	SUM(total_amount) as total_per_cateogry
FROM retail_sales
GROUP BY product_category
ORDER BY total_per_cateogry DESC

-- =========================================

-- 2. Best Selling Product Category By Price

SELECT TOP 1
	product_category,
	SUM(total_amount) as revenue
FROM retail_sales
GROUP BY product_category
ORDER BY revenue DESC

-- =========================================

-- 3. Best Selling Product Category By Quantity

SELECT 
	TOP 1
	product_category,
	SUM(quantity) as quantity
FROM retail_sales
GROUP BY product_category
ORDER BY quantity DESC

-- =========================================

-- 4. Average Product Price By Category

SELECT 
	product_category,
	AVG(price_per_unit) as avg_price
FROM retail_sales
GROUP BY product_category
ORDER BY avg_price DESC

-- =========================================

-- 5. Most Expensive Product Per Category

SELECT product_category,
       MAX(price_per_unit) AS max_price
FROM retail_sales
GROUP BY product_category
ORDER BY max_price DESC;
