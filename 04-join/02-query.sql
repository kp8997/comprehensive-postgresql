SELECT p.id as photo_id, c.id as comment_id, c.contents as comment
FROM comments c
INNER JOIN photos p on p.id = c.photo_id
ORDER BY photo_id, comment_id;


-- similar variable between 'as' and no 'as'
-- SELECT p.id as photo_id, c.id as comment_id, c.contents as comment
-- FROM comments as c
-- INNER JOIN photos as p on p.id = c.photo_id
-- ORDER BY photo_id, comment_id;
