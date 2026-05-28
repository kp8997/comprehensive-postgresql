DROP DATABASE IF EXISTS validation;

CREATE DATABASE validation;

\c validation

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
