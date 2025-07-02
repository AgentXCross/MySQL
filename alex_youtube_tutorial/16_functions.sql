#FUNCTIONS

SELECT *
FROM employee_demographics;

UPDATE employee_demographics
SET age = 18, gender = 'Male', birth_date = '2007-05-02'
WHERE employee_id = 13;

SELECT * 
FROM employee_salary;

#Calculate bonuses
DELIMITER $$
CREATE FUNCTION calculate_bonus(salary INT, emp_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
	IF emp_id = 13 THEN return 0.2 * salary;
	ELSE return 0.1 * salary;
    END IF;
END $$
DELIMITER ;

SELECT employee_id, first_name, last_name, salary, calculate_bonus(salary, employee_id) as bonus
FROM employee_salary;

#Apply the bonus and add the the employee_salary table
SET SQL_SAFE_UPDATES = 0;

ALTER TABLE employee_salary
ADD COLUMN bonus INT;

UPDATE employee_salary
SET bonus = calculate_bonus(salary, employee_id);

SELECT *
FROM employee_salary;

SET SQL_SAFE_UPDATES = 1;






