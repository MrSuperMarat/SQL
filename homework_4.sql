-- 1

SELECT firstname FROM users u
JOIN messages m ON u.id = m.from_user_id
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY count(from_user_id) DESC
LIMIT 1;

-- 2

SELECT SUM(like_type) FROM profiles p
JOIN posts_likes pl ON p.user_id = pl.user_id
WHERE TIMESTAMPDIFF(YEAR, birthday, CURRENT_DATE) < 10;

-- 3
SELECT gender FROM profiles p
JOIN posts_likes pl ON p.user_id = pl.user_id
WHERE gender in ('m', 'f')
GROUP BY gender
ORDER BY SUM(like_type) DESC
LIMIT 1;