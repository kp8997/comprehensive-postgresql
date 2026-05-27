SELECT name, price_weight_ratio
FROM (
    SELECT name, price / weight as price_weight_ratio FROM products
)
WHERE price_weight_ratio > 5;

-- Average number of order per user of all users
SELECT AVG(num_orders) FROM (
    SELECT COUNT(*) as num_orders FROM orders
    GROUP BY user_id
);
