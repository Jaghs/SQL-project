-- 
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