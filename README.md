# SQL_Product_Report
Product Sales Analysis  
Objective  
Analyze product sales performance and identify products with high, medium, and low revenue.  

Data Used  
Sales table: [gold.fact_sales]  
Product table: [gold.dim_products]  
Tables joined using product_key  

Product Report  
Created the SQL view dbo.report_products to summarize each product’s:  
Total revenue: Sum of sales amounts.  
Total orders: Number of distinct orders.  
Total quantity: Total units sold.  
Total customers: Number of distinct customers who purchased the product.  
Lifespan: Month difference between the first and last order.  
Recency: Month difference between the last order and today.  
Average order revenue: Total revenue divided by total orders.  
Average monthly revenue: Total revenue divided by lifespan; when lifespan is zero, total revenue is used.  
