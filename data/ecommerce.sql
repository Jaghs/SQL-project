--Question 5: Can we summarize the impact of revenue generated from each city/country?
SELECT	"v2ProductName"
		"country" AS country, 
		"city" AS city, 
		units_sold
FROM all_sessions
	LEFT JOIN analytics
	ON all_sessions."fullVisitorId" = analytics."fullVisitorId"
WHERE units_sold IS NOT NULL
ORDER BY units_sold DESC
LIMIT 15







