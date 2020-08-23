--Assignment 4 - DBW624

--1)Sales Volumes Analysis by fiscal quarter

--a) By Store

select sales_fact.quantity,
date_dimension.calendar_quarter,
store_dimension.store_name
from   sales_fact,date_dimension,
store_dimension
where sales_fact.date_key = date_dimension.date_key 
and sales_fact.store_key =   store_dimension.store_key;
  
--b) By Product

select sales_fact.quantity,
date_dimension.calendar_quarter,
product_dimension.description
from   sales_fact,date_dimension,
product_dimension
where sales_fact.date_key = date_dimension.date_key 
and sales_fact.product_key =   product_dimension.product_key;

--c) By Product Group - Age Group 

select sales_fact.quantity,
date_dimension.calendar_quarter,
product_group_dimension.age_range
from   sales_fact,date_dimension,
product_group_dimension
where sales_fact.date_key = date_dimension.date_key 
and sales_fact.product_group_key =   product_group_dimension.product_group_key;


--2)Sales Revenue Analysis by fiscal quarter

--a) By Store

select sales_fact.revenue,
date_dimension.calendar_quarter,
store_dimension.store_name
from   sales_fact,date_dimension,
store_dimension
where sales_fact.date_key = date_dimension.date_key 
and sales_fact.store_key =   store_dimension.store_key;

--b) By Product

select sales_fact.revenue,
date_dimension.calendar_quarter,
product_dimension.description
from   sales_fact,date_dimension,
product_dimension
where sales_fact.date_key = date_dimension.date_key 
and sales_fact.product_key =   product_dimension.product_key;

--c) By Product Group - Age Group 

select sales_fact.revenue,
date_dimension.calendar_quarter,
product_group_dimension.age_range
from   sales_fact,date_dimension,
product_group_dimension
where sales_fact.date_key = date_dimension.date_key 
and sales_fact.product_group_key = product_group_dimension.product_group_key;

--3)Sales Profit Analysis by fiscal quarter

--a) By Store

select sales_fact.profit,
date_dimension.calendar_quarter,
store_dimension.store_name
from   sales_fact,date_dimension,
store_dimension
where sales_fact.date_key = date_dimension.date_key 
and sales_fact.store_key =   store_dimension.store_key;

--b) By Product

select sales_fact.profit,
date_dimension.calendar_quarter,
product_dimension.description
from   sales_fact,date_dimension,
product_dimension
where sales_fact.date_key = date_dimension.date_key 
and sales_fact.product_key =   product_dimension.product_key;

--c) By Product Group (Age-Group)

select sales_fact.profit,
date_dimension.calendar_quarter,
product_group_dimension.age_range
from   sales_fact,date_dimension,
product_group_dimension
where sales_fact.date_key = date_dimension.date_key 
and sales_fact.product_group_key = product_group_dimension.product_group_key;


--4) Product Line Analysis by fiscal quarter, measured by revenue and profit

--a) Which products have been the most/least successful?

select product_dimension.description, date_dimension.calendar_quarter, max(sales_fact.revenue) as "Max Revenue", 
max(sales_fact.profit) as "Max Profit", min(sales_fact.revenue) as "Min Revenue", 
min(sales_fact.profit) as "Min Profit" 
from sales_fact, date_dimension, product_dimension
where sales_fact.date_key = date_dimension.date_key 
and sales_fact.product_key = product_dimension.product_key
group by product_dimension.description, date_dimension.calendar_quarter
order by 1;

--b) Which product groups have been the most / least successful

select product_group_dimension.age_range, product_group_dimension.group_description, 
date_dimension.calendar_quarter, max(sales_fact.revenue) as "Max Revenue", 
max(sales_fact.profit) as "Max Profit", min(sales_fact.revenue) as "Min Revenue", 
min(sales_fact.profit) as "Min Profit" 
from sales_fact, date_dimension, product_group_dimension
where sales_fact.date_key = date_dimension.date_key 
and sales_fact.product_group_key = product_group_dimension.product_group_key
group by product_group_dimension.age_range, product_group_dimension.group_description, 
date_dimension.calendar_quarter
order by 1;

--c) What is the product trends (growth or declining)?

select product_dimension.description, date_dimension.calendar_quarter, sales_fact.quantity, sum(sales_fact.revenue) as "Total Revenue", 
sum(sales_fact.profit) as "Total Profit" 
from sales_fact, date_dimension, product_dimension
where sales_fact.date_key = date_dimension.date_key 
and sales_fact.product_key = product_dimension.product_key
group by product_dimension.description, date_dimension.calendar_quarter, sales_fact.quantity
order by 1;

--5) Store Analysis by fiscal quarter, measured by revenue and profit

--a) Which stores are the most / least successful?

select store_dimension.store_name, date_dimension.calendar_quarter, max(sales_fact.revenue) as "Max Revenue", 
max(sales_fact.profit) as "Max Profit", min(sales_fact.revenue) as "Min Revenue", 
min(sales_fact.profit) as "Min Profit" 
from sales_fact, date_dimension, store_dimension
where sales_fact.date_key = date_dimension.date_key 
and sales_fact.store_key = store_dimension.store_key
group by store_dimension.store_name, date_dimension.calendar_quarter
order by 1;

--b) What is the growth trends for each store (growth or declining)?

select store_dimension.store_name, date_dimension.calendar_quarter, sum(sales_fact.revenue) as "Total Revenue", 
sum(sales_fact.profit) as "Total Profit" 
from sales_fact, date_dimension, store_dimension
where sales_fact.date_key = date_dimension.date_key 
and sales_fact.store_key = store_dimension.store_key
group by store_dimension.store_name, date_dimension.calendar_quarter
order by 1;

--6) Additional Analysis

--a) Which names have been most successful by volume?

select sales_fact.customer_name, sales_fact.quantity, count(sales_fact.customer_name) as "Name Count" 
from sales_fact
group by sales_fact.customer_name, sales_fact.quantity
order by 2 desc;

--b) Which gender has been most successful by volume?

select sales_fact.customer_gender, sales_fact.quantity, count(sales_fact.customer_gender) as "Gender Count" 
from sales_fact
group by sales_fact.customer_gender, sales_fact.quantity
order by 2 desc;

--c) Who was the top sales person for the quarter?

select date_dimension.calendar_quarter, employee_dimension.employee_name, 
count(employee_dimension.employee_name) as "Employee Count", 
sum(sales_fact.profit) as "Profit" 
from date_dimension, employee_dimension, sales_fact
where sales_fact.date_key = date_dimension.date_key 
and sales_fact.employee_key = employee_dimension.employee_key
group by date_dimension.calendar_quarter, employee_dimension.employee_name
order by 3 desc, 4 desc;

--d) What percentage of sales are cash versus credit card?

select (count(sales_fact.payment_type_key)*100 /(select sum(count(*)) over() from sales_fact)) as "percentage",
payment_type_dimension.payment_description
from sales_fact, payment_type_dimension
where sales_fact.payment_type_key = payment_type_dimension.payment_type_key
group by payment_type_dimension.payment_description;

--e) What percentage of sales were using a marketing campaign?

select (count(sales_fact.promotion_key)*100 /(select sum(count(*)) over() from sales_fact)) as "percentage",
promotion_dimension.promotion_name
from sales_fact, promotion_dimension
where sales_fact.promotion_key = promotion_dimension.promotion_key
group by promotion_dimension.promotion_name;

--7) Analytics Against Reference Tables

--a) Which 10 cities should we open stores in, based on population?

select geography, sum(population) as "Cumulative Population"  from city_population
group by geography
order by 2 desc;

--b) Which names should we expect will be the most popular for our personalized products?

select first_name, gender, frequency from names
order by 3 desc;


















