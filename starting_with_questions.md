# Answer the following questions and provide the SQL queries used to find the answer.

    
**Question 1: Which cities and countries have the highest level of transaction revenues on the site?**


SQL Queries:
```SQL
Select COUNT(*),"country", "city", "transactionRevenue"
FROM all_sessions
GROUP BY "country", "city", "transactionRevenue"
ORDER BY "transactionRevenue"
```


Answer:

![q1_pic](Images/q1.png)

*We can see the United States has the highest transaction revenue and Sunnyvale being one of those cities*



**Question 2: What is the average number of products ordered from visitors in each city and country?**


SQL Queries:
```SQL
SELECT  "fullVisitorId" AS visitorid, 
		"country" AS country, 
		"city" AS city, 
		products."SKU", 
AVG("orderedQuantity") OVER (
		PARTITION BY "fullVisitorId"
	)
FROM all_sessions
	LEFT JOIN products
	ON all_sessions."SKU" = products."SKU"
GROUP BY country, city, products."SKU", "orderedQuantity", "fullVisitorId"
```


Answer: For example, the average ordered products from New York, United States is 26
        In India, from the city Bengaluru the avergae ordered quantity is 1148 as another example





**Question 3: Is there any pattern in the types (product categories) of products ordered from visitors in each city and country?**


SQL Queries:



Answer:





**Question 4: What is the top-selling product from each city/country? Can we find any pattern worthy of noting in the products sold?**


SQL Queries:



Answer:





**Question 5: Can we summarize the impact of revenue generated from each city/country?**

SQL Queries:



Answer:







