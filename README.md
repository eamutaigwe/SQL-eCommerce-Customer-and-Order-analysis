**SQL-eCommerce-Customer-and-Order-analysis**

**Background**

E-commerce companies utilize insights from historical transactional data to make informed business decisions that drive sales, increase revenue, and grow their businesses overall.

**Goal**

To execute an end-to-end data analytics project using e-commerce/retail datasets, including an ETL (extract, transform and load) process followed by building data models and interactive dashboards to provide actionable insights into key indicators driving revenue, profit and overall business performance and growth, and generating a report for presentation.

**Methodology**

**Data Source**

I extracted Customer, Sales, and Product datasets from a PostgreSQL database using SQL queries. 

**Folders and Files in the Repository**

There is a README.md file which summarizes the project goals, data tables and methodology, results, insights and recommendations.

1. The `data` folder contains the three datasets used in the analysis
+ `customer.csv`
+ `sales.csv`
+ `product.csv`

2. The `images` folder contains the following:
+ `Entity-Relationship Diagram` I generated to direct the relationship among the tables
+  Four `Power BI Dashboard solutions` I built to visualize and communicate relevant KPIs

3. The `merge_tables_for_PowerBI.sql` file contains the SQL queries I used to prepare the three tables for analysis with Power BI.

**Data processing**

1. I uploaded the extracted data tables to Power BI and cleaned these up by changing data fields to the correct data types and ensuring there were no missing data.

2. Next, I generated KPIs and secondary metrics using DAX functions and measures.

3. Finally, I created appropriate charts and graphs representing KPIs and other relevant metrics and projected these using interactive dashboard solutions.
