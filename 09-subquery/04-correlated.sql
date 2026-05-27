-- show the price, name, department of product that have the most expensive price in each department
SELECT price, name, department FROM products p1
WHERE p1.price = (
    SELECT MAX(price) FROM products p2
    WHERE p1.department = p2.department
);

-- Show the number of order of each product 
SELECT name, (
    SELECT COUNT(*) FROM orders o1
    WHERE o1.product_id = p1.id
) as num_orders FROM products p1;
