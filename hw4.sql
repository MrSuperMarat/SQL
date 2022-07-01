-- Практическое задание по теме “Транзакции, переменные, представления”
-- 1

START TRANSACTION;

INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;

DELETE FROM shop.users WHERE id = 1;

COMMIT;

SELECT * FROM sample.users;
SELECT * FROM shop.users;

-- 2

CREATE OR REPLACE VIEW cp AS
SELECT p.name products, c.name catalogs FROM products p
JOIN catalogs c ON p.catalog_id = c.id;

SELECT * FROM cp;

-- 3

DROP TABLE IF EXISTS dates;

CREATE TABLE dates(
	created_at date
);

INSERT INTO dates
VALUES
('2018-08-01'),
('2016-08-04'),
('2018-08-16'),
('2018-08-17');

CREATE TEMPORARY TABLE numbers (
	num INT
);

INSERT INTO numbers VALUES
(0), (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12), (13), (14), (15),
(16), (17), (18), (19), (20), (21), (22), (23), (24), (25), (26), (27), (28), (29), (30);

SELECT days, created_at IS NOT NULL list FROM (SELECT ('2018-08-01' + INTERVAL n.num DAY) days FROM numbers n) a 
LEFT JOIN dates d ON a.days = d.created_at;

SELECT days, NOT ISNULL(d.created_at) list FROM (SELECT ('2018-08-01' + INTERVAL n.num DAY) days FROM numbers n) a 
LEFT JOIN dates d ON a.days = d.created_at;

-- 4

TRUNCATE TABLE dates;

INSERT INTO dates SELECT ('2018-08-01' + INTERVAL n.num DAY) days FROM numbers n;

SELECT * FROM dates;

SELECT @a := (SELECT * FROM dates ORDER BY created_at DESC LIMIT 4, 1);

SET @a := (SELECT * FROM dates ORDER BY created_at DESC LIMIT 4, 1);

SELECT @a;

DELETE FROM dates WHERE created_at < @a;

SELECT * FROM dates;

-- Второй вариант

TRUNCATE TABLE dates;

INSERT INTO dates SELECT ('2018-08-01' + INTERVAL n.num DAY) days FROM numbers n;

PREPARE del FROM 'DELETE FROM dates ORDER BY created_at LIMIT ?'

SELECT @b := (SELECT count(1) - 5 FROM dates);

EXECUTE del USING @b;

SELECT * FROM dates;

-- Третий вариант

DELETE * FROM dates
JOIN (SELECT created_at FROM dates ORDER BY created_at DESC LIMIT 5, 1) dat ON dates.created_at <= dat.created_at;

-- Практическое задание по теме “Администрирование MySQL” (эта тема изучается по вашему желанию)
-- 1

CREATE USER a, b IDENTIFIED BY 'b', c, d, shop;

GRANT ALL ON *.* TO a;

RENAME USER c TO shop_read, d TO e;

DROP USER b, e;

SELECT host, user FROM mysql.user;

SELECT USER();

GRANT SELECT ON shop.* TO shop_read;

GRANT ALL ON shop.* TO shop;

-- 2

USE shop;

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(25),
  password INT
);

CREATE OR REPLACE VIEW sr AS
SELECT id, name FROM accounts;

CREATE USER user_read;

GRANT SELECT ON shop.accounts TO user_read;

-- Практическое задание по теме “Хранимые процедуры и функции, триггеры"
-- 1

DELIMITER //

DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION hello()
RETURNS TINYTEXT READS SQL DATA
BEGIN
	CASE
		WHEN HOUR(NOW()) BETWEEN 6 AND 11 THEN RETURN 'Доброе утро';
		WHEN HOUR(NOW()) BETWEEN 12 AND 17 THEN RETURN 'Доброе утро';
		WHEN HOUR(NOW()) BETWEEN 18 AND 23 THEN RETURN 'Доброе утро';
		WHEN HOUR(NOW()) BETWEEN 0 AND 5 THEN RETURN 'Доброе утро';
	END CASE;
END//

DELIMITER ;

SELECT hello();

-- 2

DELIMITER //

DROP TRIGGER IF EXISTS ni//
CREATE TRIGGER ni BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT canceled';
	END IF;
END//

DELIMITER ;

INSERT INTO products (id) VALUES(10);

DELIMITER //

DROP TRIGGER IF EXISTS nu//
CREATE TRIGGER nu BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UPDATE canceled';
	END IF;
END//

DELIMITER ;

UPDATE products SET name = NULL, description = NULL WHERE id = 1;

-- 3

DELIMITER //

DROP FUNCTION IF EXISTS FIBONACCI//
CREATE FUNCTION FIBONACCI(n INT UNSIGNED)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE c INT DEFAULT 2;
	DECLARE k INT;
	DECLARE i INT DEFAULT 1;
	DECLARE j INT DEFAULT 1;
	CASE
		WHEN n = 0 THEN RETURN 0;
		WHEN n = 1 OR n = 2 THEN RETURN 1;
		WHEN n > 2 THEN
			WHILE c < n DO
				SET c = c + 1;
				SET k = j;
				SET j = i + j;
				SET i = k;
			END WHILE;
		RETURN j;
	END CASE;
END//

DELIMITER ;

SELECT FIBONACCI(10);