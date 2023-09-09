USE hw5;

-- Questin 1:

CREATE TABLE cars
(	id INT PRIMARY KEY,
	name VARCHAR(15),
    cost INT
);

INSERT INTO cars (id, name, cost) VALUES
	(1,'Audi',52642),
	(2,'Mersedes',57127),
	(3,'Skoda',9000),
	(4,'Volvo',29000),
	(5,'Bentley',350000),
	(6,'Sitroen',21000),
	(7,'Hummer',41400),
	(8,'Volkswagen',21600);
SELECT * FROM cars;

CREATE VIEW cost_cars AS 
	SELECT *
    FROM cars
		WHERE cost < 25000;
SELECT * FROM cost_cars;

-- Questin 2:

ALTER VIEW cost_cars AS
	SELECT *
    FROM cars
		WHERE cost < 30000;
SELECT * FROM cost_cars;

-- Questin 3:
CREATE VIEW cars_sk_au AS 
	SELECT *
    FROM cars
		WHERE name IN ('skoda', 'Audi');
SELECT * FROM cars_sk_au;

-- Questin 4:
CREATE TABLE Analysis
(	an_id INT PRIMARY KEY,
	an_name VARCHAR(15),
    an_cost INT,
    an_price INT,
    an_group INT
);
CREATE TABLE gro_ups
(	gr_id INT PRIMARY KEY,
	gr_name VARCHAR(15),
    gr_temp VARCHAR(15)
);
CREATE TABLE orders
(	ord_id INT PRIMARY KEY,
	ord_datatime DATETIME,
    ord_an INT
);
INSERT INTO Analysis (an_id, an_name, an_cost, an_price, an_group) VALUES
	(1,'gr',10,15,10),
	(2,'cr',12,18,20),
	(3,'vr',14,19,30);
INSERT INTO gro_ups (gr_id, gr_name, gr_temp) VALUES
	(10,'g','cold'),
	(20,'c','warm'),
	(30,'v','hot');
INSERT INTO orders (ord_id, ord_datatime, ord_an) VALUES
	(100, '2020-01-25 22:13:15',1),
	(200, '2020-02-05 20:12:11',2),
	(300,'2020-02-06 19:03:16',3);

CREATE VIEW analysis_groups AS 
	SELECT *
		FROM  Analysis a
		JOIN gro_ups g ON a.an_group = g.gr_id;

CREATE VIEW analysis_groups_orders AS
	SELECT *
		FROM  analysis_groups a
		JOIN orders o ON a.an_id = o.ord_an;
SELECT * FROM analysis_groups_orders;

SELECT an_name, an_price 
	FROM analysis_groups_orders
		WHERE ord_datatime BETWEEN '2020-02-05 00:00:00' AND '2020-02-12 23:59:59';

-- Questin 5:

CREATE TABLE train 
(	traint_id INT,
	station VARCHAR(20),
    station_time TIME
);
INSERT INTO train (traint_id,station,station_time) VALUES
	(110,'San Francisco', '10:00:00'),
	(110,'Redwood city', '10:54:00'),
	(110,'Palo Alto', '11:02:00'),
	(110,'San Jose', '12:35:00'),
	(120,'San Francisco', '11:00:00'),
	(120,'Palo Alto', '12:49:00'),
	(120,'San Jose', '13:30:00');



SELECT *, 
	TIMEDIFF(
			LEAD (station_time, 1)  OVER (PARTITION BY traint_id ORDER BY station_time), station_time
			) 
	AS time_to_next_station
FROM train;

		
