SELECT
	customer_unique_id,
	MIN(order_purchase_timestamp) AS first_purchase_date,
	MAX(order_purchase_timestamp) AS last_purchase_date,
	DATEDIFF(day, MIN(order_purchase_timestamp), MAX(order_purchase_timestamp))
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
GROUP BY customer_unique_id;