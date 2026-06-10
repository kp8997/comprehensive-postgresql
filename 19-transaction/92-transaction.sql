BEGIN;

UPDATE accounts
SET balance = balance - 10
WHERE name = 'Gia';

SELECT * FROM accounts;

COMMIT;
