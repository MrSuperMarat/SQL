-- 1

SELECT * FROM orders;

INSERT INTO orders(user_id)
VALUES(1);

INSERT INTO orders_products (order_id, product_id, total)
SELECT LAST_INSERT_ID(), id, 2 FROM products;

SELECT * FROM orders_products;
SELECT * FROM orders;

TRUNCATE TABLE orders_products;

INSERT INTO orders(user_id)
SELECT id FROM users WHERE name = 'Наталья';

INSERT INTO orders(user_id)
SELECT id FROM users WHERE name = 'Иван';

INSERT INTO orders(user_id)
SELECT id FROM users WHERE name = 'Иван';

SELECT name FROM users WHERE id IN (SELECT user_id FROM orders);

-- 2

SELECT p.name, c.name FROM products p
LEFT JOIN catalogs c ON p.catalog_id = c.id;

-- 3

DROP TABLE IF EXISTS flights;

CREATE TABLE flights(
	id SERIAL PRIMARY KEY,
	`from` VARCHAR(10),
    `to` VARCHAR(10)
) COMMENT 'Расписание';

INSERT INTO flights(`from`, `to`) VALUES
('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');

CREATE TABLE cities(
	label VARCHAR(10) COMMENT 'Код города',
    name VARCHAR(10) COMMENT 'Название города'
) COMMENT = 'Словарь городов';

INSERT INTO cities(label, name) VALUES
('moscow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorod', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');

SELECT c.name, c1.name FROM flights f
LEFT JOIN cities c ON f.`from` = c.label
LEFT JOIN cities c1 ON f.`to` = c1.label;