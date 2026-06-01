DROP DATABASE IF EXISTS validation;

CREATE DATABASE comprehensive_postgresql_validation;

\c comprehensive_postgresql_validation;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price INTEGER,
    weight INTEGER,
    department VARCHAR(50)
    -- CONSTRAINT price_check CHECK (price > 0),
    -- CONSTRAINT weight_check CHECK (weight > 0)
);

INSERT INTO products (name, department, price, weight) VALUES ('Shirt', 'Clothes', 20, 1);

INSERT INTO products (name, department, price, weight) VALUES ('Computer', 'Home', 9999, 3);
