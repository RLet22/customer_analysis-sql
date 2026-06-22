
WITH link_orders AS(
SELECT
	o.customer_id,
	CAST(SUM(p.payment_value) AS DECIMAL(10,2)) AS total_revenue
FROM orders o
JOIN order_payments p
	ON o.order_id = p.order_id
GROUP BY o.customer_id
) 
SELECT
	TOP 10 total_revenue,
	customer_unique_id
FROM link_orders l
JOIN customers c
	ON l.customer_id = c.customer_id
ORDER BY total_revenue DESC;