#CASE Statements
USE Parks_and_Recreation;

SELECT first_name, last_name, age,
CASE
	WHEN age <= 30 THEN 'young'
    WHEN age BETWEEN 31 and 50 THEN 'older'
    WHEN age >= 51 THEN 'very old'
END AS age_description
FROM employee_demographics;

#Pay increase and bonus
#Less than 50k then 5% increase, more than 50k then 7% increase
#If in finance department then 10% bonus
SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary,
CASE
	WHEN salary < 50000 THEN (salary * 1.05)
    WHEN salary >= 50000 THEN (salary * 1.07)
END AS new_salary,
CASE
	WHEN parks_departments.department_name = 'Finance' THEN salary * .10
    ELSE 0
END AS bonus
FROM employee_salary
JOIN parks_departments on employee_salary.dept_id = parks_departments.department_id;

