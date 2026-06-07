CREATE INDEX users_username_idx ON users (username);

-- DROP INDEX users_username_idx;
EXPLAIN ANALYZE SELECT * FROM users WHERE username = 'Emil30';

SELECT pg_size_pretty(pg_relation_size('users_username_idx'));

SELECT pg_size_pretty(pg_relation_size('users'));

-- index heap file
SELECT relname, relkind FROM pg_class WHERE relkind = 'i';

-- extension to query page inside index file
CREATE EXTENSION pageinspect;

SELECT * FROM bt_metap('users_username_idx');
