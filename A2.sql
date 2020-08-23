--Assignment 2 - DBW624

--1) Store Dimension - 5 Stores needed

create table store_dimension(
  store_key number not null primary key,
  store_number number not null,
  store_name varchar(30) not null,
  store_lifespan number not null,
  store_address varchar(30) not null,
  store_occupancy number not null,
  store_city varchar(20) not null,
  store_manager varchar(30) not null,
  store_opening_date date not null, 
  store_province varchar(20) not null
);

insert into store_dimension 
values(1, 1200, 'Walmart', 3, '515 Brockton Ave', 500, 'Toronto', 'Mikel Arteta', TO_DATE('01-MAR-17','DD-MON-YY'), 'Ontario');

insert into store_dimension 
values(2, 1210, 'Nike', 2, '415 Yonge St', 300, 'Toronto', 'Pablo Mari', sysdate, 'Ontario');

insert into store_dimension 
values(3, 1220, 'No Frills', 4, '1760 Finch Ave', 400, 'Toronto', 'David Luiz', TO_DATE('03-OCT-18','DD-MON-YY'), 'Ontario');

insert into store_dimension 
values(4, 1230, 'Adidas', 5, '100 Bloor St', 1000, 'Toronto', 'Mesut Ozil', TO_DATE('05-DEC-19','DD-MON-YY'), 'Ontario');

insert into store_dimension 
values(5, 1240, 'Loblaws', 1, '290 Sheppard Ave', 100, 'Scarbrough', 'Nicolas Pepe', TO_DATE('25-FEB-16','DD-MON-YY'), 'Ontario');

select * from store_dimension;

--2) Employee Dimension - 10 Employees Needed

create table employee_dimension(
  employee_key number not null primary key,
  employee_name varchar(30) not null, 
  employee_title varchar(30) not null,
  employee_address varchar(30) not null, 
  employee_years_worked number not null,
  employee_manager varchar(30) not null
);

insert into employee_dimension values(1, 'Jadon Sancho', 'Cashier', '56 Wellesley St', 2, 'Lucien Favre');

insert into employee_dimension values(2, 'Marcus Rashford', 'Web Developer', '100 Bloor St', 4, 'Ole Gunner');
insert into employee_dimension values(3, 'Granit Xhaka', 'Stock Associate', '350 Jarvis St', 2, 'Mikel Arteta');
insert into employee_dimension values(4, 'Mason Mount', 'Cashier', '56 Wellesley St', 2, 'Frank Lampard');
insert into employee_dimension values(5, 'Jesse Lingard', 'Customer Service', '415 Bay St', 1, 'Ole Gunner');
insert into employee_dimension values(6, 'Mo Salah', 'Store Supervisor', '99 King St', 6, 'Jurgen Klopp');
insert into employee_dimension values(7, 'Harry Kane', 'Assistant Manager', '80 Dundas St', 10, 'Jose Mourinho');
insert into employee_dimension values(8, 'David Silva', 'Sales Manager', '2900 Warden Avenue', 9, 'Pep Guordiola');
insert into employee_dimension values(9, 'Pedro Neto', 'HR Associate', '1760 Finch Ave', 7, 'Nuno Santos');
insert into employee_dimension values(10, 'Ansu Fati', 'Cashier', '100 Cherry St', 3, 'Quinten Setin');

select * from employee_dimension;

--3) Definition Table - 10 Records Needed

create table definition(
  table_name varchar(30) not null,
  column_name varchar(30) not null,
  description varchar(30) not null,
  comments varchar(100)
);

insert into definition values('store_dimension', 'store_key', 'primary key', 'store table attribute');
insert into definition values('store_dimension', 'store_number', 'store id', 'store table attribute');
insert into definition values('store_dimension', 'store_name', 'name of the store', 'store table attribute');
insert into definition values('store_dimension', 'store_lifespan_years', 'store lifespan', 'store table attribute');
insert into definition values('store_dimension', 'store_address', 'store location', 'store table attribute');
insert into definition values('store_dimension', 'store_occupancy', 'store size', 'store table attribute');
insert into definition values('store_dimension', 'store_city', 'store city', 'store table attribute');
insert into definition values('store_dimension', 'store_manager', 'store lead', 'store table attribute');
insert into definition values('store_dimension', 'store_opening_date', 'store inception', 'store table attribute');
insert into definition values('store_dimension', 'store_province', 'province of the store', 'store table attribute');

select * from definition;


--4) Payment Type Dimension - 2 Records Needed

create table payment_type_dimension(
payment_type_key number not null primary key,
payment_description varchar(20) not null,
payment_category varchar(20) not null);

insert into payment_type_dimension values (1, 'Debit Card', 'Category_debit');
insert into payment_type_dimension values (2, 'Cash Payment', 'Category_cash');

select * from payment_type_dimension;

--5) Customer Type Dimension - 10 records

create table customer_dimension(
customer_key number not null primary key,
customer_name varchar(30) not null,
date_of_birth date not null,
address varchar(30) not null,
gender varchar(1) not null
);

insert into customer_dimension values(1, 'Rohil' , TO_DATE('18-MAR-98','DD-MON-YY'), '1760 Don Mill Rd', 'M');
insert into customer_dimension values(2, 'Brittany' , TO_DATE('04-NOV-97','DD-MON-YY'), '200 Yonge St', 'F');
insert into customer_dimension values(3, 'Cristiano' , TO_DATE('05-FEB-83','DD-MON-YY'), '90 Bay St', 'M');
insert into customer_dimension values(4, 'Alyssa' , TO_DATE('27-SEP-01','DD-MON-YY'), '15 Shutter St', 'F');
insert into customer_dimension values(5, 'Lionel' , TO_DATE('24-AUG-87','DD-MON-YY'), '350 York Mills Rd', 'M');
insert into customer_dimension values(6, 'Holly' , TO_DATE('05-JUL-99','DD-MON-YY'), '1750 Finch Ave East', 'F');
insert into customer_dimension values(7, 'Wayne' , TO_DATE('29-OCT-85','DD-MON-YY'), '415 Church St', 'M');
insert into customer_dimension values(8, 'Sandler' , TO_DATE('05-SEP-00','DD-MON-YY'), '11 Queen St', 'F');
insert into customer_dimension values(9, 'Timo' , TO_DATE('08-JAN-93','DD-MON-YY'), '39 Coxwell St', 'M');
insert into customer_dimension values(10, 'Nicole' , TO_DATE('12-DEC-99','DD-MON-YY'), '29 Sheppard Ave West', 'F');

select * from customer_dimension;

--6) Promotion Dimension Table - 1 record needed

create table promotion_dimension(
  promotion_key number not null primary key,
  promotion_name varchar(30) not null,
  promotion_category varchar(20) not null,
  description varchar(30) not null,
  start_date date not null,
  end_date date not null,
  amount decimal(3,1) not null,
  constraint check_amount
  check(amount >0)
);

insert into promotion_dimension values (1, 'Boxing Day', 'Annual' ,'Boxing day promotion', TO_DATE('26-DEC-19', 'DD-MON-RR'), TO_DATE('27-DEC-19', 'DD-MON-RR'), 40.0);

select * from promotion_dimension;

--7) Names Table - 10 records

create table names(
  name_year number not null,
  first_name varchar2(30) not null,
  frequency number not null,
  gender varchar2(1)not null
);

desc names

--male

insert into names values(2016, 'Oliver', 46, 'M');
insert into names values(2016, 'Peter', 88, 'M');
insert into names values(2016, 'Romeo', 25, 'M');
insert into names values(2016, 'Saif', 15, 'M');
insert into names values(2016, 'Tanner', 48, 'M');

--female

insert into names values(2016, 'Helena', 28, 'F');
insert into names values(2016, 'Iris', 80, 'F');
insert into names values(2016, 'Judy', 26, 'F');
insert into names values(2016, 'Kylie', 98, 'F');
insert into names values(2016, 'Laila', 50, 'F');

select * from names;


--8) City Population table - 10 records

create table city_population(
year varchar2(20) not null,
geography varchar2(50) not null,
gender varchar2(50) not null,
age_group varchar2(20) not null,
population varchar2(50) not null);

delete from city_population
drop table city_population

insert into city_population values 
('2016', 'Toronto, Ontario', 'M', '18 years', '1200');
insert into city_population values 
('2016', 'Toronto, Ontario', 'F', '6 years', '2500');
insert into city_population values 
('2010', 'Oshawa, Ontario', 'M', '10 years', '1700');
insert into city_population values 
('2012', 'Montreal, Quebec', 'F', '3 years', '3000');
insert into city_population values 
('2005', 'Barrie, Ontario', 'M', '7 years', '2400');

insert into city_population values 
('2010', 'Sudbury, Ontario', 'F', '12 years', '1000');
insert into city_population values 
('2020', 'Toronto, Ontario', 'M', '21 years', '5000');
insert into city_population values 
('2010', 'Thunder Bay, Ontario', 'F', '9 years', '2000');
insert into city_population values 
('2010', 'Calgary, Alberta', 'M', '4 years', '4823');
insert into city_population values 
('2010', 'Niagara, Ontario', 'F', '15 years', '3700');


select * from city_population;

--9) Life Span Table - 10 records

create table life_span(
  year_range varchar2(20) not null,
  geo varchar2(25) not null,
  gender varchar2(30) not null,
  life_expectancy varchar2(50),
  value varchar2(30) not null
);


insert into life_span values('2013/2015','British Columbia', 'M', 'At birth',  '79.2');
insert into life_span values('2016/2018','Ontario', 'M', 'At age 65',  '18.5');
insert into life_span values('2016/2018','Ontario', 'M', 'At birth',  '77.4');
insert into life_span values('2015/2017','Ontario', 'M', 'At age 65',  '17.8');
insert into life_span values('2017/2019','Alberta', 'M', 'At birth',  '78.3');

insert into life_span values('2013/2015','British Columbia', 'F', 'At birth',  '82.8');
insert into life_span values('2017/2019','Ontario', 'F', 'At age 65',  '23.6');
insert into life_span values('2016/2018','Ontatio', 'F', 'At birth',  '83.1');
insert into life_span values('2015/2017','Ontario', 'F', 'At age 65',  '21.7');
insert into life_span values('2017/2019','Alberta', 'F', 'At birth',  '83.9');

select * from life_span;


--10) Product Group Dimension - 4 records

create table product_group_dimension(
  product_group_key number not null primary key,
  age_range varchar(10) not null,
  group_description varchar(20) not null,
  province varchar(15) not null
);

insert into product_group_dimension values(1, '0-12', 'Kids', 'Ontario');
insert into product_group_dimension values(2, '13-25', 'Teens', 'Ontario');
insert into product_group_dimension values(3, '26-59', 'Adults', 'Ontario');
insert into product_group_dimension values(4, '60-100', 'Seniors', 'Ontario');

select * from  product_group_dimension;

--11) Date Dimension Table - 10 records

create table date_dimension(
  date_key number not null primary key,
  the_date date not null,
  date_description varchar(20) not null,
  day_of_week number(1) not null,
  calendar_month varchar(15) not null,
  calendar_quarter number(1) not null,
  holiday_indicator number(1) not null
);

insert into date_dimension values(1, TO_DATE('01-JAN-17', 'DD-MON-RR'), '1st January', 1, 'January', 1, 0);
insert into date_dimension values(2, TO_DATE('13-FEB-17', 'DD-MON-RR'), '13th February', 4, 'February', 1, 0);
insert into date_dimension values(3, TO_DATE('18-MAR-19', 'DD-MON-RR'), '18th March', 3, 'March', 1, 0);
insert into date_dimension values(4, TO_DATE('21-APR-16', 'DD-MON-RR'), '4th April', 2, 'April', 1, 0);
insert into date_dimension values(5, TO_DATE('06-MAY-18', 'DD-MON-RR'), '5th May', 2, 'May', 2, 1);
insert into date_dimension values(6, TO_DATE('10-JUN-20', 'DD-MON-RR'), '10th June', 4, 'June', 2, 0);
insert into date_dimension values(7, TO_DATE('01-JUL-20', 'DD-MON-RR'), '1st July', 1, 'July', 2, 0);
insert into date_dimension values(8, TO_DATE('17-AUG-19', 'DD-MON-RR'), '17th August', 5, 'August', 2, 1);
insert into date_dimension values(9, TO_DATE('23-SEP-20', 'DD-MON-RR'), '23rd September', 1, 'September', 3, 0);
insert into date_dimension values(10,TO_DATE('04-OCT-19', 'DD-MON-RR'), '4th October', 3, 'October', 3, 0);

select * from date_dimension;

--12) Product Dimension - 20 rows

create table product_dimension(
  product_key number not null primary key,
  description varchar(30) not null,
  product_lifespan_months number(2) not null,
  sku varchar(6) not null,
  brand varchar(20) not null,
  product_category varchar(20) not null,
  department_description varchar(20) not null,
  package_type varchar(20) not null,
  product_cost number(3) not null,
  list_price number(3) not null
);

insert into product_dimension values(1,'Golf Club',10, 'XXX001', 'Umbro', 'Golf', 'Sports', 'Pair of clubs', 120, 140);
insert into product_dimension values(2,'Goalie Gloves', 4, 'XXX002', 'Adidas', 'Soccer', 'Sports', 'Pair of gloves', 80, 90);
insert into product_dimension values(3,'Baseball Bat',6, 'XXX003', 'Puma', 'Baseball', 'Sports', 'A metal bat', 200, 250);
insert into product_dimension values(4,'Graduation Hat',5, 'XXX004', 'Staples', 'Wearables', 'Celebration', 'A hat', 60, 60);
insert into product_dimension values(5,'Bedroom Lamp',1, 'XXX005', 'DailyHome', 'Accessories', 'Bedroom', 'Yellow lamp', 220, 250);
insert into product_dimension values(6,'Jersey', 3, 'XXX006', 'Nike', 'Soccer', 'Sports', 'Soccer Jersey', 100, 100);
insert into product_dimension values(7,'Fridge Magnet', 2, 'XXX007', 'Staples', 'Accessories', 'In-house usage', 'Set of Magnets', 120, 140);
insert into product_dimension values(8,'Hand Sanitizer',1, 'XXX008', 'MediCare', 'Sanitizers/Bleaches', 'Daily Usage', 'Sanitizer pack', 20, 30);
insert into product_dimension values(9,'Plaque',4, 'XXX009', 'CraftStuff', 'Plaques', 'Antique', 'Retirement Plaque', 300, 340);
insert into product_dimension values(10,'License Plate', 5, 'XXX010', 'Canadian Tire', 'License Plates', 'Automobile', 'Car Plate', 200, 250);

insert into product_dimension values(11,'Soccer Shorts',2, 'XXX011', 'Nike', 'Soccer', 'Sports', 'Matchday Shorts', 50, 60);
insert into product_dimension values(12,'Shin Guards', 11, 'XXX012', 'Adidas', 'Soccer', 'Sports', 'Pair of shins', 20, 30);
insert into product_dimension values(13,'Photo Frame',6, 'XXX013', 'DailyHome', 'Accessories', 'Frames', 'A photo frame', 100, 110);
insert into product_dimension values(14,'Cloak',5, 'XXX014', 'HM', 'Cloaks', 'Graduation', 'Graduation Cloak', 90, 120);
insert into product_dimension values(15,'Pillow',3, 'XXX015', 'DailyHome', 'Accessories', 'Bedroom', 'Soft Pillow', 220, 250);
insert into product_dimension values(16,'Basketball', 5, 'XXX016', 'Nike', 'Basketball', 'Sports', 'Size 5 Ball', 100, 110);
insert into product_dimension values(17,'Face Masks', 2, 'XXX017', 'MediCare', 'Masks', 'Protection', 'Flu Mask', 20, 20);
insert into product_dimension values(18,'Knee Guard',1, 'XXX018', 'Reebok', 'Volleyball', 'Sports', 'Knee Protector', 50, 70);
insert into product_dimension values(19,'Signing Pen',4, 'XXX019', 'Staples', 'Writing', 'Stationary', 'Marker', 5, 5);
insert into product_dimension values(20,'Sunglasses', 7, 'XXX020', 'HM', 'Shades/Glasses', 'Accessories', 'Dark glasses', 40, 50);

select * from product_dimension;

--13) Fact Table - 100 rows - only 10 to be shown

create table sales_fact(
sales_id number generated by default as identity primary key not null,
product_key number not null, --1
date_key number not null, --2
promotion_key number not null, --3
payment_type_key number not null, --4
store_key number not null, --5
employee_key number not null, --6
purchases_transaction_id number not null, --
item_scan_timestamp number not null, --
sales_dollar_amount number not null, --
quantity number not null, --
tax_dollar_amount number not null, --
promotion_dollar_amount number not null, --
profit number not null,--
customer_key number not null, --7
product_group_key number not null, --8
product_name varchar(30) not null, --
customer_name varchar(30) not null, --
customer_gender char(1) not null, --
customer_address varchar(30) not null, --
store_address varchar(30) not null, --
constraint fk_product_key foreign key(product_key)
references product_dimension(product_key),
constraint fk_date_key foreign key(date_key)
references date_dimension(date_key),
constraint fk_promotion_key foreign key(promotion_key)
references promotion_dimension(promotion_key),
constraint fk_payment_type_key foreign key(payment_type_key)
references payment_type_dimension(payment_type_key),
constraint fk_store_key foreign key(store_key)
references store_dimension(store_key),
constraint fk_employee_key foreign key(employee_key)
references employee_dimension(employee_key),
constraint fk_customer_key foreign key(customer_key)
references customer_dimension(customer_key),
constraint fk_product_group_key foreign key(product_group_key)
references product_group_dimension(product_group_key)
);

--PROMOTION KEY is ALWAYS 1!!!
--PAYMENT TYPE IS ALWAYS 1 or 2!!
--Store can be from 1 to 5!!
--Employees can be from 1-10!!
--Customer can be 1-10!!!
--Product can be 1-20!!

--0-10 rows

insert into sales_fact values 
(1, 1, 1, 1, 1, 1, 1, 1, 100, 50, 3, 30, 0, 100, 1, 1, 'Golf Club', 'Rohil', 'M', '1760 Don Mill Rd', '515 Brockton Avenue');
insert into sales_fact values 
(2, 2, 2, 1, 2, 2, 2, 2, 110, 40, 5, 20, 0, 60, 1, 2, 'Goalie Gloves', 'Rohil', 'M', '1760 Don Mill Rd', '415 Yonge St');
insert into sales_fact values 
(3, 3, 3, 1, 1, 3, 3, 3, 120, 70, 6, 50, 40, 50, 2, 3, 'Baseball Bat', 'Brittany', 'F', '200 Yonge St', '1760 Finch Avenue');
insert into sales_fact values 
(4, 4, 4, 1, 2, 4, 4, 4, 130, 100, 2, 40, 10, 70, 3, 4, 'Graduation Hat', 'Cristiano', 'M', '90 Bay St', '100 Bloor St');
insert into sales_fact values 
(5, 4, 4, 1, 2, 4, 5, 5, 140, 100, 2, 40, 10, 70, 2, 4, 'Graduation Hat', 'Brittany', 'F', '200 Yonge St', '100 Bloor St');
insert into sales_fact values 
(6, 9, 4, 1, 1, 4, 6, 6, 150, 100, 2, 40, 10, 70, 2, 4, 'Plaque', 'Brittany', 'F', '200 Yonge St', '100 Bloor St');
insert into sales_fact values 
(7, 8, 5, 1, 2, 3, 7, 7, 160, 60, 11, 30, 0, 90, 7, 2, 'Hand Sanitizer', 'Wayne', 'M', '415 Church St', '1760 Finch Ave');
insert into sales_fact values 
(8, 6, 1, 1, 1, 2, 8, 8, 170, 80, 9, 50, 0, 60, 4, 2, 'Jersey', 'Alyssa', 'F', '15 Shutter St', '415 Yonge St');
insert into sales_fact values 
(9, 7, 1, 1, 1, 1, 8, 9, 180, 180, 4, 50, 0, 60, 9, 3, 'Fridge Magnet', 'Timo', 'M', '39 Coxwell St', '515 Brockton Avenue');
insert into sales_fact values 
(10, 10, 1, 1, 1, 5, 10, 10, 190, 100, 5, 70, 0, 60, 10, 2, 'License Plate', 'Nicole', 'F', '29 Sheppard Ave West', '290 Sheppard Ave');

--rows 11-20
insert into sales_fact values 
(11, 10, 10, 1, 1, 5, 10, 11, 200, 50, 3, 30, 0, 100, 2, 1, 'License Plate', 'Brittany', 'F', '200 Yonge St', '290 Sheppard Ave');
insert into sales_fact values 
(12, 9, 9, 1, 2, 4, 9, 12, 210, 40, 5, 200, 0, 60, 4, 2, 'Plaque', 'Alyssa', 'F', '15 Shutter St', '100 Bloor St');
insert into sales_fact values 
(13, 8, 8, 1, 1, 3, 8, 13, 220, 70, 6, 60, 40, 50, 6, 3, 'Hand Saniztizer', 'Holly', 'F', '1750 Finch Ave East', '1760 Finch Avenue');
insert into sales_fact values 
(14, 7, 7, 1, 2, 2, 7, 14, 230, 100, 2, 90, 10, 70, 8, 4, 'Fridge Magnet', 'Sandler', 'F', '11 Queen St', '100 Bloor St');
insert into sales_fact values 
(15, 6, 6, 1, 2, 1, 6, 15, 240, 100, 2, 80, 10, 70, 10, 4, 'Jersey', 'Nicole', 'F', '29 Sheppard Ave West', '515 Brockton Avenue');
insert into sales_fact values 
(16, 5, 5, 1, 1, 1, 5, 16, 250, 100, 2, 70, 10, 70, 1, 4, 'Bedroom Lamp', 'Rohil', 'M', '1760 Don Mill Rd', '515 Brockton Avenue');
insert into sales_fact values 
(17, 4, 4, 1, 2, 2, 4, 17, 260, 60, 11, 50, 1, 90, 3, 2, 'Graduation Hat', 'Cristiano', 'M', '90 Bay St', '415 Yonge St');
insert into sales_fact values 
(18, 3, 3, 1, 1, 3, 3, 18, 270, 80, 9, 180, 10, 60, 5, 2, 'Baseball Bat', 'Lionel', 'M', '350 York Mills Rd', '1760 Finch Ave');
insert into sales_fact values 
(19, 2, 2, 1, 2, 4, 2, 19, 280, 300, 5, 50, 2, 60, 7, 3, 'Goalie Gloves', 'Wayne', 'M', '415 Church St', '100 Bloor St');
insert into sales_fact values 
(20, 1, 1, 1, 2, 5, 1, 20, 290, 100, 5, 70, 0, 60, 9, 2, 'Golf Club', 'Timo', 'M', '39 Coxwell St', '290 Sheppard Ave');

--21-30
insert into sales_fact values 
(21, 1, 1, 1, 1, 1, 1, 21, 300, 50, 3, 30, 0, 100, 1, 1, 'Golf Club', 'Rohil', 'M', '1760 Don Mill Rd', '515 Brockton Avenue');
insert into sales_fact values 
(22, 2, 2, 1, 2, 2, 2, 22, 310, 40, 5, 20, 0, 60, 1, 2, 'Goalie Gloves', 'Rohil', 'M', '1760 Don Mill Rd', '415 Yonge St');
insert into sales_fact values 
(23, 3, 3, 1, 1, 3, 3, 23, 320, 70, 6, 50, 40, 50, 2, 3, 'Baseball Bat', 'Brittany', 'F', '200 Yonge St', '1760 Finch Avenue');
insert into sales_fact values 
(24, 4, 4, 1, 2, 4, 4, 24, 330, 100, 2, 40, 10, 70, 3, 4, 'Graduation Hat', 'Cristiano', 'M', '90 Bay St', '100 Bloor St');
insert into sales_fact values 
(25, 4, 4, 1, 2, 4, 5, 25, 340, 100, 2, 40, 10, 70, 2, 4, 'Graduation Hat', 'Brittany', 'F', '200 Yonge St', '100 Bloor St');
insert into sales_fact values 
(26, 5, 5, 1, 1, 1, 5, 26, 350, 100, 2, 70, 10, 70, 1, 4, 'Bedroom Lamp', 'Rohil', 'M', '1760 Don Mill Rd', '515 Brockton Avenue');
insert into sales_fact values 
(27, 4, 4, 1, 2, 2, 4, 27, 360, 60, 11, 50, 1, 90, 3, 2, 'Graduation Hat', 'Cristiano', 'M', '90 Bay St', '415 Yonge St');
insert into sales_fact values 
(28, 3, 3, 1, 1, 3, 3, 28, 370, 80, 9, 180, 10, 60, 5, 2, 'Baseball Bat', 'Lionel', 'M', '350 York Mills Rd', '1760 Finch Ave');
insert into sales_fact values 
(29, 2, 2, 1, 2, 4, 2, 29, 380, 300, 5, 50, 2, 60, 7, 3, 'Goalie Gloves', 'Wayne', 'M', '415 Church St', '100 Bloor St');
insert into sales_fact values 
(30, 1, 1, 1, 2, 5, 1, 30, 390, 100, 5, 70, 0, 60, 9, 2, 'Golf Club', 'Timo', 'M', '39 Coxwell St', '290 Sheppard Ave');


--rows 31-40
insert into sales_fact values 
(31, 9, 4, 1, 1, 4, 6, 31, 400, 100, 2, 40, 10, 70, 2, 4, 'Plaque', 'Brittany', 'F', '200 Yonge St', '100 Bloor St');
insert into sales_fact values 
(32, 8, 5, 1, 2, 3, 7, 32, 410, 60, 11, 30, 0, 90, 7, 2, 'Hand Sanitizer', 'Wayne', 'M', '415 Church St', '1760 Finch Ave');
insert into sales_fact values 
(33, 6, 1, 1, 1, 2, 8, 33, 420, 80, 9, 50, 0, 60, 4, 2, 'Jersey', 'Alyssa', 'F', '15 Shutter St', '415 Yonge St');
insert into sales_fact values 
(34, 7, 1, 1, 1, 1, 8, 34, 430, 180, 4, 50, 0, 60, 9, 3, 'Fridge Magnet', 'Timo', 'M', '39 Coxwell St', '515 Brockton Avenue');
insert into sales_fact values 
(35, 10, 1, 1, 1, 5, 10, 35, 450, 100, 5, 70, 0, 60, 10, 2, 'License Plate', 'Nicole', 'F', '29 Sheppard Ave West', '290 Sheppard Ave');
insert into sales_fact values 
(36, 10, 10, 1, 1, 5, 10, 36, 460, 50, 3, 30, 0, 100, 2, 1, 'License Plate', 'Brittany', 'F', '200 Yonge St', '290 Sheppard Ave');
insert into sales_fact values 
(37, 9, 9, 1, 2, 4, 9, 37, 470, 40, 5, 200, 0, 60, 4, 2, 'Plaque', 'Alyssa', 'F', '15 Shutter St', '100 Bloor St');
insert into sales_fact values 
(38, 8, 8, 1, 1, 3, 8, 38, 480, 70, 6, 60, 40, 50, 6, 3, 'Hand Saniztizer', 'Holly', 'F', '1750 Finch Ave East', '1760 Finch Avenue');
insert into sales_fact values 
(39, 7, 7, 1, 2, 2, 7, 39, 490, 100, 2, 90, 10, 70, 8, 4, 'Fridge Magnet', 'Sandler', 'F', '11 Queen St', '100 Bloor St');
insert into sales_fact values 
(40, 6, 6, 1, 2, 1, 6, 40, 500, 100, 2, 80, 10, 70, 10, 4, 'Jersey', 'Nicole', 'F', '29 Sheppard Ave West', '515 Brockton Avenue');

--rows 41-50
insert into sales_fact values 
(41, 2, 2, 1, 1, 3, 6, 41, 510, 70, 1, 50, 10, 100, 10, 2, 'Goalie Gloves', 'Nicole', 'F', '29 Sheppard Ave West', '1760 Finch Ave');
insert into sales_fact values 
(42, 4, 4, 1, 2, 2, 7, 42, 520, 60, 11, 30, 0, 90, 9, 2, 'Graduation Hat', 'Timo', 'M', '39 Coxwell St', '415 Yonge St');
insert into sales_fact values 
(43, 6, 6, 1, 1, 1, 8, 43, 530, 80, 9, 50, 0, 60, 8, 2, 'Jersey', 'Sandler', 'F', '11 Queen St', '515 Brockton Avenue');
insert into sales_fact values 
(44, 8, 8, 1, 1, 4, 8, 44, 540, 180, 4, 50, 0, 60, 7, 3, 'Hand Sanitizer', 'Wayne', 'M', '415 Church St', '100 Bloor St');
insert into sales_fact values 
(45, 10, 10, 1, 2, 3, 10, 45, 550, 100, 5, 70, 0, 60, 6, 2, 'License Plate', 'Holly', 'F', '1750 Finch Ave East', '1760 Finch Ave');
insert into sales_fact values 
(46, 12, 1, 1, 1, 5, 10, 46, 560, 50, 3, 30, 0, 100, 5, 3, 'Shin Guards', 'Lionel', 'M', '350 York Mills Rd', '290 Sheppard Ave');
insert into sales_fact values 
(47, 14, 3, 1, 2, 2, 9, 47, 570, 40, 5, 200, 0, 60, 4, 2, 'Cloak', 'Alyssa', 'F', '15 Shutter St', '415 Yonge St');
insert into sales_fact values 
(48, 16, 5, 1, 1, 1, 8, 48, 580, 70, 6, 60, 40, 50, 3, 3, 'Basketball', 'Cristiano', 'M', '90 Bay St', '515 Brockton Avenue');
insert into sales_fact values 
(49, 19, 7, 1, 2, 3, 7, 49, 590, 100, 2, 90, 10, 70, 2, 2, 'Knee Guard', 'Brittany', 'F', '200 Yonge St', '1760 Finch Ave');
insert into sales_fact values 
(50, 20, 9, 1, 1, 4, 6, 50, 600, 100, 2, 80, 10, 70, 1, 2, 'Sunglasses', 'Rohil', 'M', '1760 Don Mill Rd', '100 Bloor St');

--51-60
insert into sales_fact values 
(51, 1, 1, 1, 1, 1, 1, 51, 610, 50, 3, 30, 0, 100, 1, 1, 'Golf Club', 'Rohil', 'M', '1760 Don Mill Rd', '515 Brockton Avenue');
insert into sales_fact values 
(52, 2, 2, 1, 2, 2, 2, 52, 620, 40, 5, 20, 0, 60, 1, 2, 'Goalie Gloves', 'Rohil', 'M', '1760 Don Mill Rd', '415 Yonge St');
insert into sales_fact values 
(53, 3, 3, 1, 1, 3, 3, 53, 630, 70, 6, 50, 40, 50, 2, 3, 'Baseball Bat', 'Brittany', 'F', '200 Yonge St', '1760 Finch Avenue');
insert into sales_fact values 
(54, 4, 4, 1, 2, 4, 4, 54, 640, 100, 2, 40, 10, 70, 3, 4, 'Graduation Hat', 'Cristiano', 'M', '90 Bay St', '100 Bloor St');
insert into sales_fact values 
(55, 4, 4, 1, 2, 4, 5, 55, 650, 100, 2, 40, 10, 70, 2, 4, 'Graduation Hat', 'Brittany', 'F', '200 Yonge St', '100 Bloor St');
insert into sales_fact values 
(56, 9, 4, 1, 1, 4, 6, 56, 660, 100, 2, 40, 10, 70, 2, 4, 'Plaque', 'Brittany', 'F', '200 Yonge St', '100 Bloor St');
insert into sales_fact values 
(57, 8, 5, 1, 2, 3, 7, 57, 670, 60, 11, 30, 0, 90, 7, 2, 'Hand Sanitizer', 'Wayne', 'M', '415 Church St', '1760 Finch Ave');
insert into sales_fact values 
(58, 6, 1, 1, 1, 2, 8, 58, 680, 80, 9, 50, 0, 60, 4, 2, 'Jersey', 'Alyssa', 'F', '15 Shutter St', '415 Yonge St');
insert into sales_fact values 
(59, 7, 1, 1, 1, 1, 8, 59, 690, 180, 4, 50, 0, 60, 9, 3, 'Fridge Magnet', 'Timo', 'M', '39 Coxwell St', '515 Brockton Avenue');
insert into sales_fact values 
(60, 10, 1, 1, 1, 5, 10, 60, 700, 100, 5, 70, 0, 60, 10, 2, 'License Plate', 'Nicole', 'F', '29 Sheppard Ave West', '290 Sheppard Ave');

--rows 61-70
insert into sales_fact values 
(61, 10, 1, 1, 1, 5, 10, 61, 710, 100, 5, 70, 0, 60, 10, 2, 'License Plate', 'Nicole', 'F', '29 Sheppard Ave West', '290 Sheppard Ave');
insert into sales_fact values 
(62, 10, 10, 1, 1, 5, 10, 62, 720, 50, 3, 30, 0, 100, 2, 1, 'License Plate', 'Brittany', 'F', '200 Yonge St', '290 Sheppard Ave');
insert into sales_fact values 
(63, 9, 9, 1, 2, 4, 9, 63, 730, 730, 5, 200, 0, 60, 4, 2, 'Plaque', 'Alyssa', 'F', '15 Shutter St', '100 Bloor St');
insert into sales_fact values 
(64, 8, 8, 1, 1, 3, 8, 64, 740, 70, 6, 60, 40, 50, 6, 3, 'Hand Saniztizer', 'Holly', 'F', '1750 Finch Ave East', '1760 Finch Avenue');
insert into sales_fact values 
(65, 7, 7, 1, 2, 2, 7, 65, 750, 100, 2, 90, 10, 70, 8, 4, 'Fridge Magnet', 'Sandler', 'F', '11 Queen St', '100 Bloor St');
insert into sales_fact values 
(66, 6, 6, 1, 2, 1, 6, 66, 760, 100, 2, 80, 10, 70, 10, 4, 'Jersey', 'Nicole', 'F', '29 Sheppard Ave West', '515 Brockton Avenue');
insert into sales_fact values 
(67, 1, 1, 1, 1, 1, 1, 67, 770, 50, 3, 30, 0, 100, 1, 1, 'Golf Club', 'Rohil', 'M', '1760 Don Mill Rd', '515 Brockton Avenue');
insert into sales_fact values 
(68, 2, 2, 1, 2, 2, 2, 68, 780, 40, 5, 20, 0, 60, 1, 2, 'Goalie Gloves', 'Rohil', 'M', '1760 Don Mill Rd', '415 Yonge St');
insert into sales_fact values 
(69, 3, 3, 1, 1, 3, 3, 69, 790, 70, 6, 50, 40, 50, 2, 3, 'Baseball Bat', 'Brittany', 'F', '200 Yonge St', '1760 Finch Avenue');
insert into sales_fact values 
(70, 4, 4, 1, 2, 4, 4, 70, 800, 100, 2, 40, 10, 70, 3, 4, 'Graduation Hat', 'Cristiano', 'M', '90 Bay St', '100 Bloor St');

--71-80
insert into sales_fact values 
(71, 9, 4, 1, 1, 4, 6, 56, 810, 100, 2, 40, 10, 70, 2, 4, 'Plaque', 'Brittany', 'F', '200 Yonge St', '100 Bloor St');
insert into sales_fact values 
(72, 8, 5, 1, 2, 3, 7, 57, 820, 60, 11, 30, 0, 90, 7, 2, 'Hand Sanitizer', 'Wayne', 'M', '415 Church St', '1760 Finch Ave');
insert into sales_fact values 
(73, 6, 1, 1, 1, 2, 8, 58, 830, 80, 9, 50, 0, 60, 4, 2, 'Jersey', 'Alyssa', 'F', '15 Shutter St', '415 Yonge St');
insert into sales_fact values 
(74, 7, 1, 1, 1, 1, 8, 59, 840, 180, 4, 50, 0, 60, 9, 3, 'Fridge Magnet', 'Timo', 'M', '39 Coxwell St', '515 Brockton Avenue');
insert into sales_fact values 
(75, 10, 1, 1, 1, 5, 10, 60, 850, 100, 5, 70, 0, 60, 10, 2, 'License Plate', 'Nicole', 'F', '29 Sheppard Ave West', '290 Sheppard Ave');
insert into sales_fact values 
(76, 9, 4, 1, 1, 4, 6, 56, 860, 100, 2, 40, 10, 70, 2, 4, 'Plaque', 'Brittany', 'F', '200 Yonge St', '100 Bloor St');
insert into sales_fact values 
(77, 14, 3, 1, 2, 2, 9, 47, 870, 40, 5, 200, 0, 60, 4, 2, 'Cloak', 'Alyssa', 'F', '15 Shutter St', '415 Yonge St');
insert into sales_fact values 
(78, 16, 5, 1, 1, 1, 8, 48, 880, 70, 6, 60, 40, 50, 3, 3, 'Basketball', 'Cristiano', 'M', '90 Bay St', '515 Brockton Avenue');
insert into sales_fact values 
(79, 19, 7, 1, 2, 3, 7, 49, 890, 100, 2, 90, 10, 70, 2, 2, 'Knee Guard', 'Brittany', 'F', '200 Yonge St', '1760 Finch Ave');
insert into sales_fact values 
(80, 20, 9, 1, 1, 4, 6, 50, 900, 100, 2, 80, 10, 70, 1, 2, 'Sunglasses', 'Rohil', 'M', '1760 Don Mill Rd', '100 Bloor St');

--81-90
insert into sales_fact values 
(81, 2, 2, 1, 1, 3, 6, 41, 910, 70, 1, 50, 10, 100, 10, 2, 'Goalie Gloves', 'Nicole', 'F', '29 Sheppard Ave West', '1760 Finch Ave');
insert into sales_fact values 
(82, 4, 4, 1, 2, 2, 7, 42, 920, 60, 11, 30, 0, 90, 9, 2, 'Graduation Hat', 'Timo', 'M', '39 Coxwell St', '415 Yonge St');
insert into sales_fact values 
(83, 6, 6, 1, 1, 1, 8, 43, 930, 80, 9, 50, 0, 60, 8, 2, 'Jersey', 'Sandler', 'F', '11 Queen St', '515 Brockton Avenue');
insert into sales_fact values 
(84, 8, 8, 1, 1, 4, 8, 44, 940, 180, 4, 50, 0, 60, 7, 3, 'Hand Sanitizer', 'Wayne', 'M', '415 Church St', '100 Bloor St');
insert into sales_fact values 
(85, 10, 10, 1, 2, 3, 10, 45, 950, 100, 5, 70, 0, 60, 6, 2, 'License Plate', 'Holly', 'F', '1750 Finch Ave East', '1760 Finch Ave');
insert into sales_fact values 
(86, 9, 4, 1, 1, 4, 6, 56, 960, 100, 2, 40, 10, 70, 2, 4, 'Plaque', 'Brittany', 'F', '200 Yonge St', '100 Bloor St');
insert into sales_fact values 
(87, 8, 5, 1, 2, 3, 7, 57, 970, 60, 11, 30, 0, 90, 7, 2, 'Hand Sanitizer', 'Wayne', 'M', '415 Church St', '1760 Finch Ave');
insert into sales_fact values 
(88, 6, 1, 1, 1, 2, 8, 58, 980, 80, 9, 50, 0, 60, 4, 2, 'Jersey', 'Alyssa', 'F', '15 Shutter St', '415 Yonge St');
insert into sales_fact values 
(89, 7, 1, 1, 1, 1, 8, 59, 990, 180, 4, 50, 0, 60, 9, 3, 'Fridge Magnet', 'Timo', 'M', '39 Coxwell St', '515 Brockton Avenue');
insert into sales_fact values 
(90, 10, 1, 1, 1, 5, 10, 60, 1000, 100, 5, 70, 0, 60, 10, 2, 'License Plate', 'Nicole', 'F', '29 Sheppard Ave West', '290 Sheppard Ave');

--91-100
insert into sales_fact values 
(91, 12, 1, 1, 1, 5, 10, 46, 1010, 80, 4, 50, 10, 100, 5, 3, 'Shin Guards', 'Lionel', 'M', '350 York Mills Rd', '290 Sheppard Ave');
insert into sales_fact values 
(92, 14, 3, 1, 2, 2, 9, 47, 1020, 100, 5, 200, 0, 30, 4, 2, 'Cloak', 'Alyssa', 'F', '15 Shutter St', '415 Yonge St');
insert into sales_fact values 
(93, 16, 5, 1, 1, 1, 8, 48, 1030, 70, 6, 60, 40, 50, 3, 3, 'Basketball', 'Cristiano', 'M', '90 Bay St', '515 Brockton Avenue');
insert into sales_fact values 
(94, 19, 7, 1, 2, 3, 7, 49, 1040, 100, 2, 90, 10, 70, 2, 2, 'Knee Guard', 'Brittany', 'F', '200 Yonge St', '1760 Finch Ave');
insert into sales_fact values 
(95, 20, 9, 1, 1, 4, 6, 50, 1050, 100, 2, 80, 10, 70, 1, 2, 'Sunglasses', 'Rohil', 'M', '1760 Don Mill Rd', '100 Bloor St');
insert into sales_fact values 
(96, 1, 1, 1, 1, 1, 1, 51, 1060, 50, 3, 30, 0, 100, 1, 1, 'Golf Club', 'Rohil', 'M', '1760 Don Mill Rd', '515 Brockton Avenue');
insert into sales_fact values 
(97, 2, 2, 1, 2, 2, 2, 52, 1070, 40, 5, 20, 0, 60, 1, 2, 'Goalie Gloves', 'Rohil', 'M', '1760 Don Mill Rd', '415 Yonge St');
insert into sales_fact values 
(98, 3, 3, 1, 1, 3, 3, 53, 1080, 70, 6, 50, 40, 50, 2, 3, 'Baseball Bat', 'Brittany', 'F', '200 Yonge St', '1760 Finch Avenue');
insert into sales_fact values 
(99, 4, 4, 1, 2, 4, 4, 54, 1090, 100, 2, 40, 10, 70, 3, 4, 'Graduation Hat', 'Cristiano', 'M', '90 Bay St', '100 Bloor St');
insert into sales_fact values 
(100, 4, 4, 1, 2, 4, 5, 55, 1100, 150, 2, 0, 100, 70, 2, 4, 'Graduation Hat', 'Brittany', 'F', '200 Yonge St', '100 Bloor St');


select * from sales_fact;


