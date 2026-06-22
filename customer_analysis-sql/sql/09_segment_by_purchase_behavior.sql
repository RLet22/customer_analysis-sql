
WITH order_count AS(
SELECT
	c.customer_unique_id,
	COUNT(DISTINCT o.order_id) AS order_count
FROM orders o 
JOIN customers c
	ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id
), purchase_behavior AS(
SELECT
	customer_unique_id,
	order_count,
	CASE
		WHEN order_count = 1 THEN 'One-Time'
		WHEN order_count BETWEEN 2 AND 4 THEN 'Repeat'
		ELSE 'Loyal'
	END AS segment
FROM order_count
)
SELECT
	segment,
	COUNT(*) AS customer_count
FROM purchase_behavior
GROUP BY segment;
