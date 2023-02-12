-- Create DB
CREATE DATABASE customer_spending_db;

-- connect to DB
\c customer_spending_db;

-- Create Customer Spending tables
CREATE TABLE customer_spending (
  date DATE,
  year INT,
  month VARCHAR(20),
  customer_age INT,
  customer_gender CHAR(1),
  country VARCHAR(40),
  state VARCHAR(40),
  product_category VARCHAR(40),
  sub_category VARCHAR(40),
  quantity INT,
  unit_cost DECIMAL(10,2),
  unit_price DECIMAL(10,6),
  cost DECIMAL(10,2),
  revenue DECIMAL(10,2)
);

-- Copy data from the CSV file
COPY customer_spending FROM 'd:\customer_spending.csv' WITH (FORMAT csv, HEADER true);

-- Verify data copied: 34866 records
SELECT * FROM customer_spending;

-- Q1
SELECT product_category, SUM(revenue) as total_revenue
FROM customer_spending
WHERE year = 2016
GROUP BY product_category
ORDER BY product_category;

	
-- Q2
SELECT sub_category, 
  AVG(unit_price) as avg_unit_price, 
  AVG(unit_cost) as avg_unit_cost, 
  AVG(unit_price) - AVG(unit_cost) as margin
FROM customer_spending
WHERE year = 2015
GROUP BY sub_category
ORDER BY sub_category;


-- Q3
SELECT COUNT(*) as total_female_buyers
FROM customer_spending
WHERE customer_gender = 'F' AND product_category = 'Clothing';


-- Q4
SELECT customer_age, 
  sub_category, 
  AVG(quantity) as average_quantity, 
  AVG(cost) as average_cost
FROM customer_spending
GROUP BY customer_age, sub_category
ORDER BY customer_age DESC, sub_category ASC;


-- Q5
SELECT country
FROM customer_spending
WHERE customer_age BETWEEN 18 AND 25
GROUP BY country
HAVING COUNT(*) > 30;


-- Q6
SELECT 
  sub_category, 
  ROUND(AVG(quantity), 2) as avg_quantity, 
  ROUND(AVG(cost), 2) as avg_cost
FROM customer_spending
GROUP BY sub_category
HAVING COUNT(*) >= 10
ORDER BY sub_category ASC;

