#Stored Procedures
USE Parks_and_Recreation;

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries();

DELIMITER $$
CREATE PROCEDURE large_salaries_2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
    SELECT *
    FROM employee_salary
    WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries_2();

#Parameters
DELIMITER $$
CREATE PROCEDURE large_salaries_4(emp_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = emp_id;
END $$
DELIMITER ;

CALL large_salaries_4(1)
