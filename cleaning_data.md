# What issues will you address by cleaning the data?

1. Firstly, I had to properly sort all the data types as integers, varchar, float, etc (This will allow for proper query results as I continue to work the datasets)
2. The unit costs in the analytics table for the products is incorrect and has to be divided by 1,000,000 to be corrected
3. userid present in the analytics table does not need to be there since all values are null and have fullvisitorId instead
4. Trimming down fullVisiotrId from the all_sessions table 
5. Changing time format from all_sessions table to HH:MM:SS
6. fullVisitorId from all_sessions tables have duplicate ID's
7. units_sold in analytics table has alot of null values where they can be transformed to output "0" instead
8. changing column "SKU" from products table to match other tables names with "productSKU" (did another similar query for changing  fullvisitorId in the analytics table to "fullVisitorId" aswell)

***(Numbers above correspond to numbers below)***

## Queries: Below, provide the SQL queries you used to clean your data.

2. 
 ```SQL
SELECT unit_price / 1000000 AS unit_price
FROM analytics
```
3. 
```SQL
SELECT userid FROM analytics WHERE userid IS NOT null
```
```SQL
ALTER TABLE analytics
DROP COLUMN userid
```
4.
```SQL
SELECT "fullVisitorId", CAST("fullVisitorId" as float ) as fullVisitorIdTrim
FROM all_sessions
```
5. 
```SQL
Select to_timestamp(time) FROM all_session
```
6. 
```SQL
Select "fullVisitorId", COUNT(*)
FROM all_sessions
GROUP BY "fullVisitorId"
HAVING COUNT(*) > 1
```
7.
```SQL
UPDATE analytics
SET units_sold = 0
WHERE units_sold IS NULL
```
8.
```SQL
ALTER TABLE products
RENAME COLUMN "SKU" to "productSKU"
```
```SQL
ALTER TABLE analytics
RENAME COLUMN "fullvisitorId" to "fullVisitorId"
```