SELECT
    c.customer_unique_id,
    CAST(SUM(p.payment_value) AS DECIMAL(10,2)) AS lifetime_value_per_customer
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_payments p
    ON p.order_id = o.order_id
GROUP BY c.customer_unique_id
ORDER BY lifetime_value_per_customer DESC;