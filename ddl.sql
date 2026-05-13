-- =========================================
-- DATABASE CREATION
-- =========================================

CREATE DATABASE eCommerce;

USE eCommerce;

-- =========================================
-- TABLE CREATION
-- =========================================

CREATE TABLE retail_sales (
    
    transaction_id INT PRIMARY KEY,
    
    transaction_date DATE NOT NULL,
    
    customer_id VARCHAR(20) NOT NULL,
    
    gender VARCHAR(10),
    
    age INT,
    
    product_category VARCHAR(50) NOT NULL,
    
    quantity INT NOT NULL,
    
    price_per_unit DECIMAL(10,2) NOT NULL,
    
    total_amount DECIMAL(10,2) NOT NULL,

    -- Constraints
    
    CHECK (age >= 0),
    
    CHECK (quantity > 0),
    
    CHECK (price_per_unit >= 0),
    
    CHECK (total_amount >= 0)
);

-- =========================================
-- INDEXES
-- =========================================

CREATE INDEX idx_customer_id
ON retail_sales(customer_id);

CREATE INDEX idx_product_category
ON retail_sales(product_category);

CREATE INDEX idx_transaction_date
ON retail_sales(transaction_date);