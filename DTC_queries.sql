-- Create 'customer' table
create table customer (
	customer_id varchar,
	customer_name varchar,
	segment varchar,
	age int,
	country varchar,
	city varchar,
	state varchar,
	postal_code int,
	region varchar
);

-- select all columns
select *
from customer;


-- Load data and populate the customer table
copy customer
from '/Library/PostgreSQL/customer.csv' delimiter ',' csv header;


-- select all columns again to ensure the column values have been added
select *
from customer;


--- select customers with IDs starting with an "A"
select *
from customer
where customer_id like 'A%';


-- Create 'sales' table
create table sales (
	order_id varchar,
	order_date date,
	ship_date date,
	ship_mode varchar,
	customer_id varchar,
	product_id varchar,
	sales numeric,
	quantity int,
	discount numeric,
	profit numeric
);

-- select all columns
select *
from sales;


-- Load data and populate the sales table
copy sales
from '/Library/PostgreSQL/sales.csv' delimiter ',' csv header;


-- select all columns again to ensure the column values have been added
select *
from sales;


--- select sales with shipping mode as "Second Class"
select *
from sales
where ship_mode = 'Second Class'
	and sales > 200
limit 10;


-- Create 'product' table
create table product (
	product_id varchar,
	category varchar,
	sub_category varchar,
	product_name varchar
);

-- select all columns
select *
from product;


-- Load data and populate the product table
copy product
from '/Library/PostgreSQL/product.csv' delimiter ',' csv header;


-- select all columns again to ensure the column values have been added
select *
from product;


--- select products in the "Office Supplies" category
select *
from product
where category = 'Office Supplies';