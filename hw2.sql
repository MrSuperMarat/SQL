-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”
-- 1

UPDATE users SET created_at = NOW(), updated_at = NOW();

SELECT * FROM users;

-- 2

ALTER TABLE users CHANGE created_at created_at DATETIME DEFAULT NOW() ON UPDATE NOW();

ALTER TABLE users MODIFY COLUMN updated_at DATETIME DEFAULT NOW() ON UPDATE NOW();

SELECT * FROM users;

-- 3

INSERT INTO storehouses_products (value) VALUES
(0),
(2500),
(0),
(30),
(500),
(1);

SELECT * FROM storehouses_products ORDER BY value = 0, value;

SELECT * FROM storehouses_products ORDER BY IF(value > 0, 0, 1), value;

-- 4

SELECT * FROM users WHERE MONTHNAME(birthday_at) IN ('may', 'august');

SELECT name FROM users WHERE DATE_FORMAT(birthday_at, '%M') IN ('may', 'august');

-- 5

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY id = 5 DESC, id = 1 DESC;

-- Практическое задание теме “Агрегация данных”
-- 1

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, CURRENT_DATE)) FROM users;

-- 2

SELECT DAYNAME(CONCAT(YEAR(NOW()), DATE_FORMAT(birthday_at, '-%m-%d'))) birthday, COUNT(1) count FROM users GROUP BY birthday;

SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') birthday, COUNT(1) count FROM users GROUP BY birthday;

-- 3

SELECT EXP(SUM(LN(id))) FROM users;