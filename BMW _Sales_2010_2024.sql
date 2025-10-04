create database BMW ;
use BMW ;

select * from bmw_sales ;

-- 1) View unique models, regions, and fuel types

select distinct model from bmw_sales ;
select distinct region from bmw_sales ;
select distinct Fuel_Type from bmw_sales ; 

-- 2) Basic stats 

select min(Price_USD) as min_price,
       max(Price_USD) as max_price,
       avg(Price_USD) as avg_price 
from bmw_sales       ;

-- 3) Total Sales, Revenue & Average Price

select 
	  sum(sales_volume) as Total_sales,
      sum(price_usd * sales_volume) as Total_revenue,
      avg(price_usd) as avg_price
 from bmw_sales ;

-- 3) Top 5 Performing Models by Sales Volume
select model , 
       sum(sales_volume) as total_sales 
from bmw_sales 
group by model 
order by total_sales desc 
limit 5 ;

-- 4) Total sales per year 

select year , sum(sales_volume) as total_sales 
from bmw_sales 
group by year 
order by year desc ;

-- 5) Sales by region

select region, sum(sales_volume) as total_sales 
from bmw_sales 
group by region
order by total_sales desc ;

-- 6) Yearly Sales Trend

SELECT
  Year,
  SUM(Sales_Volume) AS Total_Sales,
  round(sum(Price_USD * Sales_Volume)/1000000 ,2 ) AS Revenue_Million_USD
FROM bmw_sales
GROUP BY Year
ORDER BY Year;

-- 7) Region-wise Performance

SELECT
  Region,
  SUM(Sales_Volume) AS Total_Sales,
  ROUND(SUM(Price_USD * Sales_Volume)/1000000, 2) AS Revenue_Million_USD
FROM bmw_sales
GROUP BY Region
ORDER BY Revenue_Million_USD DESC;

-- 8) Average Mileage by Fuel Type

SELECT
    Fuel_Type,
    ROUND(AVG(Mileage_KM), 2) AS Avg_Mileage
FROM bmw_sales
GROUP BY Fuel_Type;

-- 9) Sales Classification Summary

SELECT
    Sales_Classification,
    COUNT(*) AS No_of_Models,
    SUM(Sales_Volume) AS Total_Sales
FROM bmw_sales
GROUP BY Sales_Classification
ORDER BY Total_Sales DESC;

-- 10) Model Performance by Year (Trend Analysis)

SELECT
    Model,
    Year,
    SUM(Sales_Volume) AS Total_Sales
FROM bmw_sales
GROUP BY Model, Year
ORDER BY Model, Year;

-- 11) Fuel Type Trend Over Years

SELECT 
  Year,
  Fuel_Type,
  SUM(Sales_Volume) AS Total_Sales
FROM bmw_sales
GROUP BY Year, Fuel_Type
ORDER BY Year, Total_Sales DESC;

-- 12) Contribution of Each Fuel Type (%)

SELECT 
    Fuel_Type,
    ROUND(SUM(Sales_Volume) * 100.0 / (SELECT SUM(Sales_Volume) FROM bmw_sales), 2) AS Sales_Percentage
FROM bmw_sales
GROUP BY Fuel_Type
ORDER BY Sales_Percentage DESC;