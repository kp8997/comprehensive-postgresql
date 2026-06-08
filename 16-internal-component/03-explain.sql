SELECT username, contents FROM users 
JOIN comments ON users.id = comments.user_id
WHERE username = 'Alyson14';

EXPLAIN SELECT username, contents FROM users 
JOIN comments ON users.id = comments.user_id
WHERE username = 'Alyson14';

EXPLAIN ANALYZE SELECT username, contents FROM users 
JOIN comments ON users.id = comments.user_id
WHERE username = 'Alyson14';
