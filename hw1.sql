--1
C:\Users\Admin>mysql
mysql> CREATE DATABASE example;
mysql> USE example;
mysql> CREATE TABLE users(id serial, name varchar(10) NOT NULL unique);
mysql> quit;
--2
C:\Users\Admin>mysqldump example > example.sql
--3
C:\Users\Admin>mysql
mysql> create database sample;
mysql> exit;
C:\Users\Admin>mysql sample < example.sql
C:\Users\Admin>mysql
mysql> use sample;
mysql> show tables;
mysql> exit;
--4
C:\Users\Admin>mysqldump --skip.opt --where="1 limit 100" mysql help_keyword > dump.sql