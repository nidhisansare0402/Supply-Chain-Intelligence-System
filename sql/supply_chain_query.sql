-- DATABASE creation --
CREATE DATABASE supply_chain;
USE supply_chain;
SHOW SCHEMAS;

-- Table creation --
CREATE TABLE orders(
	order_id VARCHAR(50),
    cust_id VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    date DATE,
    status VARCHAR(20),
    channel VARCHAR(20),
    sku VARCHAR(100),
    category VARCHAR(50),
    size VARCHAR(10),
    quantity INT,
    currency VARCHAR(10),
    amount DECIMAL(10,2),
    ship_city VARCHAR(50),
    ship_pin_code VARCHAR(10),
    ship_country VARCHAR(10),
    b2b BOOLEAN,
    month VARCHAR(20),
    year INT,
    revenue_bucket VARCHAR(10),
    cust_type VARCHAR(20)
);

-- Data Inmport --
-- This ProgramData folder is hidden. Paste path directly in address bar and move the dataset csv--
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders_data.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'secure_file_priv';

-- Data Validation --
SELECT COUNT(*) FROM orders;

SELECT * FROM orders
LIMIT 10;

SELECT MIN(date) , MAX(date) FROM orders;

-- I notice the incorrect count after importing the data as i imported multiple times --
SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT order_id) AS unique_orders
FROM orders;

SELECT order_id, COUNT(*) AS count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Droping the table as duplicates noticed -- 
DROP TABLE orders;

-- Total Revenue --
SELECT ROUND(SUM(amount),2) AS total_revenue
FROM orders;

-- Total orders --
SELECT COUNT(*) AS total_orders
FROM orders;

-- Monthly sales trend (It shows which month performs best)--
SELECT month, SUM(amount) AS revenue
FROM orders
GROUP BY month
ORDER BY revenue DESC;

-- Top selling categories (It shows which product to stock more) -- 
SELECT category, SUM(amount) AS revenue
FROM orders
GROUP BY category
ORDER BY revenue DESC;

-- Top Categories by Quantity
SELECT category, SUM(quantity) AS total_qty
FROM orders
GROUP BY category
ORDER BY total_qty DESC;
-- SET is Fast-moving product

-- Top cities (Which city shows higher demand)--
SELECT ship_city, COUNT(order_id) AS orders
FROM orders
GROUP BY ship_city
ORDER BY orders DESC
LIMIT 10;

-- Order status Analysis --
SELECT status, COUNT(*) AS total_orders
FROM orders
GROUP BY status;

-- Channel performance --
SELECT channel, SUM(amount) AS revenue
FROM orders
GROUP BY channel
ORDER BY revenue DESC;

-- Customer Type Analysis --
SELECT cust_type, COUNT(*) AS total_orders
FROM orders
GROUP BY cust_type;

-- High vs Low revenue orders --
SELECT revenue_bucket, COUNT(*) AS total_orders
FROM orders
GROUP BY revenue_bucket
ORDER BY total_orders DESC;

-- Repeat customers --
SELECT cust_id, COUNT(*) AS total_orders
FROM orders
GROUP BY cust_id
HAVING COUNT(*) > 1
ORDER BY total_orders DESC;

-- Average order value --
SELECT ROUND(AVG(amount),2) AS avg_order_value
FROM orders;

-- Demand & Product Insights 
-- 1. Which product categories generate the highest revenue?
SELECT category, ROUND(SUM(amount),2) AS revenue
FROM orders
GROUP BY category
ORDER BY revenue DESC;
-- Shows top-performing categories

-- 2. Which categories have the highest order volume?
SELECT category, COUNT(*) AS volume
FROM orders
GROUP BY category
ORDER BY volume DESC;
-- SET category has the highest order volume

-- 3. What is the monthly demand trend?
SELECT month, COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY total_orders DESC;
-- March has the highest demand of orders

-- 4. Total orders fall into high vs low revenue buckets?
SELECT revenue_bucket, COUNT(*) AS total_orders
FROM orders
GROUP BY revenue_bucket;

-- 5. Which size is most frequently ordered?
SELECT size, COUNT(*) AS orders
FROM orders
GROUP BY size
ORDER BY orders DESC;
-- M size is most frequently ordered

-- Geographic demand analysis
-- 6. Which cities generate the highest revenue?
SELECT ship_city, SUM(amount) AS revenue
FROM orders
GROUP BY ship_city
ORDER BY revenue DESC;
-- BENGALURU and HYDERABAD generate the highest revenue

-- 7. Which regions have low demand?
SELECT ship_city, COUNT(*) AS orders
FROM orders
GROUP BY ship_city
ORDER BY orders;

-- 8. How is demand distributed across different locations?
SELECT ship_city, COUNT(*) AS total_orders
FROM orders
GROUP BY ship_city
ORDER BY total_orders DESC;

-- Channel Performance
-- 9. Which sales channel generates the most revenue?
SELECT channel, SUM(amount) AS revenue
FROM orders
GROUP BY channel
ORDER BY revenue DESC;

-- 10. Which channel has the highest order volume?
SELECT channel, COUNT(*) AS orders
FROM orders
GROUP BY channel
ORDER BY orders DESC;

-- 11. What is the average order value by channel?
SELECT channel, ROUND(AVG(amount),2) AS avg_value
FROM orders
GROUP BY channel
ORDER BY avg_value DESC;

-- Customer Behaviour Analysis
-- 12. What percentage of customers are repeat customers?
SELECT 
	ROUND(
		SUM(CASE WHEN total_orders >= 2 THEN 1 ELSE 0 END) * 100.0 /
		COUNT(*), 2
	) AS repeat_cust_perc
FROM (
	SELECT cust_id, COUNT(*) AS total_orders
	FROM orders
	GROUP BY cust_id
) AS cust_orders;

-- 13. Who are the top customers by revenue?
SELECT cust_id, SUM(amount) AS revenue
FROM orders
GROUP BY cust_id
ORDER BY revenue DESC
LIMIT 10;

-- 14. What is the average order value per customer?
SELECT cust_id, ROUND(AVG(amount),2) AS avg_order_value
FROM orders
GROUP BY cust_id;

-- 15. How does customer type (B2B vs B2C) impact revenue?
SELECT cust_type, SUM(amount) AS revenue
FROM orders
GROUP BY cust_type;

-- Operational signals
-- 16. What is the distribution of order status?
SELECT status, COUNT(*) AS orders
FROM orders
GROUP BY status; 

-- 17. Which categories have the highest cancellations/refunds?
SELECT category, COUNT(*) AS cancelled_orders
FROM orders
WHERE status != 'DELIVERED'
GROUP BY category
ORDER BY cancelled_orders DESC;

-- 18. Which regions have more cancelled/refunded orders?
SELECT ship_city, COUNT(*) AS cancelled_orders
FROM orders
WHERE status != 'DELIVERED'
GROUP BY ship_city
ORDER BY cancelled_orders DESC;

-- 19. Identify top 5 cities contributing to 50% of revenue
SELECT ship_city, SUM(amount) AS revenue
FROM orders
GROUP BY ship_city
ORDER BY revenue DESC
LIMIT 5;

-- 20. Which category contributes most to total revenue percentage?
SELECT category,
       ROUND(SUM(amount) * 100.0 / (SELECT SUM(amount) FROM orders),2) AS contribution_percent
FROM orders
GROUP BY category
ORDER BY contribution_percent DESC;

-- 21. Segment customers into high, medium, low spenders
SELECT cust_id,
       CASE 
           WHEN SUM(amount) > 1000 THEN 'HIGH'
           WHEN SUM(amount) BETWEEN 500 AND 1000 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS customer_segment
FROM orders
GROUP BY cust_id;

