DROP DATABASE IF EXISTS validation;

CREATE DATABASE validation;

\c validation

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INTEGER DEFAULT 0,
    weight INTEGER NOT NULL,
    department VARCHAR(50)
);

INSERT INTO products (name, department, price, weight) VALUES ('Shirt', 'Clothes', 20, 1);

INSERT INTO products (name, department, price, weight) VALUES ('Computer', 'Home', 9999, 3);
