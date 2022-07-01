DROP TABLE IF EXISTS posts;
CREATE TABLE posts
(
	user_id bigint unsigned NOT NULL,
	article varchar(100) NOT NULL,
	post text,
	likes bigint UNSIGNED DEFAULT 0,
	FOREIGN KEY(user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS interests;
CREATE TABLE interests
(
	user_id bigint unsigned NOT NULL PRIMARY KEY,
	hobby text,
	favorite_music text,
	favorite_films text,
	favorite_shows text,
	favorite_books text,
	favorite_games text,
	about_me text,
	FOREIGN KEY(user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS jobs;
CREATE TABLE jobs
(
	user_id bigint unsigned NOT NULL PRIMARY KEY,
	job varchar(100),
	firm varchar(100),
	date_hiring DATE,
	date_change DATE,
	status ENUM('Да', 'Нет') DEFAULT 'Да',
	FOREIGN KEY(user_id) REFERENCES users(id)
);