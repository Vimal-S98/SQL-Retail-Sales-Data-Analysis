# SQL Retail Sales Data Analysis

## Overview
This project analyzes a retail sales dataset using SQL.  
The goal was to clean the data and answer common business questions such as:
- How many sales and customers are there?
- Which categories perform best?
- Who are the top customers?
- What are the peak sales periods?

This project helped me practice SQL concepts like:
- Data cleaning
- Aggregate functions
- Grouping and filtering
- Window functions

---

## Tools & Skills Used
- **SQL** (PostgreSQL syntax)
- Data Cleaning
- Exploratory Data Analysis (EDA)
- Business Query Writing

---

## Dataset
The dataset contains retail sales information with the following columns:
- `transactions_id` – Unique ID for each transaction  
- `sale_date`, `sale_time` – Date and time of the sale  
- `customer_id`, `gender`, `age` – Customer details  
- `category` – Product category (Clothing, Beauty, etc.)  
- `quantity`, `price_per_unit`, `cogs`, `total_sale` – Sales details  

---

## Key Analysis Performed
1. Checked and removed null values.  
2. Counted total sales, customers, and product categories.  
3. Retrieved sales made on a specific date.  
4. Filtered transactions based on category and quantity.  
5. Calculated total and average sales per category.  
6. Found the average age of customers buying Beauty products.  
7. Identified transactions with sales above 1000.  
8. Counted sales by gender across categories.  
9. Found the best-selling month each year.  
10. Listed top 5 customers by total purchase value.  
11. Counted unique customers per category.  
12. Divided sales into shifts (Morning, Afternoon, Evening).  

---

## Sample Insights
- Found the **top-selling categories** by total revenue.  
- Identified the **best month** for sales each year.  
- Highlighted the **top 5 customers** contributing the most to revenue.  
- Observed sales patterns by **shift of the day**.  
