### **Question 1: Which country has the highest average amount of page views? (Rounded to a whole number)**

SQL Queries:
```SQL 
-- Shows highest average country page view
SELECT country,
	   CAST(AVG(analytics.pageviews) AS DECIMAL(10,0))
FROM all_sessions
	LEFT JOIN analytics
	ON all_sessions."fullVisitorId" = analytics."fullVisitorId"
GROUP BY country 
ORDER BY avg DESC
LIMIT 1
```

Answer: 
- The highest average page view country is Martinique with 25 views



### **Question 2: Show product names and their SKU numbers having stock greater than 200.**

SQL Queries:
```SQL
-- Showing stock greater than 200 
SELECT  "productSKU",
		 name,
		"stockLevel"
FROM products
GROUP BY "productSKU", name, "stockLevel"
HAVING "stockLevel" > 200
```

Answer: 
- 123 products were deemed to have a stock level greater than 200



### **Question 3: Show total ordered products fitting into a small batch, medium batch and large batch from the sales_report table.**

SQL Queries:
```SQL
SELECT name, "productSKU", total_ordered,
	CASE
		WHEN total_ordered BETWEEN 0 AND 100 THEN 'small batch'
		WHEN total_ordered BETWEEN 100 AND 200 THEN 'medium batch'
			ELSE 'large batch'
		END AS "batch_size"
FROM sales_report
GROUP BY name, "productSKU", total_ordered
```

Answer:
- We can see that the majority of orders fit into the small batch category while there are also some medium and large batches
