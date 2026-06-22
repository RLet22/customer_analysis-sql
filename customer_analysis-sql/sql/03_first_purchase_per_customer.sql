SELECT
	c.customer_unique_id,
	MIN(o.order_purchase_timestamp) AS first_purchase_date
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id;