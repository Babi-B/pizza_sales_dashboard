SELECT * FROM pizza_sales;

-- Daily Trend
SELECT DATENAME(DW, order_date) AS Order_day, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

-- Hourly Trend
SELECT DATEPART(HOUR, order_time) AS Order_hours, COUNT(DISTINCT order_id) AS Total_order FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time) 
ORDER BY DATEPART(HOUR, order_time);

-- %age of Sales by Pizza Category (PCT)
SELECT pizza_category, 
CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_revenue, 
CAST(SUM(total_price) * 100 / (SELECT SUM (total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category
ORDER BY pizza_category;

-- %age of Sales by Pizza Size
SELECT pizza_size,
CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_revenue,
CAST(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

-- Total Pizza Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS Total_quantity_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_quantity_sold DESC;

-- Top 5 best sellers by total pizza sold
SELECT TOP 5 pizza_name,
SUM(quantity) AS Total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizza_sold DESC

-- Bottom 5 best sellers by total pizza sold
SELECT TOP 5 pizza_name,
SUM(quantity) AS Total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizza_sold ASC