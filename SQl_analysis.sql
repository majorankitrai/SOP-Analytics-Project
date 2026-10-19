create table dim_customer (CustomerKey integer,
CustomerName varchar(39),	
Segment	varchar(30),
City varchar(40),
Region varchar(40),
Channel varchar(50)
);

create table dim_dates (DateKey	Date,
Year int,
Quarter	int,
MonthNo	int,
MonthName varchar(25),
WeekNo int,
DayName	varchar(20),
IsWeekend bool
)

select * from dim_customer;


------------------------------Executive Analysis & Sales Analysis-----------------

select * from fact_sales;
### Total Sales

select round((sum(salesamount)/1000000)::Numeric,2):: Text || 'M' as total_sales from fact_sales;

## Last Year sales (2025)

select round((sum(salesamount)/1000000)::Numeric,2)::Text || 'M' as last_year_sales from fact_sales where datekey between 20250101 and 20251231; 

## Sales Year-to-date 

select round((sum(salesamount)/1000000)::Numeric,2)::Text || 'M' as last_year_sales from fact_sales where datekey between 20260101 and 20261231;

## Budget Achieved

select * from fact_budget;
 with cte as (
select year,sum(budgetsales) as total_budget from fact_budget group by year
 ),
 cte2 as (
select datekey/10000 as year,sum(salesamount) as total_sales from fact_sales group by datekey/10000
 )

 select c.year,c.total_budget,c1.total_sales,c1.total_sales/c.total_budget*100.0 as "achieved%" from cte c left join cte2 c1 on c.year = c1.year
 order by c.year;

 ### Gross Profit

 select round(((sum(salesamount) - sum(costamoutn))/1000000)::Numeric,2):: Text || 'M' as gross_profit from fact_sales;


### Gross Margin%

with cte as (
select (sum(salesamount) - sum(costamoutn))/1000000 as gross_profit from fact_sales
),
cte2 as (select sum(salesamount)/1000000 as total_sales from fact_sales)

select gross_profit,total_sales,(gross_profit/total_sales)*100.0 as gross_margin from cte cross join cte2;

### Total Inventory

select * from fact_inventory;
select round((sum(receivedqty)/1000000)::Numeric,2):: Text || 'M' as total_inventory from fact_inventory;

## Category wise sales details

select * from dim_product;
select * from fact_sales;
select p.category,sum(s.salesamount) as total_sales from dim_product p join fact_sales s on p.productkey = s.productkey
group by p.category;

## sales in 2025 and 2026

select datekey/10000 as year,round((sum(salesamount)/1000000)::Numeric,2)::Text || 'M' as total_sales_yearly from fact_sales group by datekey/10000;

## Top 5 product sales
select * from dim_product;
select * from fact_sales;

select p.productkey,sum(s.salesamount)/1000000 as total_sales from dim_product p join fact_sales s on p.productkey = s.productkey
group by p.productkey
order by sum(s.salesamount)/1000000 desc
limit 5;

## Top 5 Sales Person
select * from dim_salesperson;

select p.salespersonname,sum(s.salesamount)/1000000 as total_sales from dim_salesperson p join fact_sales s on p.salespersonkey = s.salespersonkey
group by p.salespersonname
order by sum(s.salesamount)/1000000 desc
limit 5;

## Sales By Channels
select * from dim_customer;

select c.channel,sum(s.salesamount)/1000000 as total_sales from dim_customer c join fact_sales s on c.customerkey = s.customerkey 
group by c.channel
order by sum(s.salesamount)/1000000 desc
limit 5;


---------------------------------Operation Analysis & logistic_Inventory Analysis -------------------------------------------------------
select * from fact_production;

## Total Actual QTY 

select round((sum(actualqty)/1000000):: Numeric,2):: text || 'M' as total_actualQTY from fact_production;

## Efficiency%

select (sum(actualqty)/sum(plannedqty))*100.0 from fact_production;

## DowntimeHours

select sum(downtimehours) as total_downtime_hours from fact_production;

## DowntimeHours per 1K

select (sum(downtimehours)/sum(actualqty))*1000 from fact_production;

## Good Output per 1k

select round(((sum(actualqty)-sum(rejectedqty))/1000000)::Numeric,2):: text || 'M' as good_output from fact_production;

## Planr Scorecrad

select * from dim_plant;

select p.plantname,sum(f.actualqty) as total_actualQTY,sum(f.rejectedqty) as total_rejectedQTY,sum(f.plannedqty) as total_planned,
sum(f.downtimehours) as total_downtimeHrs,(sum(f.actualqty)/sum(f.plannedqty))*100.0 as "efficiency%" from dim_plant p join 
fact_production f on p.plantkey = f.plantkey
group by p.plantname;

## Downtime by Hours

select (DateKey / 100) % 100 AS Month ,sum(downtimehours) as total_downtime from fact_production 
group by (DateKey / 100) % 100;

## Bottom 3 product by QTY

select * from dim_product;

select p.productname,sum(f.actualqty) as total_ActualQTY from dim_product  p join fact_production f 
on p.productkey = f.productkey
group by p.productname
order by sum(f.actualqty) asc
limit 3;


