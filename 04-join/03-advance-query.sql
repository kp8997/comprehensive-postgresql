-- Find the comments of users who comment on their own photos

SELECT c.contents, p.url, c.user_id, p.user_id FROM comments c JOIN photos p on p.id = c.photo_id
WHERE c.user_id = p.user_id;
