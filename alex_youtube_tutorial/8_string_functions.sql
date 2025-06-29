# STRING Functions

USE Parks_and_Recreation;

SELECT LENGTH('hello'); #Returns the length of a string

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY LENGTH(first_name) DESC;

SELECT UPPER(first_name)
FROM employee_demographics;

SELECT LOWER('HELLO');

SELECT TRIM(' Hello '); #LTRIM/RTRIM for removing whitespaces from only left or right side

SELECT first_name, 
LEFT(first_name, 4) AS left_4, #Select only 4 characters from left hand side
RIGHT(first_name, 4) AS right_4,
SUBSTRING(first_name, 3, 2) AS substring,
LEFT(birth_date, 4) AS birth_year,
SUBSTRING(birth_date, 6, 2) AS birth_month
FROM employee_demographics;

SELECT first_name, REPLACE(first_name, 'a', 'z') #Replace all a with z
FROM employee_demographics;

SELECT REVERSE(first_name) AS reversed_first
FROM employee_demographics;

SELECT first_name, LOCATE('An', first_name) AS has_An
FROM employee_demographics
WHERE LOCATE('An', first_name) > 0;

SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;


