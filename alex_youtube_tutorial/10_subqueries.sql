#SUBQUERIES
USE Parks_and_Recreation;

SELECT * #Subquery in a where statement
FROM employee_demographics
WHERE employee_id IN (
	SELECT employee_id
    FROM employee_salary
    WHERE dept_id = 1
);

SELECT first_name, salary, #Subquery in a select statement
(SELECT AVG(salary) 
FROM employee_salary) AS avg_salary
FROM employee_salary;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age) #Subquery in a from statement
FROM employee_demographics
GROUP BY gender;

#Move it into a from statement
SELECT gender, AVG(max_age)
FROM (
	SELECT gender, AVG(age) AS avg_age, MAX(age) AS max_age, MIN(age) AS min_age, COUNT(age) AS count
	FROM employee_demographics
	GROUP BY gender) AS aggregated_table
GROUP BY gender;

