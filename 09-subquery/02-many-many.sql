SELECT name, price_weight_ratio
FROM (
    SELECT name, price / weight as price_weight_ratio FROM products
)
WHERE price_weight_ratio > 5;
