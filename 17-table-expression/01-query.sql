SELECT username, t.created_at FROM users u
JOIN (
    SELECT user_id, created_at FROM caption_tags
    UNION ALL
    SELECT user_id, created_at FROM photo_tags
) AS t ON t.user_id = u.id
WHERE t.created_at < '2010-01-07';


WITH AS tags (
    SELECT user_id, created_at FROM caption_tags
    UNION ALL
    SELECT user_id, created_at FROM photo_tags
) 
SELECT username, tags.created_at FROM users u
JOIN on tags.user_id = u.id
WHERE tags.created_at < '2010-01-07';
