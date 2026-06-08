CREATE INDEX users_username_idx ON users (username);

-- DROP INDEX users_username_idx;
EXPLAIN ANALYZE SELECT * FROM users WHERE username = 'Emil30';

SELECT pg_size_pretty(pg_relation_size('users_username_idx'));

SELECT pg_size_pretty(pg_relation_size('users'));

-- index heap file
SELECT relname, relkind FROM pg_class WHERE relkind = 'i';

-- extension to query page inside index file
CREATE EXTENSION pageinspect;

-- query meta data about page of index file
SELECT * FROM bt_metap('users_username_idx');

-- query data index tree with leaf
SELECT * FROM bt_page_items('users_username_idx', 3);
