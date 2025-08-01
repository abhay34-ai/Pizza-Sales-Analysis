

create database Pizza_DB
use Pizza_DB

select * from Pizza_sales

select SUM(total_price) as [Total Revenue] from Pizza_sales

select COUNT(distinct order_id) as [Total Order] from Pizza_sales


select SUM(total_price)/ COUNT(distinct order_id) as [Avg order Value] from Pizza_sales


select SUM(quantity) as [Total Pizzas Sales] from Pizza_sales





SELECT 
  CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
       CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
  AS DECIMAL(10,2)) AS [Avg Pizza per order]
FROM Pizza_sales;


----- daily trend for order on daily 
SELECT 
  DATENAME(WEEKDAY, order_date) AS [Order Day], 
  COUNT(DISTINCT order_id) AS [Total Orders]
FROM Pizza_sales
GROUP BY DATENAME(WEEKDAY, order_date);


----- daily trend for order on monthly 

SELECT 
  DATENAME(Month, order_date) AS [Month], 
  COUNT(DISTINCT order_id) AS [Total Orders]
FROM Pizza_sales
GROUP BY DATENAME(Month, order_date)
order by  [Total Orders] desc


--- category wise total sales

select pizza_category,SUM(total_price) as [Total Revenue By category] FROM Pizza_sales
group by  pizza_category


------ category wise total sales percentage 
SELECT 
  pizza_category,
  CAST(SUM(total_price) * 100.0 / 
       (SELECT SUM(total_price) FROM Pizza_sales) AS DECIMAL(5,2)
  ) AS [Sales Percentage]
FROM Pizza_sales
GROUP BY pizza_category;


------ category wise total sales percentage month
SELECT 
  pizza_category,
  CAST(SUM(total_price) * 100.0 / 
       (SELECT SUM(total_price) FROM Pizza_sales WHERE MONTH(order_date) = 1) AS DECIMAL(5,2)
  ) AS [Sales % - January]
FROM Pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;


select * from Pizza_sales
----- size wise total sales percentage 
SELECT 
  pizza_size,
  CAST(SUM(total_price) * 100.0 / 
       (SELECT SUM(total_price) FROM Pizza_sales) AS DECIMAL(5,2)
  ) AS [Sales Percentage]
FROM Pizza_sales
GROUP BY pizza_size;


------ category wise total sales percentage month
SELECT 
  pizza_size,
  CAST(SUM(total_price) * 100.0 / 
       (SELECT SUM(total_price) FROM Pizza_sales WHERE MONTH(order_date) = 1) AS DECIMAL(5,2)
  ) AS [Sales % - January]
FROM Pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_size;








--- select top 5 based rebevnue tatal quantity total order
select * from Pizza_sales


select top 5 pizza_name,sum(total_price)  as [based revenue] from Pizza_sales
group by pizza_name
order by [based revenue] desc

select top 5 pizza_name,sum(total_price)  as [based revenue] from Pizza_sales
group by pizza_name
order by [based revenue] 



select top 5 pizza_name,sum(quantity)  as [based quantity] from Pizza_sales
group by pizza_name
order by [based quantity] desc



select top 5 pizza_name,sum(quantity)  as [based quantity] from Pizza_sales
group by pizza_name
order by [based quantity] 

