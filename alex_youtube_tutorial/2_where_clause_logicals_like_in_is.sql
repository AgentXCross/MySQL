#WHERE Clause

USE Parks_and_Recreation;

SELECT *
FROM employee_salary
WHERE first_name = 'Leslie'; #Conditional statement

SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM employee_demographics
WHERE NOT gender = 'female';

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01';

#Logical Operators: AND OR NOT
SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01' OR NOT gender = 'male';

SELECT * 
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55;

#LIKE Statement (looks for patterns)
# % and_ 

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%a';

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___';

#IN and IS Operator
#IN looks in a list for values
#IS is equivalent to = except for NULL, IS must be used for NULL

SELECT *
FROM employee_demographics
WHERE first_name IN ('Leslie', 'Tom', 'April') OR first_name IS NULL;









