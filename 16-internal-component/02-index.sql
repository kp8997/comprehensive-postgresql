CREATE INDEX users_username_idx ON users (username);

-- DROP INDEX users_username_idx;
EXPLAIN ANALYZE SELECT * FROM users WHERE username = 'Emil30';
