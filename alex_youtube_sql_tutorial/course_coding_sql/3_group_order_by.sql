#GROUP BY

USE Parks_and_Recreation;

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;


SELECT occupation, AVG(salary) #grouping by occupation and showing the avg salary per occupation
FROM employee_salary
GROUP BY occupation;

SELECT gender, AVG(age), MAX(age), STDDEV(age), COUNT(gender)
FROM employee_demographics
GROUP BY gender;

#ORDER BY
SELECT *
FROM employee_demographics
ORDER BY first_name DESC;

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC;


