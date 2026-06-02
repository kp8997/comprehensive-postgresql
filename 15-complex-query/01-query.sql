-- 3 highest id
SELECT * FROM users 
ORDER BY id DESC 
LIMIT 3;

-- all post of user with id 200, only show caption and username
SELECT p.caption, u.username FROM posts p
JOIN users u ON u.id = p.user_id
WHERE p.user_id = 200;
