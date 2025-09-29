-- SQL Retail sales analysis
CREATE DATABASE IF NOT EXISTS sql_project;

-- Using the database
USE sql_project;

-- Create TABLE
DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales(
transaction_id INT PRIMARY KEY,
sale_date DATE,
sale_time TIME,
customer_id INT,
gender VARCHAR(15),
age INT,
category VARCHAR(15), 
quantity INT,
price_per_unit FLOAT,
cogs FLOAT,
total_sale FLOAT
);

-- Importing the data
-- Change tha path to your downloaded dataset path
LOAD DATA LOCAL INFILE '/media/abanoub/Storage/My-Github/Retail-Sales-Analysis/Dataset/SQL-Retail-Sales-Analysis_utf.csv'
INTO TABLE retail_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(transaction_id, sale_date, sale_time, customer_id, gender, age, category, quantity, price_per_unit, cogs, total_sale);


SELECT *
FROM retail_sales
LIMIT 10;

SELECT 
	COUNT(*)
FROM retail_sales;

-- Checking null values
SELECT  *
FROM retail_sales
WHERE transaction_id IS NULL
	OR sale_date IS NULL
	OR sale_time IS NULL
	OR customer_id IS NULL
	OR gender IS NULL
	OR age IS NULL
	OR category IS NULL
	OR quantity IS NULL
	OR price_per_unit IS NULL
	OR cogs IS NULL
	OR total_sale IS NULL;

-- Data Exploration
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

-- How many sales we have?
SELECT 
	COUNT(*) AS Total_Sales
FROM retail_sales;

-- How many unique customers we have?
SELECT 
	COUNT(DISTINCT customer_id) AS Total_Customers
FROM retail_sales;


-- My analysis and findings

-- 1- Sales made on 2022-11-05
SELECT 
	*
FROM retail_sales
WHERE sale_date = '2022-11-05';

-- 2- Transactions where  the category is 'clothing' 
-- and quantity sold is or more than 4 in the month pf Nov-2022
SELECT 
	*
FROM retail_sales
WHERE category = 'Clothing'
	AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
	AND quantity >= 4;

-- 3- Total sales And orders for each category

SELECT 
	Category,
	SUM(total_sale) AS Total_Sales,
	COUNT(*) AS Total_Orders
FROM retail_sales
GROUP BY Category;
	

-- 4- Average age of customers who purchased from beauty category

SELECT 
	ROUND(AVG(age), 2) AS Average_Age
FROM retail_sales
WHERE Category = 'Beauty';


-- 5- Transactions where sales > 1000

SELECT 
	*
FROM retail_sales
WHERE total_sale > 1000;


-- 6- Transactions made by each gender in each category

SELECT 
	COUNT(transaction_id) AS Number_of_transactions,
	Category,
	gender
FROM retail_sales
GROUP BY Category, gender
ORDER BY 1 DESC;


-- 7- Best selling month in each year

SELECT *
FROM
(
	SELECT
		EXTRACT(YEAR FROM sale_date) AS year,
		EXTRACT(MONTH FROM sale_date) AS month,
		AVG(total_sale) AS avg_sale,
		RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS rnk
	FROM retail_sales
	GROUP BY 1, 2
) t1
WHERE rnk = 1;


-- 8- Top 5 based on highest total sales

SELECT
	customer_id,
	SUM(total_sale) AS Total_Sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;


-- 9- Number of unique customer who purchase from each category

SELECT 
	category,
	COUNT(DISTINCT customer_id) AS Number_of_customers
FROM retail_sales
GROUP BY category;

-- 10- 










