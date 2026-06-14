COALESCE will return the first value different from NULL

NULL::BOOLEAN::INTEGER after conversion is still NULL


3 approaches

1. either and either
post
id url

comments
id content

likes
id user_id comment_id post_id

2. like_id and like_type
post
id url

comments
id content

likes
id user_id like_type likeable_id(id post or comment)
1  2       comment   3        
2  2       post      4        

3. separate table
post
id url

comments
id content

post_likes
id user_id post_id

comment_likes
id user_id comment_id
