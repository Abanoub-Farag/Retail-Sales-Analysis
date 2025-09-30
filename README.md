# 🛍️ Retail Sales Analysis (SQL Project)

## 📌 Overview
This project focuses on analyzing a retail sales dataset using **MySQL**.  
The goal is to explore the data, clean it, and extract useful business insights such as customer behavior, sales trends, and top-performing categories.

---

## 📂 Dataset
- **File:** `SQL-Retail-Sales-Analysis_utf.csv`  
- **Columns:**
  - `transaction_id` – Unique ID for each transaction  
  - `sale_date` – Date of transaction  
  - `sale_time` – Time of transaction  
  - `customer_id` – Unique customer ID  
  - `gender` – Gender of customer  
  - `age` – Age of customer  
  - `category` – Product category  
  - `quantity` – Units sold  
  - `price_per_unit` – Price of one unit  
  - `cogs` – Cost of goods sold  
  - `total_sale` – Final sale value  

---

## ⚙️ Tools & Technologies
- **Database:** MySQL  
- **Language:** SQL  
- **Environment:** DBeaver  

---

## 📊 Analysis Performed
1. **Data Cleaning & Exploration**
   - Checking for null/missing values
   - Counting unique customers and product categories

2. **Business Questions Answered**
   - Sales made on a specific date (e.g., `2022-11-05`)  
   - High-quantity clothing sales in November 2022  
   - Total sales and orders per category  
   - Average age of customers in the *Beauty* category  
   - Transactions with sales > 1000  
   - Sales by gender per category  
   - Best-selling month in each year  
   - Top 5 customers by total sales  
   - Number of unique customers per category  

---

## 📈 Key Findings
- **Clothing** and **Beauty** are high-performing categories.  
- Certain customers contribute significantly to overall revenue.  
- Best-selling months vary by year but show seasonal spikes.  
- Gender distribution shows insights into category preferences.  

---

## 🚀 How to Use
1. Clone the repository:  
   ```bash
   git clone https://github.com/Abanoub-Farag/Retail-Sales-Analysis.git

