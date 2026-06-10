
SELECT username, COUNT(*) FROM users u
JOIN (
    SELECT user_id FROM photo_tags
    UNION ALL 
    SELECT user_id FROM caption_tags
) AS tags ON u.id = tags.user_id
GROUP BY u.username
ORDER BY COUNT(*) DESC
LIMIT 10;

