-- 3 highest id
SELECT * FROM users 
ORDER BY id DESC 
LIMIT 3;

-- all post of user with id 200, only show caption and username
SELECT p.caption, u.username FROM posts p
JOIN users u ON u.id = p.user_id
WHERE p.user_id = 200;

-- show number of likes that created by each username 
SELECT u.username, COUNT(*) as num_posts_liked FROM users u
JOIN likes l ON l.user_id = u.id
GROUP BY u.username
ORDER BY num_posts_liked DESC;




