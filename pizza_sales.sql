-- SELECT * FROM pizza_sales

--KPI's REQUIREMENT

-- 1):Total Rebvenue (The sum of total price of all orders.)

--Select round(sum(total_price),2) as Total_Revenue 
--from pizza_sales;

--output Total_Revenue = 817860.05
-- ================================================================================

-- 2): Average Order Value: (The average amount spent per order.
-- calculated by dividing the total revenue by the total number of orders.)

--select round(sum(total_price) / count(distinct order_id) ,2) as Average_Order_Value
--from pizza_sales;

--  output  Average_Order_Value = 38.31
-- =======================================================================================


-- 3): Total Pizza Sold:
-- The Sum of the quantity of all pizzas sold 

--select round(sum(quantity),2) as Total_Pizza_Sold 
--from pizza_sales;

-- Output Total_pizza_Sold = 49574

-- =========================================================================================

-- 4):Total Orders:
-- The total number of orders placed.

--select count( distinct order_id) as Total_Orders
--from pizza_sales

-- Output  Total_Orders = 21350

-- =========================================================================================

-- 5): Average Pizzas Per Order:
-- The average number of pizzas sold per orders, calculated by dividing 
-- the total number of pizzas sold by the total number of orders.

--select (cast (cast(sum(quantity) as Decimal(10,2))/ 
--cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))) AS Average_Pizzas_Per_Order
--from pizza_sales 

-- Output Average_Pizzas_Per_Order = 2.32;

-- ==========================================================================================


--B) Daily Trend For Total Orders:
--Create a bar chart that displays the daily trend of total 
--orders overs a specific time period. This charts will
--help us identify  any patterns or fluctuation in orders volumes on a daily basis.


--select datename(DW, order_date) as order_day , count(distinct order_id) AS Total_Orders
--from pizza_sales
--group by datename(DW , order_date)   


-- sort
--select DATENAME( DW , order_date) As Order_Day , Count(distinct order_id) as Total_Orders
--from pizza_sales
--group by datename(DW, order_date) , datepart(DW, order_date)
--order by datepart(DW, order_date)

-- ==========================================================

-- C)Monthly Trend

--SELECT DATENAME(MONTH, order_date) AS order_month,
--COUNT(DISTINCT order_id) AS Total_Orders
--FROM pizza_sales
--GROUP BY DATENAME(MONTH, order_date) , DATEPART(MONTH, order_date)
--ORDER BY DATEPART(MONTH, order_date);

--====================================================================================

-- D) Percentage of Sales By Pizza Category:

--SELECT 
--    pizza_category,  
--    CAST(SUM(total_price) AS DECIMAL(10, 2)) AS total_revenue,
--    CONCAT(CAST((SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales where month(order_date) = 2)) AS DECIMAL(10, 2)) ,'%') AS PCT
--FROM pizza_sales
--where month(order_date) = 2
--GROUP BY pizza_category;
--================================================================================

-- E) % of Sales by Pizza Size

--select pizza_size,
--cast(sum(total_price) as decimal(10,2)) as Total_Sales , 
--concat(cast(sum(total_price) * 100 / (Select sum(total_price) from pizza_sales where month(order_date) = 2) as decimal(10,2)) , '%') AS PCT
--From pizza_sales
--where month(order_date) = 2
--group by pizza_size
--order by PCT Desc ;

-- ====================================================================================================================================================

--select pizza_name , sum(total_price) as Total_Revenue
--from pizza_sales
--group by pizza_name
--order by Total_Revenue desc

-- =========================================================================

-- F)Total Pizzas Sold by Pizza Category

--select pizza_category , sum(quantity) as Total_Quantity_Sold
--from pizza_sales
----where month(order_date) = 2
--group by pizza_category
--order by Total_Quantity_Sold desc

-- ===========================================================

--	G)Top 5 Pizzas by Revenue

--select top 5 pizza_name , sum(total_price) as Total_Revenue
--from pizza_sales
--group by pizza_name
--order by Total_Revenue desc

--===========================================================================
 
--  H)Bottom 5 Pizzas by Revenue
--select top 5 pizza_name , sum(total_price) as Total_Revenue
--from pizza_sales
--group by pizza_name
--order by Total_Revenue ASC

-- ===========================================================================

--I)Top 5 Pizzas by Quantity

--select top 5 pizza_name , sum(quantity) as Total_Quantity
--from pizza_sales
--group by pizza_name
--order by Total_Quantity Desc

-- ===============================================================================

-- J) Bottom 5 Pizzas by Quantity

--select top 5 pizza_name , sum(quantity) Total_Quantity
--from pizza_sales
--group by pizza_name
--order by Total_Quantity 

-- ===========================================================================

-- K) Top 5 Pizzas by Total Orders

--select top 5 pizza_name ,count(distinct order_id) as Total_Orders
--from pizza_sales
--group by pizza_name
--order by Total_Orders DESC


-- ====================================================================

-- L) Bottom 5 Pizzas by Total Orders

--select top 5 pizza_name , count(distinct order_id) as Total_Orders
--from pizza_sales
--group by pizza_name
--order by Total_Orders




