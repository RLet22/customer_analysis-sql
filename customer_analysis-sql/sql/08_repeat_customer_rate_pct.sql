WITH customer_orders AS
(
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)
SELECT
    COUNT(customer_unique_id) AS total_customers,
    COUNT(CASE WHEN order_count > 1 THEN customer_unique_id END) AS repeat_customers,
    CAST(COUNT(CASE WHEN order_count > 1 THEN customer_unique_id END) * 100.00 / COUNT(*) AS DECIMAL(10,2)) AS repeat_customer_rate_pct

FROM customer_orders;