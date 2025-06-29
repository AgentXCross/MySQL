#SELECT Statement

USE Parks_and_Recreation; #Specify the database

SELECT * #Select everything from employee demographics
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT first_name, #Selecting specfic lines
last_name, 
birth_date,
age,
age + 10 AS age_in_ten
FROM employee_demographics;

SELECT DISTINCT gender
FROM employee_demographics;

