SELECT photo_id, contents FROM comments
GROUP BY photo_id, contents;

SELECT photo_id, COUNT(*), SUM(id) FROM comments
GROUP BY photo_id;
