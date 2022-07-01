-- 1

SELECT name from
(SELECT count(from_user_id), (SELECT firstname FROM users WHERE id = from_user_id) name FROM messages
WHERE to_user_id = (SELECT id FROM users WHERE firstname = 'Guadalupe')
GROUP BY from_user_id LIMIT 1) u;

-- 2

SELECT SUM(like_type) FROM posts_likes
WHERE user_id IN (SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, CURRENT_DATE) < 10);

-- 3

SELECT gender FROM
(SELECT SUM(like_type) sum_l, 'мужчины' gender FROM posts_likes
WHERE user_id IN (SELECT user_id FROM profiles WHERE gender = 'm')
UNION
SELECT SUM(like_type) sum_l, 'женщины' gender FROM posts_likes
WHERE user_id IN (SELECT user_id FROM profiles WHERE gender = 'f')) max_l
ORDER BY sum_l DESC LIMIT 1;