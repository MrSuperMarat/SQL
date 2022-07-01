-- Первое задание

INSERT INTO users (id, firstname, lastname, phone, email) VALUES
(3, 'Виктор', 'Алтушев', '99999999910', 'victor@mail.com'),
(6, 'Светлана', 'Иванова', '99999999911', 'svetlana@mail.com'),
(7, 'Елена', 'Абрамова', '99999999912', 'elena@mail.com'),
(8, 'Василиса', 'Кац', '99999999913', 'vasilisa@mail.com'),
(9, 'Антон', 'Сорокин', '99999999914', 'anton@mail.com'),
(10, 'Алёна', 'Алясева', '99999999915', 'alyona@mail.com'),
(11, 'Лиана', 'Белая', '99999999916', 'liana@mail.com'),
(12, 'Карина', 'Белая', '99999999917', 'carina@mail.com');

SELECT * FROM users;

INSERT INTO profiles VALUES (3, 'f', '1990-10-10', 3, 'Санкт-Петербург', 'Russia'); 
INSERT INTO profiles VALUES (4, 'm', '1994-09-03', 4, 'Казань', 'Russia'); 
INSERT INTO profiles VALUES (5, 'm', '1991-01-05', 5, 'Кострома', 'Russia'); 
INSERT INTO profiles VALUES (6, 'f', '1992-06-17', 6, 'Дмитров', 'Russia'); 
INSERT INTO profiles VALUES (7, 'f', '1987-05-29', 7, 'Псков', 'Russia'); 
INSERT INTO profiles VALUES (8, 'm', '1978-09-23', 8, 'Орел', 'Russia'); 
INSERT INTO profiles VALUES (9, 'x', '2013-10-04', 9, 'Орел', 'Russia'); 
INSERT INTO profiles VALUES (10, 'm', '1999-11-21', 10, 'Казань', 'Russia');

DELETE FROM profiles WHERE user_id > 2;

SELECT * FROM profiles;

INSERT INTO messages VALUES (DEFAULT, 1, 2, 'How are you?', DEFAULT, DEFAULT, TRUE);
INSERT INTO messages VALUES (DEFAULT, 2, 1, 'I am fine. And you?', DEFAULT, DEFAULT, TRUE);
INSERT INTO messages VALUES (DEFAULT, 1, 2, 'I am fine too. Maybe we will go for a walk tomorrow?', DEFAULT, DEFAULT, TRUE);
INSERT INTO messages VALUES (DEFAULT, 2, 1, 'Yes, I can.', DEFAULT, DEFAULT, TRUE);
INSERT INTO messages VALUES (DEFAULT, 1, 2, '6 pm?', DEFAULT, DEFAULT, TRUE);
INSERT INTO messages VALUES (DEFAULT, 2, 1, 'Maybe 8 pm?', DEFAULT, DEFAULT, TRUE);
INSERT INTO messages VALUES (DEFAULT, 1, 2, 'OK. See you soon.', DEFAULT, DEFAULT, TRUE);
INSERT INTO messages VALUES (DEFAULT, 2, 1, 'Bye', DEFAULT, DEFAULT, DEFAULT);

SELECT * FROM messages;

INSERT INTO friend_requests VALUES
(2, 4, 1),
(5, 15, 1),
(5, 18, 1),
(13, 20, 1),
(13, 4, 1),
(14, 5, 1),
(15, 5, DEFAULT),
(13, 19, 0),
(19, 2, 0);

SELECT * FROM friend_requests;

INSERT INTO communities VALUES
(2, 'Виктор Цой', 'Песни Виктора Цоя', 1),
(DEFAULT, 'Психология', 'Как перестать бояться', 2),
(DEFAULT, 'Психология', 'Как научиться прощать', 4),
(DEFAULT, 'Тайм-менеджмент', 'Как все успевать', 5),
(DEFAULT, 'Поиск работы', 'Нади работу мечты', 13),
(DEFAULT, 'Знакомства', 'Найди друзей', 14),
(DEFAULT, 'Терра', 'Клуб настольных игр', 15),
(DEFAULT, 'Русские шахматы', 'Найди партнеров для игры', 16),
(DEFAULT, 'Фокусы', 'Карточные фокусы', 1)

SELECT * FROM communities;

INSERT INTO communities_users VALUES
(3, 2),
(1, 4),
(3, 4),
(5, 5),
(5, 16),
(5, 17),
(7, 13),
(6, 13),
(8, 19);

SELECT * FROM communities_users;

INSERT INTO media_types VALUES
(DEFAULT, 'файл'),
(DEFAULT, 'видео'),
(DEFAULT, 'фотография'),
(DEFAULT, 'размытое изображение'),
(DEFAULT, 'гифка'),
(DEFAULT, 'ролик'),
(DEFAULT, 'аудио');

SELECT * FROM media_types;

INSERT INTO media VALUES
(DEFAULT, 2, 4, 'file.docx', 2048, DEFAULT),
(DEFAULT, 13, 4, 'file2.docx', 1024, DEFAULT),
(DEFAULT, 15, 4, 'file3.docx', 10, DEFAULT),
(DEFAULT, 16, 2, 'music.docx', 10, DEFAULT),
(DEFAULT, 4, 3, 'doc1.docx', DEFAULT, DEFAULT),
(DEFAULT, 4, 3, 'doc2.docx', DEFAULT, DEFAULT),
(DEFAULT, 4, 6, 'photo.jpg', NULL, DEFAULT);

SELECT * FROM media;

INSERT INTO posts VALUES
(1, 'Почему запрос не работает', 'Написал запрос, но он почему-то возвращает не то ...', 43),
(2, 'Оптимальное поле для валюты', 'Какое поле лучше подходит для хранения евро и долларов', 218),
(3, 'Как запустить сервер', 'С какими настройками лучше всего запускать сервер ...', 7361),
(4, 'Версия MySQL', 'На какой версии MySQL работает ваш проверяющий сервер?', 7),
(5, 'Не работает поиск', 'Всё делаю как описано в уроке, но поиск не работает', 245),
(6, 'Ошибка в Mysql', 'Подскажите, что означает эта ошибка ...', 144),
(7, 'Мое решение задачи', 'Скажите, а такое решение подойдет? ...', 116),
(6, 'Ошибка в тексте задачи', 'Добрый день, у вас опечатка в условии задачи', 565),
(1, 'Запрос с NULL', 'Почему запрос state = NULL выводит ошибки ...', 4515),
(10, 'Проблема', 'Пытаюсь выбрать все записи, но постоянно выскакивает ошибка Syntax Error.', 33);

SELECT * FROM posts;

INSERT INTO interests VALUES
(1, 'Спорт, фильмы', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT),
(2, DEFAULT, 'Виктор Цой', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT),
(3, DEFAULT, DEFAULT, 'Пираты Карибского моря', DEFAULT, DEFAULT, DEFAULT, DEFAULT),
(4, DEFAULT, DEFAULT, DEFAULT, 'Комеди Клаб', DEFAULT, DEFAULT, DEFAULT),
(5, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'Отверженные', DEFAULT, DEFAULT),
(6, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'Root', DEFAULT),
(7, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'Люблю проводить время с друзьями'),
(8, 'Спорт, фильмы', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT),
(9, 'Вышивание, танцы, спорт', 'Шансон, рок', 'Гарри Поттер, Властелин Колец', 'Дизель ШОУ, КВН', 'Судья Ди, Линь большой, Линь маленький', 'Шашки, шахматы', 'легкий и позитивный'),
(10, 'Спорт, фильмы', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'Люблю интеллектуальны отдых');

SELECT * FROM interests;

INSERT INTO jobs VALUES
(1, 'Стажер', 'ДКС', '2013-03-05', '2013-03-06', 'Да'),
(2, 'Младший разработчик', 'ДСИ', DEFAULT, DEFAULT, 'Нет'),
(3, 'Младший разработчик', 'А+', DEFAULT, DEFAULT, DEFAULT),
(4, 'Младший разработчик', 'ПТУ', DEFAULT, DEFAULT, DEFAULT),
(5, 'Разработчик', 'МГУ', DEFAULT, DEFAULT, DEFAULT),
(6, 'Старший разработчик', 'РТИ', '2013-03-06', DEFAULT, 'Да'),
(7, 'Программист', 'Ланит', DEFAULT, DEFAULT, DEFAULT),
(8, 'Инженер данных', 'КУБ', '2018-01-15', DEFAULT, DEFAULT),
(9, 'Ученый данных', 'ДСИ', DEFAULT, '2014-04-04', DEFAULT),
(10, 'Программист', 'Треолан', DEFAULT, DEFAULT, DEFAULT);

SELECT * FROM jobs;

-- Второе задание

SELECT DISTINCT firstname FROM users;

-- Третье задание

ALTER TABLE profiles ADD COLUMN is_active BOOL DEFAULT TRUE;
UPDATE profiles SET is_active = FALSE WHERE TIMESTAMPDIFF(YEAR, birthday, CURRENT_DATE) < 18;

-- Четвертое задание

DELETE FROM messages WHERE created_at > NOW();

-- Пятое задание

-- Работа Интернет-магазина