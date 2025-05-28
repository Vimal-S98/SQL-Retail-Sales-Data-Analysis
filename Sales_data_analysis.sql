-- SALES DATA ANALYSIS SQL PROJECT --

-- CREATE DATABASE --
CREATE DATABASE SQL Retail Sales Analysis;

DROP TABLE IF EXISTS sales_data;

-- Create Table --
CREATE TABLE sales_data 
(
	transactions_id INT PRIMARY KEY,
	sale_date DATE, 	
	sale_time TIME,	
	customer_id	INT,
	gender VARCHAR(15),
	age INT,
	category VARCHAR(15),
	quantiy	INT,
	price_per_unit FLOAT,	
	cogs FLOAT,	
	total_sale FLOAT
);


-- DATA CLEANING --

SELECT * FROM sales_data
LIMIT 10;

SELECT COUNT(*) 
FROM sales_data;

-- Checking for null values (transactions_id column has no null as it is a primary key column)--  
SELECT * FROM sales_data
WHERE
	transactions_id IS NULL
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR
	customer_id IS NULL
	OR
	gender IS NULL
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantiy IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL;

-- DELETING ROWS WITH NULL VALUES --
DELETE FROM sales_data
WHERE
	transactions_id IS NULL
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR
	customer_id IS NULL
	OR
	gender IS NULL
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantiy IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL;


-- EDA --

-- How many sales we have ?
SELECT * FROM sales_data;

SELECT COUNT(total_sale) AS total_sales
FROM sales_data;

-- How many customers we have ?
SELECT COUNT(DISTINCT customer_id)
FROM sales_data;

-- How many categories we have ?
SELECT DISTINCT category
FROM sales_data;



-- Data Analysis - Business Problems and Answers --

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT * FROM sales_data
WHERE sale_date = '2022-11-05';


-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than or equal to 4 in the month of Nov-2022
SELECT * FROM sales_data
WHERE 
	category = 'Clothing'
	AND
	quantiy >= 4
	AND
	TO_CHAR(sale_date, 'YYYY-MM') = '2022-11';


-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT * FROM sales_data;

SELECT category, SUM(total_sale) AS total_sales, COUNT(*) AS total_orders
FROM sales_data
GROUP BY 1
ORDER BY 2 DESC;


-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT * FROM sales_data;

SELECT ROUND(AVG(age),2) AS avg_age
FROM sales_data
WHERE category = 'Beauty';


-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT * FROM sales_data;

SELECT * FROM sales_data
WHERE total_sale > 1000;


-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT * FROM sales_data;

SELECT category, gender, COUNT(transactions_id)
FROM sales_data
GROUP BY 2,1
ORDER BY 1;


-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT * FROM sales_data;

SELECT year, month, total_sales FROM
(
	SELECT 
		EXTRACT (YEAR FROM sale_date) AS year,
		EXTRACT (MONTH FROM sale_date) AS month,
		AVG(total_sale) AS total_sales,
		RANK() OVER(PARTITION BY EXTRACT (YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS rank
	FROM sales_data
	GROUP BY 1, 2
) AS t1
WHERE rank = 1;


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT * FROM sales_data;

SELECT customer_id, SUM(total_sale) AS total_sale_per_customer
FROM sales_data
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT * FROM sales_data;

SELECT 
	category,
	COUNT(DISTINCT customer_id) AS unique_customer_count
FROM sales_data
GROUP BY 1;


-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
SELECT * FROM sales_data;

SELECT EXTRACT(HOUR FROM CURRENT_TIME);

WITH hourly_sale
AS
(
SELECT *,
	CASE
		WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
		WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END AS shift
FROM sales_data)
SELECT shift, COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY 1
ORDER BY 2 DESC;


-- END OF PROJECT



























