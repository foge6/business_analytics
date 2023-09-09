USE hw2;

CREATE TABlE sales (
	id SERIAL PRIMARY KEY,
	order_date DATE NOT NULL,
	count_prod INT NOT NULL
);

INSERT INTO sales (order_date, count_prod)
VALUES
('2022-01-01',156),
('2022-01-02',180),
('2022-01-03',21),
('2022-01-04',124),
('2022-01-05',341);

SELECT * FROM sales;

SELECT order_date,count_prod,
	CASE 
		WHEN count_prod<100 THEN 'Маленький заказ'
		WHEN count_prod>=100 and count_prod<=300 THEN 'Средний заказ'
		WHEN count_prod>300 THEN 'Большой заказ'
		ELSE 'FAIL'
		END AS sales
FROM sales;
SELECT * FROM sales;

CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
    employee_id VARCHAR(3) NOT NULL,
    amount FLOAT8 NOT NULL,
    order_status VARCHAR(15) NOT NULL
);
INSERT INTO orders (employee_id,amount,order_status)
VALUES 
('e03',15.00,'OPEN'),
('e01',25.50,'OPEN'),
('e05',100.70,'CLOSED'),
('e02',22.18,'OPEN'),
('e04',9.50,'CANCELLED');
SELECT employee_id,amount,order_status,
	CASE order_status
		WHEN 'OPEN' THEN 'Order is in open state'
        WHEN 'CLOSED' THEN 'Order is closed'
        WHEN 'CANCELLED' THEN 'Order is cancelled'
        ELSE 'Fail'
	END AS full_order_status
FROM orders;
        
        
    