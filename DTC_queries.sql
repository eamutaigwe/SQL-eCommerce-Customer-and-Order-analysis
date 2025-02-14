-- Create 'customer' table
CREATE TABLE customer (
	customer_id VARCHAR,
	customer_name VARCHAR,
	segment VARCHAR,
	age INT,
	country VARCHAR,
	city VARCHAR,
	state VARCHAR,
	postal_code INT,
	region VARCHAR
);

-- Load data and populate the customer table
copy customer
from '/Library/PostgreSQL/customer.csv' delimiter ',' csv header;


-- select all columns to ensure the column values have been added
SELECT *
FROM customer;


--- select customers with IDs starting with an "A" to verify the data
SELECT *
FROM customer
WHERE customer_id LIKE 'A%';


-- Create 'sales' table
CREATE TABLE sales (
	order_id VARCHAR,
	order_date DATE,
	ship_date DATE,
	ship_mode VARCHAR,
	customer_id VARCHAR,
	product_id VARCHAR,
	sales NUMERIC,
	quantity INT,
	discount NUMERIC,
	profit NUMERIC
);

-- Load data and populate the sales table
copy sales
from '/Library/PostgreSQL/sales.csv' delimiter ',' csv header;


-- select all columns to ensure the column values have been added
SELECT *
FROM sales;


--- select sales with shipping mode as "Second Class"
SELECT *
FROM sales
WHERE ship_mode = 'Second Class'
	AND sales > 200
LIMIT 10;


-- Create 'product' table
CREATE TABLE product (
	product_id VARCHAR,
	category VARCHAR,
	sub_category VARCHAR,
	product_name VARCHAR
);

-- Load data and populate the product table
copy product
from '/Library/PostgreSQL/product.csv' delimiter ',' csv header;


-- select all columns to ensure the column values have been added
SELECT *
FROM product;


--- select products in the "Office Supplies" category to verify the data
SELECT *
FROM product
WHERE category = 'Office Supplies';