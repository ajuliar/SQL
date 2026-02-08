-- Goal: Count total orders per customer, including customers with no orders
-- Strategy:
-- 1. Base table: customers
-- 2. Join type: LEFT JOIN to orders (so customers without orders are included)
-- 3. Aggregation: COUNT of order_id
-- 4. Group by: customer_id and customer_name

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY
    total_orders DESC;


