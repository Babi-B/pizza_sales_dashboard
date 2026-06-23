SELECT * FROM pizza_sales;

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

SELECT SUM(total_price) / COUNT (DISTINCT order_id) AS Avge_Order_Value FROM pizza_sales;

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizza_Per_Order FROM pizza_sales;