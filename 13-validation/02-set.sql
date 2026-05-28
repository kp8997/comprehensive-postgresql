ALTER TABLE products
ALTER COLUMN price
SET NOT NULL;

INSERT INTO products (name, department, weight) VALUES ('test', 'test', 1);
