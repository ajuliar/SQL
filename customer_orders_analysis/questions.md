Question 1
List all customers and the total number of orders they have placed, including customers who have never placed an order.
  Tests: LEFT JOIN, COUNT, GROUP BY

  Question 2
Find customers who have never placed an order.
  Tests: LEFT JOIN + IS NULL (no aggregation)

Question 3
Find customers who have placed more than 3 completed orders.
  Tests: INNER JOIN, WHERE vs HAVING, COUNT
  
Question 4
List customers who placed exactly one order.
  Tests: GROUP BY + HAVING COUNT = 1
  
Question 5
Calculate the total revenue per customer, including customers with no orders.
  Tests: LEFT JOIN, SUM, GROUP BY (NULL awareness)
  
Question 6
Find the top 3 customers by total revenue.
  Tests: SUM, ORDER BY, LIMIT
  
Question 7
List customers who have placed at least one order in the last 30 days.
  Tests: date filter, INNER JOIN, WHERE
  
Question 8
Find customers who placed orders but none of them were completed.
  Tests: filtering logic + aggregation reasoning

Question 9
Find the average order amount per customer, only for customers who have more than 2 orders.
  Tests: AVG, HAVING, COUNT

Question 10
List customers who have placed orders totaling more than $500 in revenue.
  Tests: SUM + HAVING

