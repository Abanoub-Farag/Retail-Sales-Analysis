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
LOAD DATA LOCAL INFILE '/media/abanoub/Storage/My-Github/Retail-Sales-Analysis-SQL/Dataset/SQL-Retail-Sales-Analysis_utf.csv'
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

-- 3- 

















