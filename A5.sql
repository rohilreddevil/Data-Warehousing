--DBW624 Assignment 5

--Performance Enhancements


--1) Split the year range column for readability. This will make it easier to query and help in the partitioning process. Segregating such
-- columns helps refine the warehouse to an extent.
select year_beginning from life_span;
alter table life_span rename column year_beginning to year_start;

alter table life_span add year_end varchar(20); 

--***EXTRACT DATE****

select substr(year_start, 0, 4) as left_date,
substr(year_start, 6, 4) as right_date from life_span;

select * from life_span;

--Now updated the new column so that it only has the "right sided" end date

update life_span set year_end = substr(year_start, 6, 4); 

--repeat the same procedure for the "left sided" start date

update life_span set year_start = substr(year_start, 0, 4);

select year_start, year_end from life_span;

--2) Indexing

create index product_idx on sales_fact(product_key);

create index promotion_idx on sales_fact(promotion_key);

create index date_idx on sales_fact(date_key);

create index payment_idx on sales_fact(payment_type_key);

create index store_idx on sales_fact(store_key);

create index employee_idx on sales_fact(employee_key);

create index customer_idx on sales_fact(customer_key);

create index product_group_idx on sales_fact(product_group_key);

--Display these recently made indexes

select * from user_indexes;

--3) Summary Tables

-- First summary table deals with name - similar to the query perfomed in the last stages of assignment 4

create table names_summary as (select first_name, gender, frequency from names);

select * from names summary
order by frequency desc;


--b) Repeat the same procedure for population and lifespan.
--be intelligent about the aggregate choices

create table life_span_summary as (select year_start, geo, life_expectancy, value from life_span
where gender = 'B' and geo = 'Ontario');

select * from life_span_summary
order by year_start desc;

--c) population
create table ontario_population as (select * from city_population 
where geography like '%Ontario%');

select * from ontario_population
order by year desc;

--4) Compression

-- Performed manually

--5) Getting rid of unnecessary data

delete from city_population where geography not like '%Ontario%';
select * from city_population;

delete from life_span where geo not like '%Ontario%';
select * from life_span;

delete from names where frequency < 10;

select * from names
order by name_year desc, frequency desc;






