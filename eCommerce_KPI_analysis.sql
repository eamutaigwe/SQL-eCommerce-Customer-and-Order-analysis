-- SALES DATA PROJECT

-- Q1: What are the customer name, country, age and city for
-- only customers that live in the state of California and
-- are over 25 years for the consumer segment. Sort the
-- result by age in asc order.

-- I will first check the data in the tables to familiarize myself with the data.
SELECT * 
FROM customer;

SELECT * 
FROM product;

SELECT *
FROM sales;

-- I will then write the queries to answer the question.
SELECT
    customer_name,
    country,
    age,
    city
FROM customer
WHERE state = 'California'
AND age > 25
AND segment = 'Consumer'
ORDER BY age;

-- Q2: Display the total count of customers by segment?
SELECT 
    segment,
    COUNT (customer_id) AS total_customers
FROM customer
GROUP BY segment;

-- Q3: Write a query to categorize profits that are below 100 as
-- Low Margin, within the range of 100 - 300 as Mid Margin
-- then every other profit that doesn't fall in either of the
-- categories as High for all orders purchased in 2016.
-- Display the result for only the top 20

SELECT *,
CASE 
    WHEN profit < 100 THEN 'Low Margin'
    WHEN profit BETWEEN 100 AND 300 THEN 'Mid Margin'
    ELSE 'High Margin'
END AS profit_categories
FROM sales
WHERE EXTRACT(YEAR FROM order_date) = 2016
LIMIT 20;


-- Q4: Calculate the total sales for each region in the last
-- 7 years

SELECT 
	customer.region,
    ROUND(SUM(sales.sales), 0) AS total_sales
FROM customer 
INNER JOIN sales
ON customer.customer_id = sales.customer_id
WHERE sales.order_date >= (current_date - INTERVAL '7 years') -- order_date field has a 'date' type
GROUP BY customer.region;


-- Q5: What is the total number of orders that were not
-- shipped with first class and standard class. Sort the
-- result by the ship mode

SELECT 
	ship_mode,
	COUNT(order_id) AS total_orders
FROM sales
WHERE ship_mode NOT IN ('First Class', 'Standard Class')
GROUP BY ship_mode
ORDER BY ship_mode;


-- Q6: Write a query to show the ship mode, ship_date, total
-- sales, profits and order quantity for all orders that were
-- shipped the earliest.

SELECT 
	ship_mode,
    ship_date,
    SUM(sales) AS total_sales,
    profit,
    quantity
FROM sales
WHERE ship_date = (SELECT MIN(ship_date) FROM sales)
GROUP BY 1,2,4,5;


-- Q7: Write a query that returns all the orders that are above
-- 1000 in sales, from only first class ship mode and are
-- shipped between May and June 2015

SELECT 
    order_id,
	ship_mode,
	ship_date,
	sales
FROM sales
WHERE sales > 1000
AND ship_mode = 'First Class'
AND EXTRACT(MONTH FROM ship_date) IN (5,6)
AND EXTRACT(YEAR FROM ship_date) = 2015;


-- Q8: Write a query for the top 10 orders by fetching
--customer name, age, state, total sales, total profit,
--product category and sub category for only orders
--placed in 2016 in all states excluding Florida & Utah

SELECT 
	c.customer_name,
    c.age,
    c.state,
    SUM(s.sales) AS total_sales,
    SUM(s.profit) AS total_profit,
    p.category,
    p.sub_category
FROM customer AS c
INNER JOIN sales AS s
ON c.customer_id = s.customer_id
INNER JOIN product AS p
ON s.product_id = p.product_id
WHERE EXTRACT(YEAR FROM s.order_date) = 2016
AND c.state NOT IN ('Florida', 'Utah')
GROUP BY 1,2,3,6,7
ORDER BY 4 DESC
LIMIT 10;


-- Q9: Write a query to pull customer_id, age, city, sales,
-- profits, ship mode and ship date of transactions
-- purchased in 2017, for all states excluding California,
-- New York and texas, city does not include null and
-- customer’s age group of 20-60. Sort the result in
-- descending order.

SELECT
    c.customer_id,
    c.age,
    c.city,
    s.sales,
    s.profit,
    s.ship_mode,
    s.ship_date,
	s.order_date
FROM customer AS c
INNER JOIN sales AS s
ON c.customer_id = s.customer_id
WHERE EXTRACT(YEAR FROM s.order_date) = 2017
AND c.state NOT IN ('California', 'New York', 'Texas')
AND c.city IS NOT NULL
AND c.age BETWEEN 20 AND 60
ORDER BY c.age DESC;


-- Q10: Write a query to show the average age of customers,
-- include their region and city and total number of orders
-- for orders purchased in 2017 for all customers
-- excluding customers in Texas. Sort by region.


SELECT 
    c.customer_id,
    c.region,
    c.city,
    COUNT(s.quantity) AS total_quantity,
    (CAST(AVG(c.age) AS INTEGER)) AS avg_age -- Changing the data type removed the trailing zero decimal values.
FROM customer AS c
INNER JOIN sales AS s
ON c.customer_id = s.customer_id
WHERE EXTRACT(YEAR FROM s.order_date) = 2017
AND c.state != 'Texas'
GROUP BY 1,2,3
ORDER BY 2;


-- Q11: Find the top 10 products with the highest profit
-- in the last 6 years

SELECT 
    product_id,
    SUM(profit) AS total_profit,
    order_date -- This field may not be added if not needed
FROM sales
WHERE order_date >= (current_date - INTERVAL '6 years')
GROUP BY product_id,
ORDER BY total_profit DESC
LIMIT 10;


-- Q12: Get the top 10 best-selling products in the last 7 years
SELECT 
    product_id,
    SUM(quantity) AS total_quant -- I interpreted 'best selling' as total quantity sold
FROM sales
WHERE order_date >= (current_date - INTERVAL '7 years')
GROUP BY product_id
ORDER BY total_quant DESC
LIMIT 10;
