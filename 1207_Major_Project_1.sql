use social_media;
show tables;
-- Question !
select * from users;
select * from post;
SELECT post.post_id, users.username, post.caption, post.location
FROM post
JOIN users ON post.user_id = users.user_id
WHERE post.location IN ('Agra', 'Maharashtra', 'West Bengal');

-- Question 2
select * from hashtags;
select * from hashtag_follow;
select hashtags.hashtag_name,count(hashtag_follow.user_id) as count_of_follower 
from hashtags join hashtag_follow on hashtags.hashtag_id=hashtag_follow.hashtag_id
group by hashtags.hashtag_name order by count_of_follower desc limit 5;

-- question 3
select * from hashtags;
select * from post_tags;
select hashtags.hashtag_name,count(post_tags.post_id) as hashtag_counts 
from hashtags join post_tags on hashtags.hashtag_id=post_tags.hashtag_id
group by hashtags.hashtag_name order by hashtag_counts desc limit 10;

-- question 4
select * from users;
select * from post;
SELECT users.user_id, users.username, users.email
FROM users
LEFT JOIN post ON users.user_id = post.user_id
WHERE post.user_id IS NULL;

-- question 5
select * from post;
select * from post_likes;
SELECT post.post_id, post.caption, COUNT(post_likes.user_id) AS like_count
FROM post
LEFT JOIN post_likes ON post.post_id = post_likes.post_id
GROUP BY post.post_id, post.caption
ORDER BY like_count DESC;

-- question 6
select * from post;

SELECT AVG(post_count) AS average_posts_per_user
FROM (
SELECT user_id, COUNT(post_id) AS post_count
    FROM post
    GROUP BY user_id
) AS user_post_counts;

-- question 7
select * from login;

SELECT users.user_id, users.username, COUNT(login.ip) AS login_count
FROM users
LEFT JOIN login ON users.user_id = login.user_id
GROUP BY users.user_id, users.username;


-- question 8
select * from post_likes;
SELECT users.user_id, users.username
FROM users
JOIN (
    SELECT post_likes.user_id
    FROM post_likes
    GROUP BY post_likes.user_id
    HAVING COUNT(DISTINCT post_likes.post_id) = (SELECT COUNT(*) FROM post)
) AS users_liked_all_posts ON users.user_id = users_liked_all_posts.user_id;



-- question 9
SELECT users.user_id, users.username
FROM users
LEFT JOIN comments ON users.user_id = comments.user_id
WHERE comments.user_id IS NULL;



-- question 10
SELECT users.user_id, users.username
FROM users
JOIN (
    SELECT comments.user_id
    FROM comments
    GROUP BY comments.user_id
    HAVING COUNT(DISTINCT comments.post_id) = (SELECT COUNT(*) FROM post)
) AS users_commented_all_posts ON users.user_id = users_commented_all_posts.user_id;


-- question 11
SELECT users.user_id, users.username
FROM users
LEFT JOIN follows ON users.user_id = follows.followee_id
WHERE follows.followee_id IS NULL;

-- question 12
SELECT users.user_id, users.username
FROM users
LEFT JOIN follows ON users.user_id = follows.follower_id
WHERE follows.follower_id IS NULL;


-- question 13
SELECT users.user_id, users.username, COUNT(post.post_id) AS post_count
FROM users
JOIN post ON users.user_id = post.user_id
GROUP BY users.user_id, users.username
HAVING COUNT(post.post_id) > 5;

-- question 14
SELECT users.user_id, users.username, COUNT(follows.follower_id) AS follower_count
FROM users
LEFT JOIN follows ON users.user_id = follows.followee_id
GROUP BY users.user_id, users.username
HAVING COUNT(follows.follower_id) > 40;

-- question 15
SELECT comment_text
FROM comments
WHERE comment_text LIKE '%good%' OR comment_text LIKE '%beautiful%';


-- question 16

SELECT post_id, caption, LENGTH(caption) AS caption_length
FROM post
ORDER BY caption_length DESC
LIMIT 5;
