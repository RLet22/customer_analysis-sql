SELECT
	c.customer_unique_id,
	GETDATE() AS todays_date,
	MAX(o.order_purchase_timestamp) AS last_purchase_date,
	DATEDIFF(day, MAX(o.order_purchase_timestamp), GETDATE()) AS days_since_last_purchase
FROM orders o
JOIN customers c
	ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY days_since_last_purchase ASC;