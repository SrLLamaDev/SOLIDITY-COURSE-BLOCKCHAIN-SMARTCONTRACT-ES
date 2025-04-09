Microsoft Windows [Versión 10.0.22631.5039]
(c) Microsoft Corporation. Todos los derechos reservados.

C:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 14
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| app                |
| baseprueba         |
| biblioteca         |
| biblioteca2        |
| casas              |
| contactos          |
| examen             |
| examenf            |
| grupo_lunes        |
| information_schema |
| inmobiliaria       |
| mysql              |
| performance_schema |
| phpmyadmin         |
| pruebas            |
| restaurante        |
| sakila             |
| seguridad_ejemplo  |
| test               |
+--------------------+
19 rows in set (0.001 sec)

MariaDB [(none)]> CREATE DATABASE practica;
Query OK, 1 row affected (0.014 sec)

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| app                |
| baseprueba         |
| biblioteca         |
| biblioteca2        |
| casas              |
| contactos          |
| examen             |
| examenf            |
| grupo_lunes        |
| information_schema |
| inmobiliaria       |
| mysql              |
| performance_schema |
| phpmyadmin         |
| practica           |
| pruebas            |
| restaurante        |
| sakila             |
| seguridad_ejemplo  |
| test               |
+--------------------+
20 rows in set (0.002 sec)

MariaDB [(none)]> use practicas
ERROR 1049 (42000): Unknown database 'practicas'
MariaDB [(none)]> use practica
Database changed
MariaDB [practica]> CREATE TABLE Cycles (
    -> CycleId VARCHAR(10) PRIMARY KEY,
    -> CycleDescription VARCHAR(100) NOT NULL,
    -> CycleEndDate DATE NOT NULL,
    -> CycleStartDate DATE NOT NULL,
    -> VacationStartDate DATE,
    -> VacationEndDate DATE
    -> );
Query OK, 0 rows affected (0.063 sec)

MariaDB [practica]> CREATE TABLE Courses (
    -> CourseId VARCHAR(10) PRIMARY KEY,
    -> CourseDescription VARCHAR(100) NOT NULL,
    -> Abstract TEXT NOT NULL,
    -> Bibliography TEXT NOT NULL
    -> );
Query OK, 0 rows affected (0.012 sec)

MariaDB [practica]> CREATE TABLE Categories (
    -> CategoryId VARCHAR(10) PRIMARY KEY,
    -> CategoryDescri VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.024 sec)

MariaDB [practica]> CREATE TABLE CoursesPerCycle (
    -> CourseId VARCHAR(10),
    -> CycleId VARCHAR(10),
    -> CourseStartDate DATE NOT NULL,
    -> CourseEndDate DATE NOT NULL,
    -> PRIMARY KEY (CourseId, CycleId),
    -> FOREIGN KEY (CourseId) REFERENCES Courses(CourseId),
    -> FOREIGN KEY (CycleId) REFERENCES Cycles(CycleId)
    -> );
Query OK, 0 rows affected (0.032 sec)

MariaDB [practica]> CREATE TABLE Teachers (
    -> TeacherId VARCHAR(10) PRIMARY KEY,
    -> TeacherName VARCHAR(100) NOT NULL,
    -> Email VARCHAR(100),
    -> PhoneNo VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.024 sec)

MariaDB [practica]> CREATE TABLE TeachersPerCourse (
    -> CourseId VARCHAR(10),
    -> CycleId VARCHAR(10),
    -> TeacherId VARCHAR(10),
    -> PRIMARY KEY (CourseId, CycleId, TeacherId),
    -> FOREIGN KEY (CourseId, CycleId) REFERENCES CoursesPerCycle(CourseId, CycleId),
    -> FOREIGN KEY (TeacherId) REFERENCES Teachers(TeacherId)
    -> );
Query OK, 0 rows affected (0.029 sec)

MariaDB [practica]> CREATE TABLE Students (
    -> StudentId VARCHAR(10) PRIMARY KEY,
    -> StudentName VARCHAR(100) NOT NULL,
    -> Email VARCHAR(100) NOT NULL,
    -> BirthDate DATE,
    -> PhoneNo VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.024 sec)

MariaDB [practica]> CREATE TABLE Enrollments (
    -> CourseId VARCHAR(10),
    -> CycleId VARCHAR(10),
    -> StudentId VARCHAR(10),
    -> EnrollmentDate DATE NOT NULL,
    -> Cancelled BOOLEAN NOT NULL,
    -> CancellationReason VARCHAR(100),
    -> PRIMARY KEY (CourseId, CycleId, StudentId),
    -> FOREIGN KEY (CourseId, CycleId) REFERENCES CoursesPerCycle(CourseId, CycleId),
    -> FOREIGN KEY (StudentId) REFERENCES Students(StudentId)
    -> );
Query OK, 0 rows affected (0.039 sec)

MariaDB [practica]> CREATE TABLE Classes (
    ->  CourseId VARCHAR(10),
    -> CycleId VARCHAR(10),
    -> ClassNo INT,
    -> TeacherId VARCHAR(10),
    -> ClassTitle VARCHAR(100) NOT NULL,
    -> ClassDate DATE NOT NULL,
    -> StartTime TIME NOT NULL,
    -> EndTime TIME NOT NULL,
    -> PRIMARY KEY (CourseId, CycleId, ClassNo),
    -> FOREIGN KEY (CourseId, CycleId) REFERENCES CoursesPerCycle(CourseId, CycleId),
    -> FOREIGN KEY (TeacherId) REFERENCES Teachers(TeacherId)
    -> );
Query OK, 0 rows affected (0.041 sec)

MariaDB [practica]> CREATE TABLE Attendance (
    -> CourseId VARCHAR(10),
    -> CycleId VARCHAR(10),
    -> ClassNo INT,
    -> StudentId VARCHAR(10),
    -> TimeArrive TIME,
    -> TimeLeave TIME,
    -> PRIMARY KEY (CourseId, CycleId, ClassNo, StudentId),
    -> FOREIGN KEY (CourseId, CycleId, ClassNo) REFERENCES Classes(CourseId, CycleId, ClassNo),
    -> FOREIGN KEY (StudentId) REFERENCES Students(StudentId)
    -> );
Query OK, 0 rows affected (0.028 sec)

MariaDB [practica]> CREATE TABLE Tests (
    -> CourseId VARCHAR(10),
    -> CycleId VARCHAR(10),
    -> TestNo INT,
    -> TestDate DATE NOT NULL,
    -> TestTime TIME NOT NULL,
    -> Agenda TEXT NOT NULL,
    -> PRIMARY KEY (CourseId, CycleId, TestNo),
    -> FOREIGN KEY (CourseId, CycleId) REFERENCES CoursesPerCycle(CourseId, CycleId)
    -> );
Query OK, 0 rows affected (0.024 sec)

MariaDB [practica]> CREATE TABLE TestScores (
    -> CourseId VARCHAR(10),
    -> CycleId VARCHAR(10),
    -> TestNo INT,
    -> StudentId VARCHAR(10),
    -> Score DECIMAL(5, 2) NOT NULL,
    -> PRIMARY KEY (CourseId, CycleId, TestNo, StudentId),
    -> FOREIGN KEY (CourseId, CycleId, TestNo) REFERENCES Tests(CourseId, CycleId, TestNo),
    -> FOREIGN KEY (StudentId) REFERENCES Students(StudentId)
    -> );
Query OK, 0 rows affected (0.040 sec)

MariaDB [practica]> show tables;
+--------------------+
| Tables_in_practica |
+--------------------+
| attendance         |
| categories         |
| classes            |
| courses            |
| coursespercycle    |
| cycles             |
| enrollments        |
| students           |
| teachers           |
| teacherspercourse  |
| tests              |
| testscores         |
+--------------------+
12 rows in set (0.001 sec)

MariaDB [practica]> describe attendance;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| CourseId   | varchar(10) | NO   | PRI | NULL    |       |
| CycleId    | varchar(10) | NO   | PRI | NULL    |       |
| ClassNo    | int(11)     | NO   | PRI | NULL    |       |
| StudentId  | varchar(10) | NO   | PRI | NULL    |       |
| TimeArrive | time        | YES  |     | NULL    |       |
| TimeLeave  | time        | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.028 sec)

MariaDB [practica]> describe categories;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| CategoryId     | varchar(10)  | NO   | PRI | NULL    |       |
| CategoryDescri | varchar(100) | NO   |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
2 rows in set (0.022 sec)

MariaDB [practica]> describe classes
    -> ;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| CourseId   | varchar(10)  | NO   | PRI | NULL    |       |
| CycleId    | varchar(10)  | NO   | PRI | NULL    |       |
| ClassNo    | int(11)      | NO   | PRI | NULL    |       |
| TeacherId  | varchar(10)  | YES  | MUL | NULL    |       |
| ClassTitle | varchar(100) | NO   |     | NULL    |       |
| ClassDate  | date         | NO   |     | NULL    |       |
| StartTime  | time         | NO   |     | NULL    |       |
| EndTime    | time         | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
8 rows in set (0.017 sec)

MariaDB [practica]> describe courses;
+-------------------+--------------+------+-----+---------+-------+
| Field             | Type         | Null | Key | Default | Extra |
+-------------------+--------------+------+-----+---------+-------+
| CourseId          | varchar(10)  | NO   | PRI | NULL    |       |
| CourseDescription | varchar(100) | NO   |     | NULL    |       |
| Abstract          | text         | NO   |     | NULL    |       |
| Bibliography      | text         | NO   |     | NULL    |       |
+-------------------+--------------+------+-----+---------+-------+
4 rows in set (0.034 sec)

MariaDB [practica]> describe coursespercycle;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| CourseId        | varchar(10) | NO   | PRI | NULL    |       |
| CycleId         | varchar(10) | NO   | PRI | NULL    |       |
| CourseStartDate | date        | NO   |     | NULL    |       |
| CourseEndDate   | date        | NO   |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
4 rows in set (0.037 sec)

MariaDB [practica]> describe cycles;
+-------------------+--------------+------+-----+---------+-------+
| Field             | Type         | Null | Key | Default | Extra |
+-------------------+--------------+------+-----+---------+-------+
| CycleId           | varchar(10)  | NO   | PRI | NULL    |       |
| CycleDescription  | varchar(100) | NO   |     | NULL    |       |
| CycleEndDate      | date         | NO   |     | NULL    |       |
| CycleStartDate    | date         | NO   |     | NULL    |       |
| VacationStartDate | date         | YES  |     | NULL    |       |
| VacationEndDate   | date         | YES  |     | NULL    |       |
+-------------------+--------------+------+-----+---------+-------+
6 rows in set (0.040 sec)

MariaDB [practica]> describe enrrollments;
ERROR 1146 (42S02): Table 'practica.enrrollments' doesn't exist
MariaDB [practica]> describe enrollments;
+--------------------+--------------+------+-----+---------+-------+
| Field              | Type         | Null | Key | Default | Extra |
+--------------------+--------------+------+-----+---------+-------+
| CourseId           | varchar(10)  | NO   | PRI | NULL    |       |
| CycleId            | varchar(10)  | NO   | PRI | NULL    |       |
| StudentId          | varchar(10)  | NO   | PRI | NULL    |       |
| EnrollmentDate     | date         | NO   |     | NULL    |       |
| Cancelled          | tinyint(1)   | NO   |     | NULL    |       |
| CancellationReason | varchar(100) | YES  |     | NULL    |       |
+--------------------+--------------+------+-----+---------+-------+
6 rows in set (0.045 sec)

MariaDB [practica]> describe students;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| StudentId   | varchar(10)  | NO   | PRI | NULL    |       |
| StudentName | varchar(100) | NO   |     | NULL    |       |
| Email       | varchar(100) | NO   |     | NULL    |       |
| BirthDate   | date         | YES  |     | NULL    |       |
| PhoneNo     | varchar(30)  | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
5 rows in set (0.036 sec)

MariaDB [practica]> describe teachers;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| TeacherId   | varchar(10)  | NO   | PRI | NULL    |       |
| TeacherName | varchar(100) | NO   |     | NULL    |       |
| Email       | varchar(100) | YES  |     | NULL    |       |
| PhoneNo     | varchar(100) | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
4 rows in set (0.018 sec)

MariaDB [practica]> describe teacherspercourse;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| CourseId  | varchar(10) | NO   | PRI | NULL    |       |
| CycleId   | varchar(10) | NO   | PRI | NULL    |       |
| TeacherId | varchar(10) | NO   | PRI | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.026 sec)

MariaDB [practica]> describe tests;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| CourseId | varchar(10) | NO   | PRI | NULL    |       |
| CycleId  | varchar(10) | NO   | PRI | NULL    |       |
| TestNo   | int(11)     | NO   | PRI | NULL    |       |
| TestDate | date        | NO   |     | NULL    |       |
| TestTime | time        | NO   |     | NULL    |       |
| Agenda   | text        | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
6 rows in set (0.026 sec)

MariaDB [practica]> describe testscores;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| CourseId  | varchar(10)  | NO   | PRI | NULL    |       |
| CycleId   | varchar(10)  | NO   | PRI | NULL    |       |
| TestNo    | int(11)      | NO   | PRI | NULL    |       |
| StudentId | varchar(10)  | NO   | PRI | NULL    |       |
| Score     | decimal(5,2) | NO   |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
5 rows in set (0.033 sec)

MariaDB [practica]> INSERT INTO Cycles VALUES
    -> ('CYC001', 'Ciclo Primavera 2024', '2024-06-30', '2024-01-15', '2024-04-01', '2024-04-07'),
    -> ('CYC002', 'Ciclo Verano 2024', '2024-08-30', '2024-07-01', NULL, NULL),
    -> ('CYC003', 'Ciclo Otoño 2024', '2024-12-20', '2024-09-01', '2024-11-01', '2024-11-07'),
    -> ('CYC004', 'Ciclo Invierno 2025', '2025-02-28', '2025-01-10', NULL, NULL),
    -> ('CYC005', 'Ciclo Especial 2025', '2025-04-30', '2025-03-01', NULL, NULL);
Query OK, 5 rows affected (0.015 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [practica]> INSERT INTO Courses VALUES
    -> ('MAT101', 'Matemáticas I', 'Álgebra y trigonometría básica.', 'Libros de Baldor y Stewart.'),
    -> ('CS101', 'Intro a la Programación', 'Fundamentos de programación en Python.', 'Automate the Boring Stuff.'),
    -> ('PHY101', 'Física I', 'Mecánica clásica.', 'Resnick y Halliday.'),
    -> ('CHE101', 'Química General', 'Teoría atómica y enlaces químicos.', 'Brown, LeMay.'),
    -> ('ENG101', 'Inglés Técnico', 'Vocabulario técnico para ingeniería.', 'Oxford Technical English.');
Query OK, 5 rows affected (0.004 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [practica]> INSERT INTO Categories VALUES
    -> ('CAT01', 'Ciencias Exactas'),
    -> ('CAT02', 'Tecnología'),
    -> ('CAT03', 'Humanidades'),
    -> ('CAT04', 'Idiomas'),
    -> ('CAT05', 'Ingeniería');
Query OK, 5 rows affected (0.005 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [practica]> INSERT INTO CoursesPerCycle VALUES
    -> ('MAT101', 'CYC001', '2024-01-15', '2024-06-30'),
    -> ('CS101', 'CYC001', '2024-01-15', '2024-06-30'),
    -> ('PHY101', 'CYC002', '2024-07-01', '2024-08-30'),
    -> ('CHE101', 'CYC003', '2024-09-01', '2024-12-20'),
    -> ('ENG101', 'CYC004', '2025-01-10', '2025-02-28');
Query OK, 5 rows affected (0.015 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [practica]> INSERT INTO Teachers VALUES
    -> ('T001', 'Juan Pérez', 'juanp@example.com', '555-1234'),
    -> ('T002', 'Ana Torres', 'ana.t@example.com', '555-5678'),
    -> ('T003', 'Luis Mendoza', 'luis.m@example.com', '555-9012'),
    -> ('T004', 'Carmen Rojas', 'carmen.r@example.com', '555-3456'),
    -> ('T005', 'Diego Luna', 'diego.l@example.com', '555-7890');
Query OK, 5 rows affected (0.004 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [practica]> INSERT INTO TeachersPerCourse VALUES
    -> ('MAT101', 'CYC001', 'T001'),
    -> ('CS101', 'CYC001', 'T002'),
    -> ('PHY101', 'CYC002', 'T003'),
    -> ('CHE101', 'CYC003', 'T004'),
    -> ('ENG101', 'CYC004', 'T005');
Query OK, 5 rows affected (0.010 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [practica]> INSERT INTO Students VALUES
    -> ('S001', 'Mario López', 'mario.l@example.com', '2000-04-15', '600-112233'),
    -> ('S002', 'Lucía Gómez', 'lucia.g@example.com', '2001-09-30', '600-223344'),
    -> ('S003', 'Carlos Ruiz', 'carlos.r@example.com', '1999-01-20', '600-334455'),
    -> ('S004', 'Andrea Paz', 'andrea.p@example.com', '2000-11-10', '600-445566'),
    -> ('S005', 'Sofía León', 'sofia.l@example.com', '2002-06-25', '600-556677');
Query OK, 5 rows affected (0.007 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [practica]> INSERT INTO Enrollments VALUES
    -> ('MAT101', 'CYC001', 'S001', '2024-01-10', FALSE, NULL),
    -> ('MAT101', 'CYC001', 'S002', '2024-01-10', FALSE, NULL),
    -> ('CS101', 'CYC001', 'S003', '2024-01-11', FALSE, NULL),
    -> ('CS101', 'CYC001', 'S004', '2024-01-11', FALSE, NULL),
    -> ('PHY101', 'CYC002', 'S005', '2024-06-20', FALSE, NULL);
Query OK, 5 rows affected (0.016 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [practica]> INSERT INTO Classes VALUES
    -> ('MAT101', 'CYC001', 1, 'T001', 'Álgebra básica', '2024-02-01', '08:00:00', '10:00:00'),
    -> ('MAT101', 'CYC001', 2, 'T001', 'Funciones y gráficos', '2024-02-08', '08:00:00', '10:00:00'),
    -> ('CS101', 'CYC001', 1, 'T002', 'Introducción a Python', '2024-02-02', '10:00:00', '12:00:00'),
    -> ('CS101', 'CYC001', 2, 'T002', 'Variables y tipos', '2024-02-09', '10:00:00', '12:00:00'),
    -> ('PHY101', 'CYC002', 1, 'T003', 'Cinemática', '2024-07-05', '09:00:00', '11:00:00');
Query OK, 5 rows affected (0.017 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [practica]> INSERT INTO Attendance VALUES
    -> ('MAT101', 'CYC001', 1, 'S001', '08:05:00', '10:00:00'),
    -> ('MAT101', 'CYC001', 1, 'S002', '08:00:00', '10:00:00'),
    -> ('CS101', 'CYC001', 1, 'S003', '10:00:00', '12:00:00'),
    -> ('CS101', 'CYC001', 1, 'S004', '10:10:00', '12:00:00'),
    -> ('PHY101', 'CYC002', 1, 'S005', '09:00:00', '11:00:00');
Query OK, 5 rows affected (0.004 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [practica]> INSERT INTO Tests VALUES
    -> ('MAT101', 'CYC001', 1, '2024-03-01', '09:00:00', 'Álgebra intermedia'),
    -> ('MAT101', 'CYC001', 2, '2024-04-01', '09:00:00', 'Ecuaciones lineales'),
    -> ('CS101', 'CYC001', 1, '2024-03-05', '11:00:00', 'Lógica de programación'),
    -> ('PHY101', 'CYC002', 1, '2024-08-01', '10:00:00', 'Leyes de Newton'),
    -> ('CHE101', 'CYC003', 1, '2024-10-01', '14:00:00', 'Tabla periódica');
Query OK, 5 rows affected (0.005 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [practica]> INSERT INTO TestScores VALUES
    -> ('MAT101', 'CYC001', 1, 'S001', 85.50),
    -> ('MAT101', 'CYC001', 1, 'S002', 90.00),
    -> ('MAT101', 'CYC001', 2, 'S001', 88.00),
    -> ('CS101', 'CYC001', 1, 'S003', 92.00),
    -> ('CS101', 'CYC001', 1, 'S004', 89.50);
Query OK, 5 rows affected (0.004 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [practica]> show tables;
+--------------------+
| Tables_in_practica |
+--------------------+
| attendance         |
| categories         |
| classes            |
| courses            |
| coursespercycle    |
| cycles             |
| enrollments        |
| students           |
| teachers           |
| teacherspercourse  |
| tests              |
| testscores         |
+--------------------+
12 rows in set (0.001 sec)

MariaDB [practica]> describe attendance;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| CourseId   | varchar(10) | NO   | PRI | NULL    |       |
| CycleId    | varchar(10) | NO   | PRI | NULL    |       |
| ClassNo    | int(11)     | NO   | PRI | NULL    |       |
| StudentId  | varchar(10) | NO   | PRI | NULL    |       |
| TimeArrive | time        | YES  |     | NULL    |       |
| TimeLeave  | time        | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.040 sec)
MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| app                |
| baseprueba         |
| biblioteca         |
| biblioteca2        |
| casas              |
| contactos          |
| examen             |
| examenf            |
| grupo_lunes        |
| information_schema |
| inmobiliaria       |
| mysql              |
| performance_schema |
| phpmyadmin         |
| practica           |
| pruebas            |
| restaurante        |
| sakila             |
| seguridad_ejemplo  |
| test               |
+--------------------+
20 rows in set (0.054 sec)

MariaDB [(none)]> use practica
Database changed
MariaDB [practica]> show tables;
+--------------------+
| Tables_in_practica |
+--------------------+
| attendance         |
| categories         |
| classes            |
| courses            |
| coursespercycle    |
| cycles             |
| enrollments        |
| students           |
| teachers           |
| teacherspercourse  |
| tests              |
| testscores         |
+--------------------+
12 rows in set (0.002 sec)

MariaDB [practica]> select * from attendance;
+----------+---------+---------+-----------+------------+-----------+
| CourseId | CycleId | ClassNo | StudentId | TimeArrive | TimeLeave |
+----------+---------+---------+-----------+------------+-----------+
| CS101    | CYC001  |       1 | S003      | 10:00:00   | 12:00:00  |
| CS101    | CYC001  |       1 | S004      | 10:10:00   | 12:00:00  |
| MAT101   | CYC001  |       1 | S001      | 08:05:00   | 10:00:00  |
| MAT101   | CYC001  |       1 | S002      | 08:00:00   | 10:00:00  |
| PHY101   | CYC002  |       1 | S005      | 09:00:00   | 11:00:00  |
+----------+---------+---------+-----------+------------+-----------+
5 rows in set (0.118 sec)

MariaDB [practica]> select * from courses;
+----------+-------------------------+----------------------------------------+-----------------------------+
| CourseId | CourseDescription       | Abstract                               | Bibliography                |
+----------+-------------------------+----------------------------------------+-----------------------------+
| CHE101   | Química General         | Teoría atómica y enlaces químicos.     | Brown, LeMay.               |
| CS101    | Intro a la Programación | Fundamentos de programación en Python. | Automate the Boring Stuff.  |
| ENG101   | Inglés Técnico          | Vocabulario técnico para ingeniería.   | Oxford Technical English.   |
| MAT101   | Matemáticas I           | Algebra y trigonometría básica.        | Libros de Baldor y Stewart. |
| PHY101   | Física I                | Mecánica clásica.                      | Resnick y Halliday.         |
+----------+-------------------------+----------------------------------------+-----------------------------+
5 rows in set (0.020 sec)

MariaDB [practica]> select * from cycles;
+---------+----------------------+--------------+----------------+-------------------+-----------------+
| CycleId | CycleDescription     | CycleEndDate | CycleStartDate | VacationStartDate | VacationEndDate |
+---------+----------------------+--------------+----------------+-------------------+-----------------+
| CYC001  | Ciclo Primavera 2024 | 2024-06-30   | 2024-01-15     | 2024-04-01        | 2024-04-07      |
| CYC002  | Ciclo Verano 2024    | 2024-08-30   | 2024-07-01     | NULL              | NULL            |
| CYC003  | Ciclo Otoño 2024     | 2024-12-20   | 2024-09-01     | 2024-11-01        | 2024-11-07      |
| CYC004  | Ciclo Invierno 2025  | 2025-02-28   | 2025-01-10     | NULL              | NULL            |
| CYC005  | Ciclo Especial 2025  | 2025-04-30   | 2025-03-01     | NULL              | NULL            |
+---------+----------------------+--------------+----------------+-------------------+-----------------+
5 rows in set (0.002 sec)

MariaDB [practica]> select * from enrollemnts;
ERROR 1146 (42S02): Table 'practica.enrollemnts' doesn't exist
MariaDB [practica]> select * from enrollments;
+----------+---------+-----------+----------------+-----------+--------------------+
| CourseId | CycleId | StudentId | EnrollmentDate | Cancelled | CancellationReason |
+----------+---------+-----------+----------------+-----------+--------------------+
| CS101    | CYC001  | S003      | 2024-01-11     |         0 | NULL               |
| CS101    | CYC001  | S004      | 2024-01-11     |         0 | NULL               |
| MAT101   | CYC001  | S001      | 2024-01-10     |         0 | NULL               |
| MAT101   | CYC001  | S002      | 2024-01-10     |         0 | NULL               |
| PHY101   | CYC002  | S005      | 2024-06-20     |         0 | NULL               |
+----------+---------+-----------+----------------+-----------+--------------------+
5 rows in set (0.019 sec)

MariaDB [practica]> select * from students;
+-----------+-------------+----------------------+------------+------------+
| StudentId | StudentName | Email                | BirthDate  | PhoneNo    |
+-----------+-------------+----------------------+------------+------------+
| S001      | Mario López | mario.l@example.com  | 2000-04-15 | 600-112233 |
| S002      | Lucía Gómez | lucia.g@example.com  | 2001-09-30 | 600-223344 |
| S003      | Carlos Ruiz | carlos.r@example.com | 1999-01-20 | 600-334455 |
| S004      | Andrea Paz  | andrea.p@example.com | 2000-11-10 | 600-445566 |
| S005      | Sofía León  | sofia.l@example.com  | 2002-06-25 | 600-556677 |
+-----------+-------------+----------------------+------------+------------+
5 rows in set (0.003 sec)

MariaDB [practica]> select * from teachers;
+-----------+--------------+----------------------+----------+
| TeacherId | TeacherName  | Email                | PhoneNo  |
+-----------+--------------+----------------------+----------+
| T001      | Juan Pérez   | juanp@example.com    | 555-1234 |
| T002      | Ana Torres   | ana.t@example.com    | 555-5678 |
| T003      | Luis Mendoza | luis.m@example.com   | 555-9012 |
| T004      | Carmen Rojas | carmen.r@example.com | 555-3456 |
| T005      | Diego Luna   | diego.l@example.com  | 555-7890 |
+-----------+--------------+----------------------+----------+
5 rows in set (0.003 sec)

MariaDB [practica]> select * from teacherspercourse;
+----------+---------+-----------+
| CourseId | CycleId | TeacherId |
+----------+---------+-----------+
| CHE101   | CYC003  | T004      |
| CS101    | CYC001  | T002      |
| ENG101   | CYC004  | T005      |
| MAT101   | CYC001  | T001      |
| PHY101   | CYC002  | T003      |
+----------+---------+-----------+
5 rows in set (0.002 sec)

MariaDB [practica]> select * from tests;
+----------+---------+--------+------------+----------+------------------------+
| CourseId | CycleId | TestNo | TestDate   | TestTime | Agenda                 |
+----------+---------+--------+------------+----------+------------------------+
| CHE101   | CYC003  |      1 | 2024-10-01 | 14:00:00 | Tabla periódica        |
| CS101    | CYC001  |      1 | 2024-03-05 | 11:00:00 | Lógica de programación |
| MAT101   | CYC001  |      1 | 2024-03-01 | 09:00:00 | Algebra intermedia     |
| MAT101   | CYC001  |      2 | 2024-04-01 | 09:00:00 | Ecuaciones lineales    |
| PHY101   | CYC002  |      1 | 2024-08-01 | 10:00:00 | Leyes de Newton        |
+----------+---------+--------+------------+----------+------------------------+
5 rows in set (0.002 sec)

MariaDB [practica]> select * from testscores;
+----------+---------+--------+-----------+-------+
| CourseId | CycleId | TestNo | StudentId | Score |
+----------+---------+--------+-----------+-------+
| CS101    | CYC001  |      1 | S003      | 92.00 |
| CS101    | CYC001  |      1 | S004      | 89.50 |
| MAT101   | CYC001  |      1 | S001      | 85.50 |
| MAT101   | CYC001  |      1 | S002      | 90.00 |
| MAT101   | CYC001  |      2 | S001      | 88.00 |
+----------+---------+--------+-----------+-------+
5 rows in set (0.021 sec)

MariaDB [practica]> select * from categories;
+------------+------------------+
| CategoryId | CategoryDescri   |
+------------+------------------+
| CAT01      | Ciencias Exactas |
| CAT02      | Tecnología       |
| CAT03      | Humanidades      |
| CAT04      | Idiomas          |
| CAT05      | Ingeniería       |
+------------+------------------+
5 rows in set (0.022 sec)

MariaDB [practica]> select * from classes;
+----------+---------+---------+-----------+-----------------------+------------+-----------+----------+
| CourseId | CycleId | ClassNo | TeacherId | ClassTitle            | ClassDate  | StartTime | EndTime  |
+----------+---------+---------+-----------+-----------------------+------------+-----------+----------+
| CS101    | CYC001  |       1 | T002      | Introducción a Python | 2024-02-02 | 10:00:00  | 12:00:00 |
| CS101    | CYC001  |       2 | T002      | Variables y tipos     | 2024-02-09 | 10:00:00  | 12:00:00 |
| MAT101   | CYC001  |       1 | T001      | Algebra básica        | 2024-02-01 | 08:00:00  | 10:00:00 |
| MAT101   | CYC001  |       2 | T001      | Funciones y gráficos  | 2024-02-08 | 08:00:00  | 10:00:00 |
| PHY101   | CYC002  |       1 | T003      | Cinemática            | 2024-07-05 | 09:00:00  | 11:00:00 |
+----------+---------+---------+-----------+-----------------------+------------+-----------+----------+
5 rows in set (0.022 sec)

MariaDB [practica]> select * from coursespercycle;
+----------+---------+-----------------+---------------+
| CourseId | CycleId | CourseStartDate | CourseEndDate |
+----------+---------+-----------------+---------------+
| CHE101   | CYC003  | 2024-09-01      | 2024-12-20    |
| CS101    | CYC001  | 2024-01-15      | 2024-06-30    |
| ENG101   | CYC004  | 2025-01-10      | 2025-02-28    |
| MAT101   | CYC001  | 2024-01-15      | 2024-06-30    |
| PHY101   | CYC002  | 2024-07-01      | 2024-08-30    |
+----------+---------+-----------------+---------------+
5 rows in set (0.021 sec)