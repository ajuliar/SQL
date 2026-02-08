-- Question 01: 
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

-- Question 2
-- Goal: Count total customers with no orders
-- Strategy:
-- 1. Base table: customers
-- 2. Join type: LEFT JOIN to orders
-- 3. Aggregation: COUNT customers with no orders
-- 4. Group by: n/a

SELECT
    COUNT(c.customer_id) AS customers_with_no_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Question 
-- Goal: Count customers with more than 3 and completed orders
-- Strategy:
-- 1. Base table: customers
-- 2. Join type: INNER JOIN to orders
-- 3. Aggregation: COUNT customers orders, 
-- 4. Group by: n/a

SELECT
    COUNT(c.customer_id) AS customers_with_no_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Question 3
-- Goal: Find customers who have placed more than 3 completed orders
-- Strategy:
-- 1. Base table: customers
-- 2. Join type: INNER JOIN to orders
-- 3. Aggregation: COUNT(order_id)
-- 4. Group by: customer_id, customer_name
-- 5. Condition: HAVING COUNT(order_id) > 3

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS completed_orders
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'completed'   -- only count completed orders
GROUP BY
    c.customer_id,
    c.customer_name
HAVING COUNT(o.order_id) > 3
ORDER BY
    completed_orders DESC;

-- Question 4
-- Goal: List customers who placed exactly one order
-- Strategy:
-- 1. Base table: customers
-- 2. Join type: INNER JOIN to orders
-- 3. Aggregation: COUNT(order_id)
-- 4. Group by: customer_id, customer_name
-- 5. Condition: HAVING COUNT(order_id) = 1

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING COUNT(o.order_id) = 1
ORDER BY
    total_orders;

