-- Find the comments of users who comment on their own photos
-- also fetch the username

SELECT c.contents, p.url, u.username FROM comments c 
JOIN photos p on p.id = c.photo_id
JOIN users u on u.id = c.user_id AND u.id = p.user_id;