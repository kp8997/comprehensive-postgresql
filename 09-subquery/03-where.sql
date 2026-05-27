-- show the id of orders that have price / weight > 50
SELECT id FROM orders
WHERE product_id IN (
    SELECT id FROM products
    WHERE price / weight > 50
);

-- show the name of product that have price greater than average price of product
SELECT name FROM products
WHERE price > (
    SELECT AVG(price) FROM products
);

-- show the name, department of product that have price not in department of product that have price less than 100
SELECT name, department FROM products
where department NOT IN (
    SELECT department FROM products
    WHERE price < 100
);

-- show the name, department, price of product that have price greater than max price of product in Industrial department
SELECT name, department, price FROM products
WHERE price > (
    SELECT MAX(price) FROM products
    WHERE department = 'Industrial'
);

-- alternative
SELECT name, department, price FROM products
WHERE price > ALL (
    SELECT price FROM products
    WHERE department = 'Industrial'
);

-- show the name, department, price of product that have price greater than at least one product in Industrial department
SELECT name, department, price FROM products
WHERE price > SOME (
    SELECT price FROM products
    WHERE department = 'Industrial'
);
