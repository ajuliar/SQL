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

-- Question 5
-- Goal: Calculate the total revenue per customer, including customers with no orders
-- Strategy:
-- 1. Base table: customers
-- 2. Join type: LEFT JOIN to orders
-- 3. Aggregation: SUM(order_amount)
-- 4. Group by: customer_id, customer_name

SELECT
    c.customer_id,
    c.customer_name,
    COALESCE(SUM(o.order_amount), 0) AS total_revenue
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY
    total_revenue DESC;

-- Question 6
-- Goal: Find the top 3 customers by total revenue
-- Strategy:
-- 1. Base table: customers
-- 2. Join type: INNER JOIN to orders
-- 3. Aggregation: SUM(order_amount)
-- 4. Group by: customer_id, customer_name
-- 5. Order by SUM(order_amount) DESC, LIMIT 3

SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.order_amount) AS total_revenue
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY
    total_revenue DESC
LIMIT 3;

-- Question 7
-- Goal: List customers who have placed at least one order in the last 30 days
-- Strategy:
-- 1. Base table: customers
-- 2. Join type: INNER JOIN to orders
-- 3. Filter: orders in last 30 days using WHERE
-- 4. Group by: customer_id, customer_name

SELECT DISTINCT
    c.customer_id,
    c.customer_name
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_date >= CURRENT_DATE - INTERVAL '30 DAY'
ORDER BY
    c.customer_name;

-- Question 8
-- Goal: Find customers who placed orders but none of them were completed
-- Strategy:
-- 1. Base table: customers
-- 2. Join type: INNER JOIN to orders
-- 3. Aggregation: COUNT + conditional logic
-- 4. Group by: customer_id, customer_name
-- 5. Condition: HAVING SUM(CASE WHEN status='completed' THEN 1 ELSE 0 END) = 0

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING SUM(CASE WHEN o.status = 'completed' THEN 1 ELSE 0 END) = 0
ORDER BY
    c.customer_name;

-- Question 9
-- Goal: Find the average order amount per customer, only for customers with more than 2 orders
-- Strategy:
-- 1. Base table: customers
-- 2. Join type: INNER JOIN to orders
-- 3. Aggregation: AVG(order_amount)
-- 4. Group by: customer_id, customer_name
-- 5. Condition: HAVING COUNT(order_id) > 2

SELECT
    c.customer_id,
    c.customer_name,
    AVG(o.order_amount) AS avg_order_amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING COUNT(o.order_id) > 2
ORDER BY
    avg_order_amount DESC;

-- Question 10
-- Goal: List customers who have placed orders totaling more than $500 in revenue
-- Strategy:
-- 1. Base table: customers
-- 2. Join type: INNER JOIN to orders
-- 3. Aggregation: SUM(order_amount)
-- 4. Group by: customer_id, customer_name
-- 5. Condition: HAVING SUM(order_amount) > 500

SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.order_amount) AS total_revenue
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING SUM(o.order_amount) > 500
ORDER BY
    total_revenue DESC;


