#LIMIT and ALIASING
#LIMIT limits the number of rows in output

USE Parks_and_Recreation;
SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

SELECT gender, AVG(age) AS average_age
FROM employee_demographics
GROUP BY gender
HAVING average_age > 40;