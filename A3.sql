--DBW624 - Assignment 3

--1) EXTRACT

-- Create staging tables for each of the reference tables to temporarily store the data

--Names (Female and Male Baby Names)

create table male_names(
  year_ number not null,
  name_ varchar2(30) not null,
  frequency number not null
);

create table female_names(
  year_ number not null,
  name_ varchar2(30) not null,
  frequency number not null
);

--Life Span Staging Table

create table life_span_stage(
  ref_date varchar2(20) not null,
  geo varchar2(50) not null,
  dguid varchar2(50) not null,
  sex varchar2(30) not null,
  life_expectancy varchar2(20) not null,
  uom varchar2(30) not null,
  uom_id varchar2(30) not null,
  scalar_factor varchar2(25) not null,
  scalar_id varchar2(30) not null,
  vector varchar2(40) not null,
  coordinates varchar2(30) not null,
  value varchar2(30) not null,
  status varchar2(20) not null,
  symbol varchar2(20) not null,
  terminated_ varchar2(20),
  decimals varchar2(20)
);

--Population Staging Table

create table city_population_stage(
  ref_date varchar(20) not null,
  geography varchar2(50) not null,
  dguid varchar2(50) not null,
  sex varchar2(50) not null,
  age_group varchar2(50) not null,
  uom varchar2(50) not null,
  uom_id varchar2(50) not null,
  scalar_factor varchar2(50) not null,
  scalar_id varchar2(50) not null,
  vector varchar2(50) not null,
  coordinate varchar2(50) not null,
  population varchar2(50) not null,
  status varchar2(50),
  symbol varchar2(50),
  terminated_ varchar2(50),
  decimals varchar2(50) not null
);


--Now LOAD data into EACH of these tables

--verify male names 

select * from male_names;
select count(*) from male_names;

--verify female names

select * from female_names;
select count(*) from female_names;

--verify life span 
select * from life_span_stage;
select count(*) from life_span_stage;

--verify city population

select * from city_population_stage;
select count(*) from city_population_stage;


--2) TRANSFORM

--using cte

--MALE NAMES 
/*with cte_male as (
  select year_,  name_, frequency,
  row_number() over (partition by year_, name_, frequency
  order by year_, name_, frequency) row_count
  from male_names
)

select * from cte_male;
delete from cte_male where row_count > 1; */

--Remove Null Values

delete from male_names where
name_ is null or year_ is null or frequency is null;

--Add a gender field to correspond with the original table


alter table male_names add gender varchar2(1);

alter table male_names 
modify gender default 'M'; 

alter table male_names 
alter column gender drop default;

alter table male_names modify (gender varchar2(1) default 'M');

--FEMALE NAMES

delete from female_names where
name_ is null or year_ is null or frequency is null; 

- 0 rows deleted (Hence proved that there are no null values)

--Add a gender field to correspond with the original table

alter table female_names add gender varchar2(1) not null;

alter table female_names 
modify gender default 'F';

select gender from male_names;
select gender from female_names;

desc female_names
desc male_names

desc names

--CITY POPULATION

--Drop Unnecessary Columns
--This is to ensure that the remaining columns correspond with the ones in the warehouse

alter table city_population_stage
drop (dguid, scalar_factor, scalar_id, uom, uom_id, vector, coordinate, 
status, symbol, terminated_, decimals) 

desc city_population_stage

select sex from city_population_stage

--Memory preservation - Reduce the length of/ modify the values so that they take up relatively less space

update city_population_stage
set sex = 'M' 
where sex = 'Males';

update city_population_stage
set sex = 'F' 
where sex = 'Females';

update city_population_stage
set sex = 'B' 
where sex = 'Both sexes';

select * from city_population_stage

--Delete rows with null values 

select count (*) from city_population_stage

delete from city_population_stage where
geography is null or sex is null or ref_date is null or age_group is null or population is null; 

--Delete rows with an age range to make life simpler

select age_group from city_population_stage

delete from city_population_stage where
age_group like '%to%';

--LIFE SPAN

--Drop unnecessary columns

select * from life_span_stage

alter table life_span_stage
drop (dguid, scalar_factor, scalar_id, uom, uom_id, vector, coordinates, 
status, symbol, terminated_, decimals)

--Drop unnecessary symbols

update life_span_stage
set ref_date = replace(ref_date,'"', '');

update life_span_stage
set geo = replace(geo,'"', '');

update life_span_stage
set sex = replace(sex,'"', '');

update life_span_stage
set life_expectancy = replace(life_expectancy,'"', '');

update life_span_stage
set value = replace(value,'"', '');

--Memory preservation - Reduce the length of/ modify the values so that they take up relatively less space

update life_span_stage
set sex = 'M' 
where sex = 'Males';

update life_span_stage
set sex = 'F' 
where sex = 'Females';

update life_span_stage
set sex = 'B' 
where sex = 'Both sexes';

--Delete rows with null values 

select count(*) from life_span_stage
select * from life_span_stage

delete from life_span_stage where
geo is null or sex is null or ref_date is null or life_expectancy is null or value is null; 

--Dealing with Dates to help distinguish the ref dates
--Create a dedicated table only for these 2 dates

/*create table date_table(
date_from varchar2(20) not null,
date_to varchar2(20) not null
); */

--***EXTRACT DATE****

/*select substr(ref_date, 0, 4) as left_date,
substr(ref_date, 6, 4) as right_date

from life_span_stage */

--STEP 3 - LOAD
-- Now load all the transformed data into the warehouse
--NAMES (MALE & FEMALE)

insert into names(name_year, first_name, frequency, gender)
select * from male_names union select * from female_names;

select * from names

--CITY POPULATION

desc city_population_stage

insert into city_population(year, geography, gender, age_group, population)
select * from city_population_stage

select count(*) from city_population

select count(*) from city_population_stage

--LIFE SPAN

desc life_span_stage
select * from life_span_stage

insert into life_span(year_range, geo, gender, life_expectancy, value)
select * from life_span_stage

select * from life_span
select count(*) from life_span



