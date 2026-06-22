SELECT
	c.customer_unique_id,
	COUNT(DISTINCT o.order_id) AS order_count
FROM orders o
JOIN customers c
	ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY order_count DESC;
