# **What are your risk areas? Identify and describe them.**
- Risk areas include columns with blank/null values such as the userid column from the analytics table
- Having unique data which is not duplicated 
- Data that might me linked to other tables but not explicitly or mistyped column names
   


## **QA Process:**
Describe your QA process and include the SQL queries used to execute it.

1. Firstly, I checked all the imported csv tables to get a general idea of the datasets. This allowed me to see connections between the tables and identify empty/null values aswell as incorrect column names. Completely empty columns were removed after checking for any values that were not null, and incorrect column names were changed as shown below:
```SQL
SELECT userid FROM analytics WHERE userid IS NOT null
-- running this showed that there were no values present in that column other than null

-- therefore, this column was deleted:
ALTER TABLE analytics
DROP COLUMN userid
```
```SQL
-- changing column name to be consisten with other tables

ALTER TABLE analytics
RENAME COLUMN "fullvisitorId" to "fullVisitorId"
```
2. After the preliminary sort through I started to validate some of the data. Examples listed below:
```SQL
-- this simple query allowed me to validate that this data exits in an efficient manner

SELECT * FROM all_sessions
WHERE city LIKE '%Mountain View%'
```

```SQL
-- this column should have unique values and I used this query to validate that however, after running it is shown that there are mutiple duplicate IDs. Therefore this validation step gives us the information to delete the duplicated IDs. 

Select "fullVisitorId", COUNT(*)
FROM all_sessions
GROUP BY "fullVisitorId"
HAVING COUNT(*) > 1
```

```SQL
-- the SKUs start with "GGOE" 
SELECT LEFT("productSKU", 4)
FROM all_sessions

-- I ran this query to validate if that is true in the "productSKU" column. It can be seen that there are SKUs that are missing the "GGOE" in front. I can now add them to the incomplete SKUs and now have validated this column. 
SELECT LEFT("productSKU", 4)
FROM all_sessions 
WHERE "productSKU" IN (
	SELECT "productSKU" 
	FROM all_sessions 
	WHERE "productSKU" NOT LIKE '[A-z]'
)