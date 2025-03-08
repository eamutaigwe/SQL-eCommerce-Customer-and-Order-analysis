# SQL eCommerce Customer and Order analysis

## Background

E-commerce companies utilize insights from historical transactional data to make informed business decisions that drive sales, increase revenue, and grow their businesses overall.

## Goal

To write SQL queries to extract specific information on customers, their demographics and associated products ordered over a defined period to inform advertising campaign and investment efforts to drive revenue generation.

## Methodology

## Data Source

I extracted Customer, Sales, and Product datasets from a PostgreSQL database using SQL queries. 

## Folders and Files in the Repository

There is a README.md file which summarizes the project goals, data tables and methodology, results, insights and recommendations.

1. The `data` folder contains the three datasets used in the analysis:
+ `customer.csv`
+ `sales.csv`
+ `product.csv`
  
2. The `scripts` folder contains two SQL query files:
+ `DTC_queries.sql` which contains SQL queries I used to create and populate the customer, sales and product tables within the PostgreSQL database for analysis.
+ `eCommerce_KPI_analysis.sql` which contains SQL queries I generated to answer questions important for driving revenue growth and marketing efforts.

## Data processing

1. I wrote SQL queries to create customer, sales and product tables within the PostgreSQL database and populate them with records from `.csv` tables.

2. Next, I wrote SQL queries to answer key questions to better understand customer demographics and product order performance.

## Questions answered

+ **Q1:** What are the customer name, country, age and city for only customers that live in the state of California and are over 25 years for the consumer segment. Sort the result by age in ascending order.
+ **Q2:** Display the total count of customers by segment.
+ **Q3:** Write a query to categorize profits that are below 100 as Low Margin, within the range of 100 - 300 as Mid Margin then every other profit that doesn't fall in either of the categories as High for all orders purchased in 2016. Display the result for only the top 20.
+ **Q4:** Calculate the total sales for each region in the last 7 years.
+ **Q5:** What is the total number of orders that were not shipped with first class and standard class. Sort the result by the ship mode.
+ **Q6:** Write a query to show the ship mode, ship_date, total sales, profits and order quantity for all orders that were shipped the earliest.
+ **Q7:** Write a query that returns all the orders that are above 1000 in sales, from only first-class ship mode and are shipped between May and June 2015.
+ **Q8:** Write a query for the top 10 orders by fetching customer name, age, state, total sales, total profit, product category and subcategory for only orders placed in 2016 in all states excluding Florida & Utah.
+ **Q9:** Write a query to pull customer_id, age, city, sales, profits, ship mode and ship date of transactions purchased in 2017, for all states excluding California, New York and Texas, city does not include null and customer’s age group of 20-60. Sort the result in descending order.
+ **Q10:** Write a query to show the average age of customers, include their region and city and total number of orders for orders purchased in 2017, for all customers excluding customers in Texas. Sort by region.
+ **Q11:** Find the top 10 products with the highest profit in the last 6 years.
+ **Q12:** Get the top 10 best-selling products in the last 7 years.
