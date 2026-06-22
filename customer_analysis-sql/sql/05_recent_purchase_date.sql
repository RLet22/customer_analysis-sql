SELECT
	c.customer_unique_id,
	MAX(o.order_purchase_timestamp) AS last_purchase_date
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id;