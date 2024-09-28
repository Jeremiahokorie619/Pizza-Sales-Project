-- Determine KPI values

-- Total Revenue Generated
select sum(total_price) as Total_Revenue
from pizza_sales

-- Average Order Value
select sum(total_price)/count(distinct order_id) as Avg_Order_Value
from pizza_sales

-- Total Pizzas Sold
select count(pizza_id) as Total_Pizzas_Sold
from pizza_sales

-- Total Orders recorded
select count(distinct order_id) as Total_Orders
from pizza_sales

-- Average pizza per order
select cast(cast(sum(quantity) as decimal (10,2))/cast(count(distinct order_id) as decimal (10,2)) 
as decimal (10,2))
as Avg_Pizzas_Per_Order
from pizza_sales

-- Daily Trend For Total Orders
select datename(DW, order_date) as Order_Day, count(distinct order_id) as Total_Orders
from pizza_sales
group by datename(DW, order_date)
order by count(distinct order_id) desc

-- Monthy Trend for Total Orders
select datename(month, order_date) as Order_Month, count(distinct order_id) as Total_Orders
from pizza_sales
group by datename(month, order_date)

-- % of sales by pizza category
select pizza_category, cast(sum(total_price) as decimal (10,2)) as Total_Revenue, 
cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal (10,2)) as [pct%]
from pizza_sales
group by pizza_category

-- % of sales by pizza size
select pizza_size, cast(sum(total_price) as decimal (10,2)) as Total_Revenue, 
cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal (10,2)) as [pct%]
from pizza_sales
group by pizza_size

-- Total pizzas sold by pizza category
select pizza_category, cast(sum(quantity) as decimal (10,2)) as quantity_sold, 
cast(sum(quantity)*100/(select sum(quantity) from pizza_sales) as decimal (10,2)) as [pct%]
from pizza_sales
group by pizza_category

-- Top 5 Pizzas(pizza_name) by Revenue
select top 5 pizza_name, cast(sum(total_price) as decimal (10,2)) as Total_revenue
from pizza_sales
group by pizza_name
order by Total_revenue desc

-- Bottom 5 Pizzas by Revenue
select top 5 pizza_name, cast(sum(total_price) as decimal (10,2)) as Total_revenue
from pizza_sales
group by pizza_name
order by Total_revenue asc

-- Top 5 Pizzas by Quantity
select top 5 pizza_name, cast(sum(quantity) as decimal (10,2)) as quantity_sold
from pizza_sales
group by pizza_name
order by quantity_sold desc 

-- Bottom 5 Pizzas by Quantity
select top 5 pizza_name, cast(sum(quantity) as decimal (10,2)) as quantity_sold
from pizza_sales
group by pizza_name
order by quantity_sold asc 

--Top 5 Pizzas by Total Orders
select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc 

-- Bottom 5 Pizzas by Total Orders
select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc 
 
-- End