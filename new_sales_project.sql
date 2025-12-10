----Basic SQL Queries----

-----1.Return all columns from the sales table----.
select top 2 * from new_small_sales_dataset
----2.Count the total number of orders.---
select count(*) as no_of_orders from new_small_sales_dataset
---3.List all unique products sold.---
select distinct Product_Line from new_small_sales_dataset
---Intermediate SQL

---4.Find the total revenue from all sales.
select sum(Total) as Total_revenue from new_small_sales_dataset
---5.Show top 5 customers by total revenue.
select top 2 Customer_Type, SUM(Total) as Total_Revenue from new_small_sales_dataset
group by Customer_Type
order by Total_Revenue desc
---6.Show product-wise total quantity sold.
select Product_Line, sum(Quantity) as Total_sold_quantity from new_small_sales_dataset
group by Product_Line
---7.Find the average unit price for each product.---
select Product_Line,AVG(Unit_Price) as avg_unit_price from new_small_sales_dataset
group by Product_Line
---Time-based SQL--
---8.Find total revenue per month.---
select MONTH(Date) as Month,SUM(Total) as Total_revenue from new_small_sales_dataset
group by MONTH(Date)
---9.Find total orders placed per day.---
select DAY(Date)as Day, count(*) as no_of_orders from new_small_sales_dataset
group by DAY(Date)
---10.Return the day with the highest revenue.---
select top 1 DAY(Date) as day, sum(Total) as total_revenue from new_small_sales_dataset
group by DAY(Date)
order by total_revenue desc
---11.Advanced SQL---
---11.Identify the top 3 highest revenue-generating products.
select top 3 Product_Line,SUM(Total)as Revenue from new_small_sales_dataset
group by Product_Line
order by Revenue Desc
---12.Identify customers who have spent more than $200 total.
select Customer_Type,sum(Total) as total_spent from new_small_sales_dataset
group by Customer_Type
having sum(Total) > 35000
---13.Find the percentage contribution of each product to total sales.---
SELECT
    Product_line,
    SUM(Total) AS product_total_sales,
    ROUND((SUM(Total) * 100.0 / (SELECT SUM(Total) FROM new_small_sales_dataset)),10,2 ) AS percentage_contribution
FROM new_small_sales_dataset
GROUP BY Product_Line
ORDER BY percentage_contribution DESC;





