SELECT id FROM orders
WHERE product_id IN (
    SELECT id FROM products
    WHERE price / weight > 50
);

SELECT name FROM products
WHERE price > (
    SELECT AVG(price) FROM products
);

SELECT name, department from products
where department NOT IN (
    SELECT department FROM products
    WHERE price < 100
);

SELECT name, department, price from products
WHERE price > (
    SELECT MAX(price) FROM products
    WHERE department = 'Industrial'
);
