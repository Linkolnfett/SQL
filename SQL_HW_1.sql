--1.Создать таблицу employees
Create table employees (
id serial PRIMARY KEY,
employee_name VARCHAR(50) not null);
--2. Наполнить таблицу employee 70 строками.
Insert into employees(employee_name)
select 'employee_' || generate_series(1, 70);
--3. Создать таблицу salary
Create table salary
(id serial PRIMARY key, monthly_salary int not null);
--4. Наполнить таблицу salary 15 строками:
Insert into salary (monthly_salary)
values (1000), (1100), (1200), (1300), (1400),
(1500), (1600), (1700), (1800), (1900), (2000),
(2100), (2200), (2300), (2400), (2500);
--ver 2. select 1000 + 100 * generate_series(0, 15)
--5. Создать таблицу employee_salary
create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null
);
--6. Наполнить таблицу employee_salary 40 строками
Insert into employee_salary(employee_id,salary_id)				
values (3,7),(1,4),(5,9),(40,13),(23,4),(11,2),(52,10),(15,13),(26,4),(16,1),(33,7),(2,11),(4,14),(45,8),(6,3),(7,2),(8,14),(9,12),(10,7),(12,9),(13,6),
(14,14),(17,2),(18,5),(19,7),(22,12),(20,1),(21,10),(29,8),(44,1),(111,1),(121,7),(143,11),(196,15),(214,1),(247,8),(256,9),(278,4),(301,13),(333,15); 
--7. Создать таблицу roles
create table roles(
id serial primary key,
role_name int not null unique
);
--8. Поменять тип столба role_name с int на varchar(30)
alter table roles alter column role_name type varchar(30);
--9. Наполнить таблицу roles 20 строками:
insert into roles (role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');
--10. Создать таблицу roles_employee
create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id) references employees(id),
foreign key (role_id) references roles(id)
);
--11. Наполнить таблицу roles_employee 40 строками:
insert into roles_employee (employee_id, role_id)
values (7,2),(20,4),(3,9),(5,13),(23,4),(11,2),(10,9),(22,13),(21,3),(34,4),
(6,7),(1,1),(2,11),(4,6),(8,13),(9,4),(12,14),(13,20),(14,16),(15,18),
(16,9),(17,7),(18,5),(19,18),(24,11),(25,2),(26,16),(27,4),(28,7),(29,5),
(30,7),(31,15),(32,19),(33,2),(40,5),(35,11),(36,19),(37,17),(38,10),(39,1);