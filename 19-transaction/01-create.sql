CREATE TABLE accounts (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    balance NUMERIC NOT NULL DEFAULT 0
);

INSERT INTO accounts (id, name, balance)
VALUES 
    (1, 'Alice', 100),
    (2, 'Bob', 100),
    (3, 'Gia', 300);

SELECT * FROM accounts;