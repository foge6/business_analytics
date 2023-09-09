USE hw4;
CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM ) VALUES
	(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
	(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
	(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
	(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
	(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
	(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
	(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null),
	(111117,'BMW', 'СИНИЙ', date'2005-01-01', null),
	(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);
    
-- Question 1

SELECT mark,color, COUNT(*) AS count
	FROM AUTO
		WHERE MARK = 'LADA'
		GROUP BY color
UNION ALL
SELECT mark,color, COUNT(*) AS count
	FROM AUTO
		WHERE MARK = 'BMW'
		GROUP BY color;
        
-- Question 2

SELECT A.mark, (SELECT COUNT(*) FROM AUTO WHERE mark <> A.mark) AS total_cars
FROM AUTO A
LIMIT 1,1;

-- Question 3

CREATE TABLE test_a (id INT, data varchar(1));
create table test_b (id INT);

insert into test_a(id, data) values
	(10, 'A'),
	(20, 'A'),
	(30, 'F'),
	(40, 'D'),
	(50, 'C');
insert into test_b(id) values
	(10),
	(30),
	(50);

SELECT a.data 
	FROM test_a a
	LEFT JOIN test_b b ON a.id = b.id
		WHERE b.id IS NULL




