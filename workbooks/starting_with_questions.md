# Answer the following questions and provide the SQL queries used to find the answer.

    
### **Question 1: Which cities and countries have the highest level of transaction revenues on the site?**


SQL Queries:
```SQL
Select COUNT(*),"country", "city", "transactionRevenue"
FROM all_sessions
GROUP BY "country", "city", "transactionRevenue"
ORDER BY "transactionRevenue"
```


Answer:

![q1_pic](./Images/q1.png)

- We can see the United States has the highest transaction revenue and Sunnyvale being one of those cities



### **Question 2: What is the average number of products ordered from visitors in each city and country?**


SQL Queries:
```SQL
SELECT  DISTINCT("fullVisitorId") AS visitorid, 
		"country" AS country, 
		"city" AS city, 
		products."productSKU", 
-- AVG function used to see average products ordered from each country/city
AVG("orderedQuantity") OVER (
		PARTITION BY "fullVisitorId"
	)
FROM all_sessions
	LEFT JOIN products
	ON all_sessions."productSKU" = products."productSKU"
GROUP BY country, city, products."productSKU", "orderedQuantity", "fullVisitorId"
ORDER BY country DESC
```
Answer: 

- For example, the average ordered products from Zimbabwe is 447





### **Question 3: Is there any pattern in the types (product categories) of products ordered from visitors in each city and country?**


SQL Queries:
```SQL
-- Selecting columns related to products that describe patterns from specific countries/cities
SELECT  DISTINCT("fullVisitorId") AS visitorid, 
		"country" AS country, 
		"city" AS city, 
		products."productSKU",
		"v2ProductName",
		"v2ProductCategory",
		"orderedQuantity"
FROM all_sessions
	LEFT JOIN products
	ON all_sessions."productSKU" = products."productSKU"
WHERE "orderedQuantity" IS NOT NULL
ORDER BY "v2ProductName", country 

```


Answer: 
        
- Most of the items sold relate to the home and apparel side of the categories such as bottles, clothing, and small misc. household items   
- It also seems like each country is ordering the same quantity of products (bulk orders?)






### **Question 4: What is the top-selling product from each city/country? Can we find any pattern worthy of noting in the products sold?**


SQL Queries:
```SQL
-- Showing top selling products from each country/city through LEFT JOIN
SELECT	"country" AS country, 
		"city" AS city, 
		"v2ProductName",
		units_sold
FROM all_sessions
	LEFT JOIN analytics
	ON all_sessions."fullVisitorId" = analytics."fullVisitorId"
WHERE units_sold IS NOT NULL
ORDER BY units_sold DESC
```
Answer:
- There are multiple top selling products that have all sold 825 units across the US, Russia, UK, Japan, France, Hungary, and Mexico (some examples being: emergency flashlight, fleece hoodie, backpack, trucket hat, etc. )





### **Question 5: Can we summarize the impact of revenue generated from each city/country?**

SQL Queries:
```SQL
-- Showing highest revenue per country/city and ranked
SELECT	DISTINCT all_sessions."fullVisitorId",
		"country" AS country, 
		"city" AS city, 
		revenue,
		row_number() OVER(
			PARTITION BY country ORDER BY revenue DESC) AS country_rank
FROM all_sessions
	LEFT JOIN analytics
	ON all_sessions."fullVisitorId" = analytics."fullVisitorId"
WHERE revenue IS NOT NULL
ORDER BY revenue DESC
```


Answer:
- We can see that Canada, India, Russia, UK and the US are tied for 1st with revenue 

### **Question 6: Entity Relationship Diagram (ERD)**
![q1_pic](./Images/ERD.png)






