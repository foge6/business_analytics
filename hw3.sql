USE hw3;

CREATE TABLE salespeople (
ids SERIAL PRIMARY KEY,
snum INT,
sname VARCHAR(20),
city VARCHAR(20),
comm VARCHAR(5)
);

INSERT INTO salespeople (snum,sname,city,comm)
VALUES
(1001,'Peel','London','.12'),
(1002,'Serres','SanJose','.13'),
(1003,'Motika','London','.11'),
(1007,'Rifkin','Barcelona','.15'),
(1003,'Axelrod','NewYork','.10');
SELECT city,sname,snum,comm FROM salespeople;
SELECT DISTINCT snum FROM salespeople;

CREATE TABLE customers (
idc SERIAL PRIMARY KEY,
cnum INT,
cname VARCHAR(20),
city VARCHAR(20),
rating INT,
snmm INT
);

INSERT INTO customers (cnum,cname,city,rating,snmm)
VALUES
(2001,'Hoffman','London',100,1001),
(2002,'Giovanni','Rome',200,1003),
(2003,'Liu','SanJose',200,1002),
(2004,'Grass','Berlin',300,1002),
(2006,'Clemens','London',100,1001),
(2008,'Cisneros','SanJose',300,1007),
(2007,'Pereira','Rome',100,1004);
SELECT cname, rating, city 
FROM customers
WHERE rating>100 AND NOT city = 'Rome';

Select rating,cname,city 
FROM customers
WHERE city='SanJose';
SELECT cname 
FROM customers
WHERE cname LIKE 'G%';

CREATE TABLE orders (
idc SERIAL PRIMARY KEY,
onum INT,
amt FLOAT8,
odate DATE,
cnum INT,
snmm INT
);

INSERT INTO orders (onum,amt,odate,cnum,snmm)
VALUES
(3001,18.69,'1990-10-03',2008,1007),
(3002,767.19,'1990-10-03',2001,1001),
(3003,1900.10,'1990-10-03',2007,1004),
(3004,5160.45,'1990-10-03',2003,1002),
(3006,1098.16,'1990-10-03',2008,1007),
(3008,1713.23,'1990-10-04',2002,1003),
(3007,75.75,'1990-10-04',2004,1002),
(3007,4723.00,'1990-10-05',2006,1001),
(3007,1309.95,'1990-10-06',2004,1002),
(3007,9891.88,'1990-10-06',2006,1001);
SELECT amt 
FROM orders
WHERE amt>1000;
SELECT MIN(amt) AS min FROM orders;

CREATE TABLE lesson (
id SERIAL PRIMARY KEY,
name VARCHAR(20),
surname VARCHAR(20),
specialty VARCHAR(20),
seniority INT,
salary INT,
age INT
);

INSERT INTO lesson (name,surname,specialty,seniority,salary,age)
VALUES
('Вася','Васькин','Начальник',40,100000,60),
('Петя','Петькин','Начальник',8,70000,30),
('Катя','Каткина','Иженер',2,70000,25),
('Саша','Сашкин','Иженер',12,50000,35),
('Иван','Иванов','Рабочий',40,30000,59),
('Петр','Петров','Рабочий',20,25000,40),
('Сидор','Сидоров','Рабочий',10,20000,35),
('Антон','Антонов','Рабочий',8,19000,28),
('Юра','Юркин','Рабочий',5,15000,25),
('Максим','Вороник','Рабочий',2,11000,22),
('Юра','Галкин','Рабочий',3,12000,24),
('Люся','Люськина','Уборщик',10,10000,49);

SELECT * 
FROM lesson 
ORDER BY salary;
SELECT * 
FROM lesson 
ORDER BY salary DESC;
SELECT * 
FROM lesson 
ORDER BY salary
LIMIT 7,5;
SELECT specialty
FROM lesson 
WHERE salary>10000
GROUP BY specialty;


