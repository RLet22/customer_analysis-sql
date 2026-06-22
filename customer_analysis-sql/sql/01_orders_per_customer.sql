SELECT
	c.customer_unique_id,
	COUNT(o.order_id) as order_count
FROM customers c
JOIN orders o 
	ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id;