CREATE DATABASE IF NOT EXISTS project;

USE project;

CREATE TEMPORARY TABLE IF NOT EXISTS garbage_table(
trans_id VARCHAR(100) NOT NULL,
trans_date VARCHAR(100) NOT NULL,
card_num VARCHAR(100) NOT NULL,
account_num VARCHAR(100) NOT NULL,
valid_to VARCHAR(100) NOT NULL,
client_id VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
first_name VARCHAR(100) NOT NULL,
patronymic VARCHAR(100) NOT NULL,
date_of_birth VARCHAR(100) NOT NULL,
passport_num VARCHAR(100) NOT NULL,
passport_valid_to VARCHAR(100) NOT NULL,
phone VARCHAR(100) NOT NULL,
oper_type VARCHAR(100) NOT NULL,
amt VARCHAR(100) NOT NULL,
oper_result VARCHAR(100) NOT NULL,
terminal_id VARCHAR(100) NOT NULL,
terminal_type VARCHAR(100) NOT NULL,
terminal_city VARCHAR(100) NOT NULL,
terminal_address VARCHAR(100) NOT NULL);

insert into garbage_table VALUES
('459272116','02.05.2020 04:23:39','45225706431745029511','40817810000003988510','05.12.2019','3-59321','Антощук','Игорь','Владимирович','11.09.1983','8108438217','02.05.2020','+79451696230','Снятие','15902,31','Успешно','POS20630','POS','Буинск','Буинск, ул. Гончара Олеся, д. 3'),
('459272136','02.05.2020 05:00:09','58961120289607500714','40817810000002751740','24.12.2022','2-37437','Рубахов','Никита','Михаилович','20.05.1977','1817664821','15.09.2024','+79463620365','Снятие','69972,62','Успешно','POS23811','POS','Шали','Шали, ул. Мельникова, д. 2'),
('459272158','02.05.2020 05:37:58','41026781924891487325','40817810000001204986','18.05.2031','2-87664','Штыкашов','Александр','Дмитриевич','01.09.1951','7915924107','22.12.2034','+79585879616','Пополнение','89097,66','Отказ','POS60871','POS','Гороховец','Гороховец, ул. Народовластия, д. 69'),
('459272159','02.05.2020 05:39:35','52490051113743406669','40817810000008035649','28.11.2021','3-59321','Антощук','Игорь','Владимирович','11.09.1983','8108438217','02.05.2020','+79451696230','Оплата','51935,72','Успешно','ATM92212','ATM','Димитровград','Димитровград, ул. Курская, д. 7'),
('459272173','02.05.2020 06:07:32','55767657395111848715','40817810000006821506','26.11.2032','8-16242','Наранов','Александр','Петрович','13.12.1969','2921864972','19.07.2032','+79753959402','Снятие','77169,82','Успешно','POS11310','POS','Пласт','Пласт, ул. Чайлытко, д. 46'),
('459272175','02.05.2020 06:11:43','54579316082521378375','40817810000003903178','06.06.2034','3-59321','Антощук','Игорь','Владимирович','11.09.1983','8108438217','02.05.2020','+79451696230','Пополнение','37391,47','Отказ','POS43792','POS','Славянск-на-Кубани','Славянск-на-Кубани, ул. Клецкая, д. 86'),
('459272211','02.05.2020 07:13:48','47510083545615404858','40817810000003909988','23.08.2037','5-21402','Ачентов','Николай','Кириллович','23.08.1947','3462335082','26.05.2028','+79143480318','Пополнение','75245,93','Успешно','ATM42463','ATM','Шахты','Шахты, ул. Фестивальный, д. 1'),
('459272225','02.05.2020 07:38:40','47248416671621197595','40817810000004486245','27.03.2020','9-98099','Городиловский','Михаил','Антонович','17.01.1974','8307742530','08.10.2022','+79211450416','Пополнение','8119,86','Успешно','POS82543','POS','Белая Калитва','Белая Калитва, ул. Шишковская, д. 46'),
('459272244','02.05.2020 08:11:02','55972149342687416635','40817810000008434729','12.10.2033','6-66509','Тепленко','Михаил','Кириллович','12.11.1965','4726387191','25.10.2029','+79817765776','Пополнение','81854,24','Успешно','ATM48336','ATM','Лагань','Лагань, ул. Старая Поляная, д. 1'),
('459272246','02.05.2020 08:13:41','49768774177561633620','40817810000007509222','14.12.2033','4-11318','Омелюшкин','Евгений','Кириллович','18.04.1989','2942912302','18.08.2023','+79235175107','Снятие','87868,59','Успешно','POS94907','POS','Сухой Лог','Сухой Лог, ул. Боричев Ток, д. 67');

-- DDL 5 основных таблиц

DROP TABLE IF EXISTS TERMINALS, CLIENTS, ACCOUNTS, CARDS, TRANSACTIONS;

CREATE TABLE IF NOT EXISTS TERMINALS(
terminal_id VARCHAR(8) NOT NULL,
terminal_type VARCHAR(3) NOT NULL,
terminal_city VARCHAR(50) NOT NULL,
terminal_address VARCHAR(100) NOT NULL,
UNIQUE KEY terminal_id (terminal_id)
);

CREATE TABLE IF NOT EXISTS CLIENTS(
client_id VARCHAR(7) NOT NULL,
last_name VARCHAR(50) NOT NULL,
first_name VARCHAR(50) NOT NULL,
patronymic VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
passport_num VARCHAR(10) NOT NULL,
passport_valid_to DATE NOT NULL,
phone VARCHAR(12) NOT NULL,
UNIQUE KEY client_id (client_id)
);

CREATE TABLE IF NOT EXISTS ACCOUNTS(
account_num VARCHAR(20) NOT NULL,
valid_to DATE NOT NULL,
client VARCHAR(7) NOT NULL,
UNIQUE KEY account_num (account_num),
FOREIGN KEY (client) REFERENCES clients(client_id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS CARDS(
card_num VARCHAR(20) NOT NULL,
account_num VARCHAR(20) NOT NULL,
UNIQUE KEY card_num (card_num),
FOREIGN KEY (account_num) REFERENCES accounts(account_num)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS TRANSACTIONS(
trans_id VARCHAR(9) NOT NULL,
trans_date DATETIME NOT NULL,
card_num VARCHAR(20) NOT NULL DEFAULT '00000000000000000000',
oper_type VARCHAR(20) NOT NULL,
amt DECIMAL(10, 2) NOT NULL,
oper_result VARCHAR(14) NOT NULL,
terminal VARCHAR(8) NOT NULL DEFAULT '00000000',
UNIQUE KEY trans_id (trans_id),
FOREIGN KEY (card_num) REFERENCES cards(card_num)
ON DELETE SET DEFAULT
ON UPDATE SET DEFAULT,
FOREIGN KEY (terminal) REFERENCES terminals(terminal_id)
ON DELETE SET DEFAULT
ON UPDATE SET DEFAULT
);

DROP TABLE IF EXISTS META_TERMINALS, META_CLIENTS, META_ACCOUNTS, META_CARDS, META_TRANSACTIONS;

CREATE TABLE META_TERMINALS(
num_update SERIAL,
datetime_update DATETIME NOT NULL DEFAULT NOW(),
inserts_count INT NOT NULL);

CREATE TABLE META_CLIENTS(
num_update SERIAL,
datetime_update DATETIME NOT NULL DEFAULT NOW(),
inserts_count INT NOT NULL);

CREATE TABLE META_ACCOUNTS(
num_update SERIAL,
datetime_update DATETIME NOT NULL DEFAULT NOW(),
inserts_count INT NOT NULL);

CREATE TABLE META_CARDS(
num_update SERIAL,
datetime_update DATETIME NOT NULL DEFAULT NOW(),
inserts_count INT NOT NULL);

CREATE TABLE IF NOT EXISTS META_TRANSACTIONS(
num_update SERIAL,
datetime_update DATETIME NOT NULL DEFAULT NOW(),
inserts_count INT NOT NULL);

DROP PROCEDURE IF EXISTS ETL;
DELIMITER //
CREATE PROCEDURE ETL()
BEGIN
	DECLARE old_counts_terminals, old_counts_clients, old_counts_accounts, old_counts_cards, old_counts_transactions INT;

SELECT count(1) FROM TERMINALS INTO old_counts_terminals;

INSERT INTO TERMINALS
(SELECT DISTINCT terminal_id,
                 terminal_type,
                 terminal_city,
                 terminal_address
    FROM garbage_table
    ORDER BY terminal_id, trans_date);

INSERT INTO META_TERMINALS (inserts_count)
(SELECT count(1)-old_counts_terminals FROM TERMINALS);

SELECT count(1) FROM CLIENTS INTO old_counts_clients;

INSERT INTO CLIENTS
(SELECT DISTINCT client_id,
                 last_name,
                 first_name,
                 patronymic,
                 CONCAT(SUBSTRING(date_of_birth, 7, 4), '-', SUBSTRING(date_of_birth, 4, 2), '-',
                     SUBSTRING(date_of_birth, 1, 2)) date_of_birth,
                 passport_num,
                 CONCAT(SUBSTRING(passport_valid_to, 7, 4), '-', SUBSTRING(passport_valid_to, 4, 2), '-',
                     SUBSTRING(passport_valid_to, 1, 2)) passport_valid_to,
                 phone
    FROM garbage_table
    ORDER BY client_id, trans_date DESC);

INSERT INTO META_CLIENTS (inserts_count)
(SELECT count(1)-old_counts_clients FROM CLIENTS);
   
SELECT count(1) FROM ACCOUNTS INTO old_counts_accounts;

INSERT INTO ACCOUNTS
(SELECT DISTINCT account_num,
        CONCAT(SUBSTRING(valid_to, 7, 4), '-', SUBSTRING(valid_to, 4, 2), '-', SUBSTRING(valid_to, 1, 2)),
        client_id
    FROM garbage_table
    ORDER BY account_num, trans_date);

INSERT INTO META_ACCOUNTS (inserts_count)
(SELECT count(1)-old_counts_accounts FROM ACCOUNTS);

SELECT count(1) FROM CARDS INTO old_counts_cards;

INSERT INTO CARDS
(SELECT DISTINCT card_num,
                 account_num
    FROM garbage_table
    ORDER BY card_num, trans_date);

INSERT INTO META_CARDS (inserts_count)
(SELECT count(1)-old_counts_cards FROM CARDS);

SELECT count(1) FROM TRANSACTIONS INTO old_counts_transactions;

INSERT INTO TRANSACTIONS
(SELECT trans_id,
        CONCAT(SUBSTRING(trans_date, 7, 4), '-', SUBSTRING(trans_date, 4, 2), '-',
        SUBSTRING(trans_date, 1, 2), ' ', SUBSTRING(trans_date, 12, 8)),
        card_num,
        oper_type,
        INSERT(amt, INSTR(amt, ','), 1, '.'),
        oper_result,
        terminal_id
    FROM garbage_table
    ORDER BY trans_id);

INSERT INTO META_TRANSACTIONS (inserts_count)
(SELECT count(1)-old_counts_transactions FROM TRANSACTIONS);

END//

DELIMITER ;

CALL ETL();