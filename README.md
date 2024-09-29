# PIZZA SALES DATA ANALYTICS PROJECT
### INTRODUCTION
Old Roger’s Pizza Place is a medium sized pizza restaurant that makes different kinds of pizzas and sells them to customers of varying demographics. The management is in need of a data analyst to help make informed business decisions on the restaurant’s products and customers and to answer ultra-specific questions relating to the business. The business data was provided below to aid the project. 
Note! The data is already clean and prepared for analysis

![pizza sales data preview](https://github.com/user-attachments/assets/c1cfa08c-2ef3-4f7e-90a0-a51ea832d500)
*Old Roger's Pizza Sales Data(The data runs from January 2015 to December 2015)*

### PROJECT SCOPE
The scope of this project is summarized into two key points:
1. Answer all the business questions in the problem statement to help the business make data-informed decisions.
2. Make a report of all findings from the data and use a simple dashboard to present your findings to management

### TECHNOLOGIES USED
1. Microsoft SQL Server
2. Microsoft Excel
3. Power BI

### PROCESS
#### STEP 1: Determine the KPI
1.Total revenue generated- the sum total of all pizzas sold within the time period
2.Average Oder value- the average amount spent per order,calculated by dividing the total revenue by the total number of orders
3.Total Pizzas sold- the sum of the quantities of all pizzas sold
4.Total orders- the total number of orders placed
5.Average Pizzas per order- the average number of pizzas per order, calculated by dividing the total number of pizzas sold by the total number of orders 

#### STEP 2: Determine the other elements that will be displayed on the dashboard

1.Daily Trend For Total Orders: 
Create a bar chart that displays the daily trend of total orders over s specific time period. This chart will help to identify any patterns or fluctuations in order volumes on a daily basis

2.Monthly Trend For Total Orders: 
Create a line chart that illustrates the hourly trend of total orders throughout the day. This chart will help to identify peak hours or periods of peak activity.

3.Percentage Of Sales by Pizza Category: 
Create a pie chart that shows the distribution of sales across different pizza categories. This chart will provide insight into the popularity of various pizza categories and their contribution to overall sales

4.Percentage Of Sales by Pizza sizes:
Generate a pie chart that represents the percentage of sales attributed to different pizza sizes. This chart will help to understand customer preferences for pizza sizes and their impact on sales

5.Total Pizzas sold by Pizzas category:
Create a funnel chart that presents the total number of pizzas sold for each Pizza category. This chart will allow us to compare the sales performance of different pizza categories

6.Top 5 Best Sellers by Revenue, Total Quantity and Total Orders:
Create a bar chart highlighting the top 5 best-selling pizzas based on the Revenue, Total Quantity and Total Orders. This chart will help us identify the most popular pizza options 

7.Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders:
Create a bar chart highlighting the bottom 5 worst-selling pizzas based on the Revenue, Total Quantity and Total Orders. This chart will help us identify the underperforming or least popular pizza options.

#### STEP 3: Load the Data into SQL and run queries to answer all the required questions in STEP 2

-- Total Revenue Generated
```SQL
select sum(total_price) as Total_Revenue
from pizza_sales
```
-- Average Order Value
```SQL
select sum(total_price)/count(distinct order_id) as Avg_Order_Value
from pizza_sales
```
-- Total Pizzas Sold
```SQL
select count(pizza_id) as Total_Pizzas_Sold
from pizza_sales
```
-- Total Orders recorded
```SQL
select count(distinct order_id) as Total_Orders
from pizza_sales
```
-- Average pizza per order
```SQL
select cast(cast(sum(quantity) as decimal (10,2))/cast(count(distinct order_id) as decimal (10,2)) 
as decimal (10,2))
as Avg_Pizzas_Per_Order
from pizza_sales
```
-- Daily Trend For Total Orders
```SQL
select datename(DW, order_date) as Order_Day, count(distinct order_id) as Total_Orders
from pizza_sales
group by datename(DW, order_date)
order by count(distinct order_id) desc
```
-- Monthy Trend for Total Orders
```SQL
select datename(month, order_date) as Order_Month, count(distinct order_id) as Total_Orders
from pizza_sales
group by datename(month, order_date)
```
-- % of sales by pizza category
```SQL
select pizza_category, cast(sum(total_price) as decimal (10,2)) as Total_Revenue, 
cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal (10,2)) as [pct%]
from pizza_sales
group by pizza_category
```
-- % of sales by pizza size
```SQL
select pizza_size, cast(sum(total_price) as decimal (10,2)) as Total_Revenue, 
cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal (10,2)) as [pct%]
from pizza_sales
group by pizza_size
```
-- Total pizzas sold by pizza category
```SQL
select pizza_category, cast(sum(quantity) as decimal (10,2)) as quantity_sold, 
cast(sum(quantity)*100/(select sum(quantity) from pizza_sales) as decimal (10,2)) as [pct%]
from pizza_sales
group by pizza_category
```
-- Top 5 Pizzas(pizza_name) by Revenue
```SQL
select top 5 pizza_name, cast(sum(total_price) as decimal (10,2)) as Total_revenue
from pizza_sales
group by pizza_name
order by Total_revenue desc
```
-- Bottom 5 Pizzas by Revenue
```SQL
select top 5 pizza_name, cast(sum(total_price) as decimal (10,2)) as Total_revenue
from pizza_sales
group by pizza_name
order by Total_revenue asc
```
-- Top 5 Pizzas by Quantity
```SQL
select top 5 pizza_name, cast(sum(quantity) as decimal (10,2)) as quantity_sold
from pizza_sales
group by pizza_name
order by quantity_sold desc 
```
-- Bottom 5 Pizzas by Quantity
```SQL
select top 5 pizza_name, cast(sum(quantity) as decimal (10,2)) as quantity_sold
from pizza_sales
group by pizza_name
order by quantity_sold asc 
```
--Top 5 Pizzas by Total Orders
```SQL
select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc 
```
-- Bottom 5 Pizzas by Total Orders
```SQL
select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc 
 
-- End
```
Results from the codes are displayed below

![image](https://github.com/user-attachments/assets/c31de968-5c55-47a1-bb57-465cbc6a187b)
![image](https://github.com/user-attachments/assets/c41537d0-a8ac-4391-b5ec-d01e0cb1311a)
![image](https://github.com/user-attachments/assets/bc19a4fd-7b06-4196-98df-85be8b968573)
![image](https://github.com/user-attachments/assets/410051c1-eb77-4b9e-9d0e-b9dadfcd2b1b)
![image](https://github.com/user-attachments/assets/d1e14cd5-ab20-4dab-94d1-264e2e89f3b3)
![image](https://github.com/user-attachments/assets/aa108097-35c1-42a6-91ec-9f2ebeef9429)


#### STEP 4: Load the data into Power BI, Transform Data to create required measures and then Build the Dashboard

![page 1](https://github.com/user-attachments/assets/71687b35-46ed-4a56-9114-5077fbfca203)
*Showing the KPI and some important trends as well as filters for different pizzas as different date ranges*
![page 2](https://github.com/user-attachments/assets/57417066-6b31-4643-8255-33a450eab3bc)
*Showing the best selling and worst selling product visuals*

The Power BI report also carries a summary of the key insights from the analysis

End of Project!!


