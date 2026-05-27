SELECT name, price, (
    SELECT price as product_3_price from products WHERE id = 3
)
FROM products
WHERE price > 867;
    