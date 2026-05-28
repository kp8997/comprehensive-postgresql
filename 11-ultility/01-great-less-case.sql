SELECT name, GREATEST(price * 2, 30) AS shipping_fee FROM products;

SELECT name, LEAST(price * 0.5, 400, 30) AS shipping_fee FROM products;

SELECT 
    name, 
    price,
    CASE
        WHEN price > 600 THEN 'high'
        WHEN price > 300 THEN 'medium'
        ELSE 'low'
    END AS price_size_label
FROM products;
