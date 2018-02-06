\i has_many_blogs.sql

-- SELECT * FROM users;

-- SELECT * FROM posts WHERE user_id = 100;

-- SELECT users.first_name, users.last_name
-- FROM posts
-- JOIN users on posts.id = users.id
-- WHERE users.id = 200;

-- SELECT *, users.username
-- FROM posts
-- JOIN users on posts.id = users.id
-- WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

-- SELECT users.username 
-- FROM users 
-- JOIN posts on posts.id = users.id
-- WHERE posts.created_at > '2015-01-01';

-- SELECT posts.title, posts.content, users.username
-- FROM posts
-- JOIN users on users.id = posts.user_id
-- WHERE users.created_at < '2015-01-01';

-- SELECT posts.title AS "Post Title"
-- FROM comments
-- JOIN posts on comments.post_id = posts.id;

-- SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
-- FROM comments
-- JOIN posts on comments.post_id = posts.id
-- WHERE posts.created_at < '2015-01-01';

SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM comments
JOIN posts on comments.post_id = posts.id
WHERE posts.created_at > '2015-01-01';

SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM comments
JOIN posts on comments.post_id = posts.id
WHERE comments.body ~ 'USB';

SELECT posts.title AS post_title, users.first_name, users.last_name, comments.body AS comment_body
FROM comments
JOIN posts on comments.post_id = posts.id
JOIN users on comments.user_id = users.id
WHERE comments.body ~ 'matrix';

SELECT users.first_name, users.last_name, comments.body AS comment_body
FROM comments
JOIN posts on comments.post_id = posts.id
JOIN users on comments.user_id = users.id
WHERE comments.body ~ 'SSL' AND posts.content ~ 'dolorum';

SELECT 
users.first_name AS post_author_first_name, 
users.last_name AS post_author_last_name, 
posts.title AS post_title, 
users.username AS comment_author_username, 
comments.body AS comment_body
FROM comments
JOIN posts on comments.post_id = posts.id
JOIN users on comments.user_id = users.id
WHERE posts.content ~ 'nemo' AND (comments.body ~ 'SSL' OR comments.body ~ 'firewall');



