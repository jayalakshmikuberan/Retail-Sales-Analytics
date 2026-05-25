# Retail-Sales-Analytics

Ongoing collaborative internship project focused on retail sales analytics, business reporting, and customer trend analysis using **SQL** and **Power BI**.

## SQL scripts (branch: `feature/sql-analysis`)

All SQL assets live in the [`sql/`](./sql) folder. These scripts help you create the database schema and generate insights for reporting.

### 1) `sql/ddl.sql` — Database & table setup

**Use case:** Create the `eCommerce` database, define the `retail_sales` table, and add indexes to improve query performance.

**What it includes**
- Database creation and selection (`CREATE DATABASE eCommerce; USE eCommerce;`)
- Table definition for `retail_sales` (transactions, customer demographics, product category, quantity, pricing)
- Basic data-quality constraints (e.g., non-negative age, positive quantity)
- Indexes on commonly filtered/grouped columns (`customer_id`, `product_category`, `transaction_date`)

### 2) `sql/sales_analysis.sql` — Sales KPIs & time trends

**Use case:** Produce high-level sales metrics used in dashboards and reports.

**Key queries**
- Total revenue (`SUM(total_amount)`)
- Category distribution (record counts per `product_category`)
- Top-selling category by quantity
- Monthly revenue trend (`YEAR(transaction_date)`, `MONTH(transaction_date)`)
- Average order value (AOV)
- Highest-value transaction
- Daily sales trend

### 3) `sql/product_analysis.sql` — Product/category performance

**Use case:** Understand which product categories drive revenue and volume, and analyze pricing patterns.

**Key queries**
- Total revenue per category
- Best-selling category by revenue
- Best-selling category by quantity
- Average unit price per category
- Most expensive item (max unit price) per category

### 4) `sql/customer_analysis.sql` — Customer segmentation & behavior

**Use case:** Analyze customer count, spend, frequency, and demographic breakdowns for segmentation.

**Key queries**
- Total unique customers (overall and by category)
- Top spending customers
- Average spending per customer
- Most frequent customers (purchase count)
- Gender-based customer counts and spending
- Age-group distribution and spend (Under 25, 25–34, 35–44, 45–54, 55+)

## Suggested run order

1. Run `sql/ddl.sql` to create the database schema.
2. Load/import your retail sales dataset into the `retail_sales` table.
3. Run the analysis scripts depending on the insights needed:
   - `sales_analysis.sql` for revenue and time-series KPIs
   - `product_analysis.sql` for category performance
   - `customer_analysis.sql` for customer trends and segmentation
