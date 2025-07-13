#CTEs
USE Parks_and_Recreation;

WITH CTE_Example AS 
(
SELECT gender, AVG(salary) AS avg_sal, MAX(salary) AS max_sal, MIN(salary) AS min_sal, COUNT(salary) AS count_sal
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal)
FROM CTE_Example
;

#2 CTE Example
WITH CTE_Example AS 
(
SELECT employee_id, gender, birth_date
FROM employee_demographics AS dem
WHERE birth_date > '1985-01-01'
),
CTE_Example_2 AS
(
SELECT *
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example_2
ON CTE_Example.employee_id = CTE_Example_2.employee_id
;

