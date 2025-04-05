Microsoft Windows [Versión 10.0.22621.4317]
(c) Microsoft Corporation. Todos los derechos reservados.

C:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> create database pruebas;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> use pruebas
Database changed
MariaDB [pruebas]> create table personas (
    -> id int UNSIGNED auto_increment primary key,
    -> nombre varchar(100) not null,
    -> edad tinyint unsigned,
    -> nivel tinyint
    -> );
Query OK, 0 rows affected (0.024 sec)

MariaDB [pruebas]> show table:
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ':' at line 1
MariaDB [pruebas]> show tables;
+-------------------+
| Tables_in_pruebas |
+-------------------+
| personas          |
+-------------------+
1 row in set (0.001 sec)

MariaDB [pruebas]> describe personas;
+--------+---------------------+------+-----+---------+----------------+
| Field  | Type                | Null | Key | Default | Extra          |
+--------+---------------------+------+-----+---------+----------------+
| id     | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| nombre | varchar(100)        | NO   |     | NULL    |                |
| edad   | tinyint(3) unsigned | YES  |     | NULL    |                |
| nivel  | tinyint(4)          | YES  |     | NULL    |                |
+--------+---------------------+------+-----+---------+----------------+
4 rows in set (0.014 sec)

MariaDB [pruebas]> insert int personas
    -> (nombre,edad,nivel)
    -> values
    -> ('Ricardo Tapia',-8,5);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'int personas
(nombre,edad,nivel)
values
('Ricardo Tapia',-8,5)' at line 1
MariaDB [pruebas]> insert into personas
    -> (nombre,edad,nivel)
    -> values
    -> ('Ricardo Tapia',-8,5);
Query OK, 1 row affected, 1 warning (0.039 sec)

MariaDB [pruebas]> select * from personas;
+----+---------------+------+-------+
| id | nombre        | edad | nivel |
+----+---------------+------+-------+
|  1 | Ricardo Tapia |    0 |     5 |
+----+---------------+------+-------+
1 row in set (0.000 sec)

MariaDB [pruebas]> insert into personas
    -> (nombre,edad,nivel)
    -> values
    -> ('Armando Mesa',-15,10);
Query OK, 1 row affected, 1 warning (0.007 sec)

MariaDB [pruebas]> select * from personas;
+----+---------------+------+-------+
| id | nombre        | edad | nivel |
+----+---------------+------+-------+
|  1 | Ricardo Tapia |    0 |     5 |
|  2 | Armando Mesa  |    0 |    10 |
+----+---------------+------+-------+
2 rows in set (0.000 sec)

MariaDB [pruebas]> insert into personas
    -> (nombre,edad,nivel)
    -> values
    -> ('Zacarias Flores',22,7);
Query OK, 1 row affected (0.007 sec)

MariaDB [pruebas]> select * from personas;
+----+-----------------+------+-------+
| id | nombre          | edad | nivel |
+----+-----------------+------+-------+
|  1 | Ricardo Tapia   |    0 |     5 |
|  2 | Armando Mesa    |    0 |    10 |
|  3 | Zacarias Flores |   22 |     7 |
+----+-----------------+------+-------+
3 rows in set (0.000 sec)

MariaDB [pruebas]> create table balance(
    -> id int auto_increment primary key,
    -> saldo decimal(10,2),
    -> iva decimal((4,2)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(4,2)
)' at line 4
MariaDB [pruebas]> create table balance(
    -> id int auto_increment primary key,
    -> saldo decimal(10,2),
    -> iva decimal(4,2)
    -> );
Query OK, 0 rows affected (0.034 sec)

MariaDB [pruebas]> insert into balance
    -> (saldo,iva)
    -> values
    -> (12345678.90,12.34);
Query OK, 1 row affected (0.008 sec)

MariaDB [pruebas]> insert into balance
    -> (saldo,iva)
    -> values
    -> (1234567890.90,12.34);
Query OK, 1 row affected, 1 warning (0.007 sec)

MariaDB [pruebas]> select *from balance
    -> ;
+----+-------------+-------+
| id | saldo       | iva   |
+----+-------------+-------+
|  1 | 12345678.90 | 12.34 |
|  2 | 99999999.99 | 12.34 |
+----+-------------+-------+
2 rows in set (0.000 sec)

MariaDB [pruebas]> insert into balance
    -> (saldo,iva)
    -> values
    -> (5078.77,125.34);
Query OK, 1 row affected, 1 warning (0.007 sec)

MariaDB [pruebas]> select *from balance;
+----+-------------+-------+
| id | saldo       | iva   |
+----+-------------+-------+
|  1 | 12345678.90 | 12.34 |
|  2 | 99999999.99 | 12.34 |
|  3 |     5078.77 | 99.99 |
+----+-------------+-------+
3 rows in set (0.000 sec)

MariaDB [pruebas]> create table cientifico(
    -> id int auto_increment primary key,
    -> atomos float,
    -> distancia double
    -> );
Query OK, 0 rows affected (0.027 sec)

MariaDB [pruebas]> insert into cientifico
    -> (atomos,distancia)
    -> values
    -> (125.457,45.59);
Query OK, 1 row affected (0.007 sec)

MariaDB [pruebas]> select *from cientifico
    -> ;
+----+---------+-----------+
| id | atomos  | distancia |
+----+---------+-----------+
|  1 | 125.457 |     45.59 |
+----+---------+-----------+
1 row in set (0.000 sec)

MariaDB [pruebas]> create table config(
    -> flags bit(8)
    -> );
Query OK, 0 rows affected (0.034 sec)

MariaDB [pruebas]> describe config;
+-------+--------+------+-----+---------+-------+
| Field | Type   | Null | Key | Default | Extra |
+-------+--------+------+-----+---------+-------+
| flags | bit(8) | YES  |     | NULL    |       |
+-------+--------+------+-----+---------+-------+
1 row in set (0.016 sec)

MariaDB [pruebas]> insert into config values(b'10101010');
Query OK, 1 row affected (0.007 sec)

MariaDB [pruebas]> select *from config;
+-------+
| flags |
+-------+
| ¬     |
+-------+
1 row in set (0.000 sec)

MariaDB [pruebas]> select bin(flags) from config;
+------------+
| bin(flags) |
+------------+
| 10101010   |
+------------+
1 row in set (0.000 sec)

MariaDB [pruebas]> create table eventos(
    -> fecha_evento DATE,
    -> fecha_registro DATE default CURRENT_DATE
    -> );
Query OK, 0 rows affected (0.034 sec)

MariaDB [pruebas]> insert into eventos
    -> (fecha_evento)
    -> values
    -> ('2025-12-25');
Query OK, 1 row affected (0.007 sec)

MariaDB [pruebas]> select *from eventos;
+--------------+----------------+
| fecha_evento | fecha_registro |
+--------------+----------------+
| 2025-12-25   | 2025-04-04     |
+--------------+----------------+
1 row in set (0.000 sec)

MariaDB [pruebas]> create table horarios(
    -> hora_inicio TIME,
    -> hora_fin TIME
    -> );
Query OK, 0 rows affected (0.032 sec)

MariaDB [pruebas]> insert into horarios
    -> (hora_inicio,hora_fin)
    -> values
    -> ('00:30:00','18:00:00');
Query OK, 1 row affected (0.007 sec)

MariaDB [pruebas]> select *from horarios;
+-------------+----------+
| hora_inicio | hora_fin |
+-------------+----------+
| 00:30:00    | 18:00:00 |
+-------------+----------+
1 row in set (0.000 sec)

MariaDB [pruebas]> create table registros(
    -> fecha_hora datetime default current_timestamp
    -> );
Query OK, 0 rows affected (0.011 sec)

MariaDB [pruebas]> insert into registros values('2025-04-04' 13:30:15);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '13:30:15)' at line 1
MariaDB [pruebas]> insert into registros values('2025-04-04 13:30:15');
Query OK, 1 row affected (0.008 sec)

MariaDB [pruebas]> select *from registros;
+---------------------+
| fecha_hora          |
+---------------------+
| 2025-04-04 13:30:15 |
+---------------------+
1 row in set (0.000 sec)

MariaDB [pruebas]> create table logs (
    -> accion varchar(100),
    -> creado_en timestamp default current_timestamp
    -> on update current_timestamp
    -> );
Query OK, 0 rows affected (0.028 sec)

MariaDB [pruebas]> insert into logs
    -> (accion)
    -> values
    -> ('usuario inicio sesion');
Query OK, 1 row affected (0.008 sec)

MariaDB [pruebas]> insert into logs
    -> (accion)
    -> values
    -> ('usuario cambio password');
Query OK, 1 row affected (0.006 sec)

MariaDB [pruebas]> select * from logs;
+-------------------------+---------------------+
| accion                  | creado_en           |
+-------------------------+---------------------+
| usuario inicio sesion   | 2025-04-04 13:27:38 |
| usuario cambio password | 2025-04-04 13:28:07 |
+-------------------------+---------------------+
2 rows in set (0.000 sec)

MariaDB [pruebas]> create table vehiculos(
    -> modelo year(4),
    -> fabricacion year(2)
    -> );
Query OK, 0 rows affected, 1 warning (0.040 sec)

MariaDB [pruebas]> describe vehiculos;
+-------------+---------+------+-----+---------+-------+
| Field       | Type    | Null | Key | Default | Extra |
+-------------+---------+------+-----+---------+-------+
| modelo      | year(4) | YES  |     | NULL    |       |
| fabricacion | year(2) | YES  |     | NULL    |       |
+-------------+---------+------+-----+---------+-------+
2 rows in set (0.018 sec)

MariaDB [pruebas]> inset into vehiculos
    -> (modelo,fabricacion)
    -> values
    -> (2023,15);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'inset into vehiculos
(modelo,fabricacion)
values
(2023,15)' at line 1
MariaDB [pruebas]> insert into vehiculos
    -> (modelo,fabricacion)
    -> values
    -> (2023,15);
Query OK, 1 row affected (0.006 sec)

MariaDB [pruebas]> select *from vehiculos
    -> ;
+--------+-------------+
| modelo | fabricacion |
+--------+-------------+
|   2023 |          15 |
+--------+-------------+
1 row in set (0.000 sec)

MariaDB [pruebas]> select now();
+---------------------+
| now()               |
+---------------------+
| 2025-04-04 13:34:02 |
+---------------------+
1 row in set (0.000 sec)

MariaDB [pruebas]> select curdate();
+------------+
| curdate()  |
+------------+
| 2025-04-04 |
+------------+
1 row in set (0.000 sec)

MariaDB [pruebas]> select curtime();
+-----------+
| curtime() |
+-----------+
| 13:34:36  |
+-----------+
1 row in set (0.000 sec)

MariaDB [pruebas]> select now(), curdate(), curtime();
+---------------------+------------+-----------+
| now()               | curdate()  | curtime() |
+---------------------+------------+-----------+
| 2025-04-04 13:35:17 | 2025-04-04 | 13:35:17  |
+---------------------+------------+-----------+
1 row in set (0.000 sec)

MariaDB [pruebas]> select *from eventos;
+--------------+----------------+
| fecha_evento | fecha_registro |
+--------------+----------------+
| 2025-12-25   | 2025-04-04     |
+--------------+----------------+
1 row in set (0.000 sec)

MariaDB [pruebas]> select day(fecha_evento), monthname(fecha_evento), year(fecha_evento), from eventos;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'from eventos' at line 1
MariaDB [pruebas]> select day(fecha_evento), monthname(fecha_evento), year(fecha_evento) from eventos;
+-------------------+-------------------------+--------------------+
| day(fecha_evento) | monthname(fecha_evento) | year(fecha_evento) |
+-------------------+-------------------------+--------------------+
|                25 | December                |               2025 |
+-------------------+-------------------------+--------------------+
1 row in set (0.000 sec)

MariaDB [pruebas]> select date_format(now(),'%w, %d de %m de %y');
+-----------------------------------------+
| date_format(now(),'%w, %d de %m de %y') |
+-----------------------------------------+
| 5, 04 de 04 de 25                       |
+-----------------------------------------+
1 row in set (0.000 sec)

MariaDB [pruebas]> select date_format(now(),'%W, %d de %M de %Y');
+-----------------------------------------+
| date_format(now(),'%W, %d de %M de %Y') |
+-----------------------------------------+
| Friday, 04 de April de 2025             |
+-----------------------------------------+
1 row in set (0.000 sec)

MariaDB [pruebas]> Select datediff('2025-00-20','2025-03-05');
+-------------------------------------+
| datediff('2025-00-20','2025-03-05') |
+-------------------------------------+
|                                NULL |
+-------------------------------------+
1 row in set, 1 warning (0.000 sec)

MariaDB [pruebas]> Select datediff('2025-03-05','2025-00-20');
+-------------------------------------+
| datediff('2025-03-05','2025-00-20') |
+-------------------------------------+
|                                NULL |
+-------------------------------------+
1 row in set, 1 warning (0.000 sec)

MariaDB [pruebas]> create table clientes(
    -> id int auto_increment PRIMARY KEY,
    -> nombre varchar(100) not null
    -> );
Query OK, 0 rows affected (0.014 sec)

MariaDB [pruebas]> create table pedidos(
    -> id int PRIMARY KEY,
    -> cliente_id int,
    -> FOREIGN KEY (cliente_id) REFERENCES clientes(id)
    -> );
Query OK, 0 rows affected (0.031 sec)

MariaDB [pruebas]> create table usuarios(
    -> email varchar(100) UNIQUE
    -> );
Query OK, 0 rows affected (0.060 sec)

MariaDB [pruebas]> insert into usuarios
    -> (email)
    -> values
    -> ('bruno@mail.com');
Query OK, 1 row affected (0.008 sec)

MariaDB [pruebas]> select *from usuarios;
+----------------+
| email          |
+----------------+
| bruno@mail.com |
+----------------+
1 row in set (0.000 sec)

MariaDB [pruebas]> insert into usuarios
    -> (email)
    -> values
    -> ('bruno@mail.com');
ERROR 1062 (23000): Duplicate entry 'bruno@mail.com' for key 'email'
MariaDB [pruebas]> show tables;
+-------------------+
| Tables_in_pruebas |
+-------------------+
| balance           |
| cientifico        |
| clientes          |
| config            |
| eventos           |
| horarios          |
| logs              |
| pedidos           |
| personas          |
| registros         |
| usuarios          |
| vehiculos         |
+-------------------+
12 rows in set (0.001 sec)

MariaDB [pruebas]> create table productos(
    -> precio decimal(10,2) CHEK (precio>0),
    -> stock int CHEK(stock >=0)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(precio>0),
stock int CHEK(stock >=0)
)' at line 2
MariaDB [pruebas]> create table productos(
    -> precio decimal(10,2) CHEK ( precio > 0),
    -> stock int CHEK( stock >= 0)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '( precio > 0),
stock int CHEK( stock >= 0)
)' at line 2
MariaDB [pruebas]> create table productos(
    -> precio decimal(10,2) CHEK (precio>0,0),
    -> stock int Chek ( stock >= 0):;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(precio>0,0),
stock int Chek ( stock >= 0):' at line 2
MariaDB [pruebas]> create table productos(
    -> precio decimal(10,2) CHECK (precio>0),
    -> stock int Check ( stock >= 0)
    -> );
Query OK, 0 rows affected (0.040 sec)

MariaDB [pruebas]> describe productos;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| precio | decimal(10,2) | YES  |     | NULL    |       |
| stock  | int(11)       | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
2 rows in set (0.015 sec)

MariaDB [pruebas]> insert into productos
    -> (precio,stock)
    -> values
    -> (15.15,10);
Query OK, 1 row affected (0.009 sec)

MariaDB [pruebas]> select *from productos;
+--------+-------+
| precio | stock |
+--------+-------+
|  15.15 |    10 |
+--------+-------+
1 row in set (0.000 sec)

MariaDB [pruebas]>
