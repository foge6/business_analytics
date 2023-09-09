USE hw6;
-- Question 1

DELIMITER //
CREATE FUNCTION second_days(sec INT)
RETURNS VARCHAR(2000)
DETERMINISTIC
BEGIN
	DECLARE res VARCHAR(200) DEFAULT '';
	DECLARE days INT DEFAULT 0;
	DECLARE hours INT DEFAULT 0;
	DECLARE minut INT DEFAULT 0;
	
    WHILE 60*60*24 < sec DO
		SET sec = sec - 60*60*24;
        SET days = days + 1;
	END WHILE;
	
	WHILE 60*60 < sec DO
		SET sec = sec - 60*60;
        SET hours = hours + 1;
	END WHILE;
    
    WHILE 60 < sec DO
		SET sec = sec - 60;
        SET minut = minut + 1;
	END WHILE;
    
    SET res = CONCAT(days, ' days ', hours, ' hours ', minut, ' minut ', sec, ' sec ');
	RETURN res;
END//
DELIMITER ;
SELECT second_days(123456);

-- Question 2
DELIMITER //
CREATE PROCEDURE find()
BEGIN
	DECLARE res VARCHAR(200);
    DECLARE numb INT;
    DECLARE end_ INT;
    SET numb = 2;
    SET end_ = 10;
    SET res = '';
    
    REPEAT 
		SET res = CONCAT(res,numb, ' ');
        SET numb = numb + 2;
        UNTIL numb > end_
	END REPEAT;
    
    SELECT res;
END//
DELIMITER ;
CALL find();

