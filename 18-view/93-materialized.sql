CREATE MATERIALIZED VIEW weekly_likes AS (
SELECT 
    date_trunc('week', COALESCE(p.created_at, c.created_at)) AS week, 
    COUNT(p.id) AS post_likes,
    COUNT(c.id) AS comment_likes
FROM likes l
LEFT JOIN posts p ON p.id = l.post_id
LEFT JOIN comments c ON c.id = l.comment_id
GROUP BY week
ORDER BY week
) WITH DATA;

REFRESH MATERIALIZED VIEW weekly_likes;

SELECT * from weekly_likes;